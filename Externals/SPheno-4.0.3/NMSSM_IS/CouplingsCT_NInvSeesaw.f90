! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:22 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module CouplingsCT_NInvSeesaw
 
Use Control 
Use Settings 
Use Model_Data_NInvSeesaw 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine CalculateCouplingCT(lam,Tlam,kap,Tk,vd,vu,vS,ZA,g1,g2,ZH,ZP,               & 
& Yd,Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,MUX,lamN,TLN,Yv,Tv,ZVI,ZVR,TW,g3,UM,UP,ZN,ZDL,              & 
& ZDR,ZEL,ZER,ZUL,ZUR,UV,pG,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dZA,dg1,dg2,dZH,             & 
& dZP,dYd,dTd,dZD,dYe,dTe,dZE,dYu,dTu,dZU,dMUX,dlamN,dTLN,dYv,dTv,dZVI,dZVR,             & 
& dSinTW,dCosTW,dTanTW,dg3,dUM,dUP,dZN,dZDL,dZDR,dZEL,dZER,dZUL,dZUR,dUV,dpG,            & 
& ctcplAhAhAh,ctcplAhAhhh,ctcplAhhhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,ctcplAhSecSe,          & 
& ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,ctcplhhhhhh,              & 
& ctcplhhHpmcHpm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,ctcplhhSvImSvRe, & 
& ctcplhhSvReSvRe,ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,ctcplSdcHpmcSu,          & 
& ctcplSeSvImcHpm,ctcplSeSvRecHpm,ctcplAhhhVZ,ctcplAhHpmcVWm,ctcplAhcHpmVWm,             & 
& ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,ctcplSdcSdVG,              & 
& ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSucVWm,ctcplSeSvImcVWm,ctcplSeSvRecVWm,              & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSucSuVG,ctcplSucSuVP,ctcplSucSdVWm,ctcplSucSuVZ,        & 
& ctcplSvImSvReVZ,ctcplSvImcSeVWm,ctcplSvRecSeVWm,ctcplhhcVWmVWm,ctcplhhVZVZ,            & 
& ctcplHpmcVWmVP,ctcplHpmcVWmVZ,ctcplcHpmVPVWm,ctcplcHpmVWmVZ,ctcplVGVGVG,               & 
& ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplChiChiAhL,          & 
& ctcplChiChiAhR,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,  & 
& ctcplcFuFuAhR,ctcplFvFvAhL,ctcplFvFvAhR,ctcplChiChacHpmL,ctcplChiChacHpmR,             & 
& ctcplChaFucSdL,ctcplChaFucSdR,ctcplFvChacSeL,ctcplFvChacSeR,ctcplcChaChahhL,           & 
& ctcplcChaChahhR,ctcplcFdChaSuL,ctcplcFdChaSuR,ctcplcFeChaSvImL,ctcplcFeChaSvImR,       & 
& ctcplcFeChaSvReL,ctcplcFeChaSvReR,ctcplChiChihhL,ctcplChiChihhR,ctcplChiFdcSdL,        & 
& ctcplChiFdcSdR,ctcplChiFecSeL,ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,            & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,ctcplChiFvSvReL,ctcplChiFvSvReR,ctcplcChaChiHpmL,      & 
& ctcplcChaChiHpmR,ctcplcFdChiSdL,ctcplcFdChiSdR,ctcplcFeChiSeL,ctcplcFeChiSeR,          & 
& ctcplcFuChiSuL,ctcplcFuChiSuR,ctcplGluFdcSdL,ctcplGluFdcSdR,ctcplcFdFdhhL,             & 
& ctcplcFdFdhhR,ctcplcChaFdcSuL,ctcplcChaFdcSuR,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,         & 
& ctcplFvFecHpmL,ctcplFvFecHpmR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcChaFeSvImL,            & 
& ctcplcChaFeSvImR,ctcplcChaFeSvReL,ctcplcChaFeSvReR,ctcplGluFucSuL,ctcplGluFucSuR,      & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFuHpmL,ctcplcFdFuHpmR,ctcplFvFvhhL,ctcplFvFvhhR,   & 
& ctcplcFeFvHpmL,ctcplcFeFvHpmR,ctcplcChaFvSeL,ctcplcChaFvSeR,ctcplcFdGluSdL,            & 
& ctcplcFdGluSdR,ctcplcFuGluSuL,ctcplcFuGluSuR,ctcplcChacFuSdL,ctcplcChacFuSdR,          & 
& ctcplChiChacVWmL,ctcplChiChacVWmR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,     & 
& ctcplcChaChaVZR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplcChaChiVWmL,ctcplcChaChiVWmR,       & 
& ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,   & 
& ctcplcFuFdcVWmL,ctcplcFuFdcVWmR,ctcplFvFecVWmL,ctcplFvFecVWmR,ctcplcFeFeVPL,           & 
& ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,   & 
& ctcplcFuFuVPR,ctcplcFdFuVWmL,ctcplcFdFuVWmR,ctcplcFuFuVZL,ctcplcFuFuVZR,               & 
& ctcplFvFvVZL,ctcplFvFvVZR,ctcplcFeFvVWmL,ctcplcFeFvVWmR,ctcplGluGluVGL,ctcplGluGluVGR)

Implicit None 
Real(dp), Intent(in) :: vd,vu,vS,ZA(3,3),g1,g2,ZH(3,3),ZP(2,2),TW,g3,dvd,dvu,dvS,dZA(3,3),dg1,dg2,            & 
& dZH(3,3),dZP(2,2),dSinTW,dCosTW,dTanTW,dg3

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,Yd(3,3),Td(3,3),ZD(6,6),Ye(3,3),Te(3,3),ZE(6,6),Yu(3,3),              & 
& Tu(3,3),ZU(6,6),MUX(3,3),lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVI(9,9),ZVR(9,9),         & 
& UM(2,2),UP(2,2),ZN(5,5),ZDL(3,3),ZDR(3,3),ZEL(3,3),ZER(3,3),ZUL(3,3),ZUR(3,3),         & 
& UV(9,9),pG,dlam,dTlam,dkap,dTk,dYd(3,3),dTd(3,3),dZD(6,6),dYe(3,3),dTe(3,3),           & 
& dZE(6,6),dYu(3,3),dTu(3,3),dZU(6,6),dMUX(3,3),dlamN(3,3),dTLN(3,3),dYv(3,3),           & 
& dTv(3,3),dZVI(9,9),dZVR(9,9),dUM(2,2),dUP(2,2),dZN(5,5),dZDL(3,3),dZDR(3,3),           & 
& dZEL(3,3),dZER(3,3),dZUL(3,3),dZUR(3,3),dUV(9,9),dpG

Complex(dp), Intent(out) :: ctcplAhAhAh(3,3,3),ctcplAhAhhh(3,3,3),ctcplAhhhhh(3,3,3),ctcplAhHpmcHpm(3,2,2),       & 
& ctcplAhSdcSd(3,6,6),ctcplAhSecSe(3,6,6),ctcplAhSucSu(3,6,6),ctcplAhSvImSvIm(3,9,9),    & 
& ctcplAhSvImSvRe(3,9,9),ctcplAhSvReSvRe(3,9,9),ctcplhhhhhh(3,3,3),ctcplhhHpmcHpm(3,2,2),& 
& ctcplhhSdcSd(3,6,6),ctcplhhSecSe(3,6,6),ctcplhhSucSu(3,6,6),ctcplhhSvImSvIm(3,9,9),    & 
& ctcplhhSvImSvRe(3,9,9),ctcplhhSvReSvRe(3,9,9),ctcplHpmSucSd(2,6,6),ctcplHpmSvImcSe(2,9,6),& 
& ctcplHpmSvRecSe(2,9,6),ctcplSdcHpmcSu(6,2,6),ctcplSeSvImcHpm(6,9,2),ctcplSeSvRecHpm(6,9,2),& 
& ctcplAhhhVZ(3,3),ctcplAhHpmcVWm(3,2),ctcplAhcHpmVWm(3,2),ctcplhhHpmcVWm(3,2),          & 
& ctcplhhcHpmVWm(3,2),ctcplHpmcHpmVP(2,2),ctcplHpmcHpmVZ(2,2),ctcplSdcSdVG(6,6),         & 
& ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSucVWm(6,6),ctcplSeSvImcVWm(6,9),          & 
& ctcplSeSvRecVWm(6,9),ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSucSuVG(6,6),            & 
& ctcplSucSuVP(6,6),ctcplSucSdVWm(6,6),ctcplSucSuVZ(6,6),ctcplSvImSvReVZ(9,9),           & 
& ctcplSvImcSeVWm(9,6),ctcplSvRecSeVWm(9,6),ctcplhhcVWmVWm(3),ctcplhhVZVZ(3),            & 
& ctcplHpmcVWmVP(2),ctcplHpmcVWmVZ(2),ctcplcHpmVPVWm(2),ctcplcHpmVWmVZ(2),               & 
& ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcChaChaAhL(2,2,3),ctcplcChaChaAhR(2,2,3),& 
& ctcplChiChiAhL(5,5,3),ctcplChiChiAhR(5,5,3),ctcplcFdFdAhL(3,3,3),ctcplcFdFdAhR(3,3,3), & 
& ctcplcFeFeAhL(3,3,3),ctcplcFeFeAhR(3,3,3),ctcplcFuFuAhL(3,3,3),ctcplcFuFuAhR(3,3,3),   & 
& ctcplFvFvAhL(9,9,3),ctcplFvFvAhR(9,9,3),ctcplChiChacHpmL(5,2,2),ctcplChiChacHpmR(5,2,2),& 
& ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6),ctcplFvChacSeL(9,2,6),ctcplFvChacSeR(9,2,6),& 
& ctcplcChaChahhL(2,2,3),ctcplcChaChahhR(2,2,3),ctcplcFdChaSuL(3,2,6),ctcplcFdChaSuR(3,2,6),& 
& ctcplcFeChaSvImL(3,2,9),ctcplcFeChaSvImR(3,2,9),ctcplcFeChaSvReL(3,2,9),               & 
& ctcplcFeChaSvReR(3,2,9),ctcplChiChihhL(5,5,3),ctcplChiChihhR(5,5,3),ctcplChiFdcSdL(5,3,6),& 
& ctcplChiFdcSdR(5,3,6),ctcplChiFecSeL(5,3,6),ctcplChiFecSeR(5,3,6),ctcplChiFucSuL(5,3,6),& 
& ctcplChiFucSuR(5,3,6),ctcplChiFvSvImL(5,9,9),ctcplChiFvSvImR(5,9,9),ctcplChiFvSvReL(5,9,9),& 
& ctcplChiFvSvReR(5,9,9),ctcplcChaChiHpmL(2,5,2),ctcplcChaChiHpmR(2,5,2),ctcplcFdChiSdL(3,5,6),& 
& ctcplcFdChiSdR(3,5,6),ctcplcFeChiSeL(3,5,6),ctcplcFeChiSeR(3,5,6),ctcplcFuChiSuL(3,5,6),& 
& ctcplcFuChiSuR(3,5,6),ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6),ctcplcFdFdhhL(3,3,3),    & 
& ctcplcFdFdhhR(3,3,3),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),ctcplcFuFdcHpmL(3,3,2),& 
& ctcplcFuFdcHpmR(3,3,2),ctcplFvFecHpmL(9,3,2),ctcplFvFecHpmR(9,3,2),ctcplcFeFehhL(3,3,3),& 
& ctcplcFeFehhR(3,3,3),ctcplcChaFeSvImL(2,3,9),ctcplcChaFeSvImR(2,3,9),ctcplcChaFeSvReL(2,3,9),& 
& ctcplcChaFeSvReR(2,3,9),ctcplGluFucSuL(3,6),ctcplGluFucSuR(3,6),ctcplcFuFuhhL(3,3,3),  & 
& ctcplcFuFuhhR(3,3,3),ctcplcFdFuHpmL(3,3,2),ctcplcFdFuHpmR(3,3,2),ctcplFvFvhhL(9,9,3),  & 
& ctcplFvFvhhR(9,9,3),ctcplcFeFvHpmL(3,9,2),ctcplcFeFvHpmR(3,9,2),ctcplcChaFvSeL(2,9,6), & 
& ctcplcChaFvSeR(2,9,6),ctcplcFdGluSdL(3,6),ctcplcFdGluSdR(3,6),ctcplcFuGluSuL(3,6),     & 
& ctcplcFuGluSuR(3,6),ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),ctcplChiChacVWmL(5,2),& 
& ctcplChiChacVWmR(5,2),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),  & 
& ctcplcChaChaVZR(2,2),ctcplChiChiVZL(5,5),ctcplChiChiVZR(5,5),ctcplcChaChiVWmL(2,5),    & 
& ctcplcChaChiVWmR(2,5),ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3)

Complex(dp), Intent(out) :: ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),ctcplcFdFdVZR(3,3),ctcplcFuFdcVWmL(3,3),         & 
& ctcplcFuFdcVWmR(3,3),ctcplFvFecVWmL(9,3),ctcplFvFecVWmR(9,3),ctcplcFeFeVPL(3,3),       & 
& ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFuFuVGL(3,3),           & 
& ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),ctcplcFdFuVWmL(3,3),          & 
& ctcplcFdFuVWmR(3,3),ctcplcFuFuVZL(3,3),ctcplcFuFuVZR(3,3),ctcplFvFvVZL(9,9),           & 
& ctcplFvFvVZR(9,9),ctcplcFeFvVWmL(3,9),ctcplcFeFvVWmR(3,9),ctcplGluGluVGL,              & 
& ctcplGluGluVGR

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateCouplingCT'
 
ctcplAhAhAh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingAhAhAh(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZA,dlam,dTlam,            & 
& dkap,dTk,dvd,dvu,dvS,dZA,ctcplAhAhAh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingAhAhhh(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,              & 
& dg1,dg2,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dZH,dZA,ctcplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingAhhhhh(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,dlam,               & 
& dTlam,dkap,dTk,dvd,dvu,dvS,dZH,dZA,ctcplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplingAhHpmcHpm(gt1,gt2,gt3,g2,lam,Tlam,kap,vd,vu,vS,ZA,ZP,dg2,             & 
& dlam,dTlam,dkap,dvd,dvu,dvS,dZA,dZP,ctcplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSdcSd(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,dYd,dTd,dlam,               & 
& dvu,dvS,dZD,dZA,ctcplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSecSe(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,dYe,dTe,dlam,               & 
& dvu,dvS,dZE,dZA,ctcplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSucSu(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,dlam,dYu,dTu,               & 
& dvd,dvS,dZU,dZA,ctcplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplingAhSvImSvIm(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZA,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVI,dZA,ctcplAhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplingAhSvImSvRe(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZVR,ZA,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVI,dZVR,dZA,             & 
& ctcplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplingAhSvReSvRe(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVR,ZA,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVR,dZA,ctcplAhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_Couplinghhhhhh(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,dg1,             & 
& dg2,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dZH,ctcplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplinghhHpmcHpm(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,vd,vu,vS,ZH,ZP,              & 
& dg1,dg2,dlam,dTlam,dkap,dvd,dvu,dvS,dZH,dZP,ctcplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSdcSd(gt1,gt2,gt3,g1,g2,Yd,Td,lam,vd,vu,vS,ZD,ZH,dg1,               & 
& dg2,dYd,dTd,dlam,dvd,dvu,dvS,dZD,dZH,ctcplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSecSe(gt1,gt2,gt3,g1,g2,Ye,Te,lam,vd,vu,vS,ZE,ZH,dg1,               & 
& dg2,dYe,dTe,dlam,dvd,dvu,dvS,dZE,dZH,ctcplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSucSu(gt1,gt2,gt3,g1,g2,lam,Yu,Tu,vd,vu,vS,ZU,ZH,dg1,               & 
& dg2,dlam,dYu,dTu,dvd,dvu,dvS,dZU,dZH,ctcplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplinghhSvImSvIm(gt1,gt2,gt3,g1,g2,MUX,lam,kap,lamN,TLN,Yv,Tv,              & 
& vd,vu,vS,ZVI,ZH,dg1,dg2,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVI,            & 
& dZH,ctcplhhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplinghhSvImSvRe(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZVR,ZH,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVI,dZVR,dZH,             & 
& ctcplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplinghhSvReSvRe(gt1,gt2,gt3,g1,g2,MUX,lam,kap,lamN,TLN,Yv,Tv,              & 
& vd,vu,vS,ZVR,ZH,dg1,dg2,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVR,            & 
& dZH,ctcplhhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSucSd = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingHpmSucSd(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,               & 
& ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,ctcplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSvImcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingHpmSvImcSe(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,              & 
& ZVI,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVI,dZE,dZP,ctcplHpmSvImcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSvRecSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingHpmSvRecSe(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,              & 
& ZVR,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVR,dZE,dZP,ctcplHpmSvRecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingSdcHpmcSu(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,              & 
& ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,ctcplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSeSvImcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CT_CouplingSeSvImcHpm(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,              & 
& ZVI,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVI,dZE,dZP,ctcplSeSvImcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSeSvRecHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CT_CouplingSeSvRecHpm(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,              & 
& ZVR,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVR,dZE,dZP,ctcplSeSvRecHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingAhhhVZ(gt1,gt2,g1,g2,ZH,ZA,TW,dg1,dg2,dZH,dZA,dSinTW,dCosTW,          & 
& dTanTW,ctcplAhhhVZ(gt1,gt2))

 End Do 
End Do 


ctcplAhHpmcVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CT_CouplingAhHpmcVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,ctcplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


ctcplAhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CT_CouplingAhcHpmVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,ctcplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhHpmcVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CT_CouplinghhHpmcVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CT_CouplinghhcHpmVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,              & 
& dTanTW,ctcplHpmcHpmVP(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVZ(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,              & 
& dTanTW,ctcplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVG = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVG(gt1,gt2,g3,dg3,ctcplSdcSdVG(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVP(gt1,gt2,g1,g2,ZD,TW,dg1,dg2,dZD,dSinTW,dCosTW,dTanTW,         & 
& ctcplSdcSdVP(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVZ(gt1,gt2,g1,g2,ZD,TW,dg1,dg2,dZD,dSinTW,dCosTW,dTanTW,         & 
& ctcplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


ctcplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSucVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,ctcplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


ctcplSeSvImcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CT_CouplingSeSvImcVWm(gt1,gt2,g2,ZVI,ZE,dg2,dZVI,dZE,ctcplSeSvImcVWm(gt1,gt2))

 End Do 
End Do 


ctcplSeSvRecVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CT_CouplingSeSvRecVWm(gt1,gt2,g2,ZVR,ZE,dg2,dZVR,dZE,ctcplSeSvRecVWm(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVP(gt1,gt2,g1,g2,ZE,TW,dg1,dg2,dZE,dSinTW,dCosTW,dTanTW,         & 
& ctcplSecSeVP(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVZ(gt1,gt2,g1,g2,ZE,TW,dg1,dg2,dZE,dSinTW,dCosTW,dTanTW,         & 
& ctcplSecSeVZ(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVG = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVG(gt1,gt2,g3,dg3,ctcplSucSuVG(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVP(gt1,gt2,g1,g2,ZU,TW,dg1,dg2,dZU,dSinTW,dCosTW,dTanTW,         & 
& ctcplSucSuVP(gt1,gt2))

 End Do 
End Do 


ctcplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSdVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,ctcplSucSdVWm(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVZ(gt1,gt2,g1,g2,ZU,TW,dg1,dg2,dZU,dSinTW,dCosTW,dTanTW,         & 
& ctcplSucSuVZ(gt1,gt2))

 End Do 
End Do 


ctcplSvImSvReVZ = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CT_CouplingSvImSvReVZ(gt1,gt2,g1,g2,ZVI,ZVR,TW,dg1,dg2,dZVI,dZVR,dSinTW,         & 
& dCosTW,dTanTW,ctcplSvImSvReVZ(gt1,gt2))

 End Do 
End Do 


ctcplSvImcSeVWm = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CT_CouplingSvImcSeVWm(gt1,gt2,g2,ZVI,ZE,dg2,dZVI,dZE,ctcplSvImcSeVWm(gt1,gt2))

 End Do 
End Do 


ctcplSvRecSeVWm = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CT_CouplingSvRecSeVWm(gt1,gt2,g2,ZVR,ZE,dg2,dZVR,dZE,ctcplSvRecSeVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhcVWmVWm = 0._dp 
Do gt1 = 1, 3
Call CT_CouplinghhcVWmVWm(gt1,g2,vd,vu,ZH,dg2,dvd,dvu,dZH,ctcplhhcVWmVWm(gt1))

End Do 


ctcplhhVZVZ = 0._dp 
Do gt1 = 1, 3
Call CT_CouplinghhVZVZ(gt1,g1,g2,vd,vu,ZH,TW,dg1,dg2,dvd,dvu,dZH,dSinTW,              & 
& dCosTW,dTanTW,ctcplhhVZVZ(gt1))

End Do 


ctcplHpmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVP(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplHpmcVWmVP(gt1))

End Do 


ctcplHpmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVZ(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplHpmcVWmVZ(gt1))

End Do 


ctcplcHpmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVPVWm(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplcHpmVPVWm(gt1))

End Do 


ctcplcHpmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVWmVZ(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplcHpmVWmVZ(gt1))

End Do 


ctcplVGVGVG = 0._dp 
Call CT_CouplingVGVGVG(g3,dg3,ctcplVGVGVG)



ctcplcVWmVPVWm = 0._dp 
Call CT_CouplingcVWmVPVWm(g2,TW,dg2,dSinTW,dCosTW,dTanTW,ctcplcVWmVPVWm)



ctcplcVWmVWmVZ = 0._dp 
Call CT_CouplingcVWmVWmVZ(g2,TW,dg2,dSinTW,dCosTW,dTanTW,ctcplcVWmVWmVZ)



ctcplcChaChaAhL = 0._dp 
ctcplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CT_CouplingcChaChaAh(gt1,gt2,gt3,g2,lam,ZA,UM,UP,dg2,dlam,dZA,dUM,               & 
& dUP,ctcplcChaChaAhL(gt1,gt2,gt3),ctcplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChiAhL = 0._dp 
ctcplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CT_CouplingChiChiAh(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,dg1,dg2,dlam,dkap,           & 
& dZA,dZN,ctcplChiChiAhL(gt1,gt2,gt3),ctcplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFdAhL = 0._dp 
ctcplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFdFdAh(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,dYd,dZA,dZDL,dZDR,ctcplcFdFdAhL(gt1,gt2,gt3)& 
& ,ctcplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFeAhL = 0._dp 
ctcplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFeFeAh(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,dYe,dZA,dZEL,dZER,ctcplcFeFeAhL(gt1,gt2,gt3)& 
& ,ctcplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFuAhL = 0._dp 
ctcplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFuFuAh(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,dYu,dZA,dZUL,dZUR,ctcplcFuFuAhL(gt1,gt2,gt3)& 
& ,ctcplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFvAhL = 0._dp 
ctcplFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 3
Call CT_CouplingFvFvAh(gt1,gt2,gt3,lamN,Yv,ZA,UV,dlamN,dYv,dZA,dUV,ctcplFvFvAhL(gt1,gt2,gt3)& 
& ,ctcplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChacHpmL = 0._dp 
ctcplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplingChiChacHpm(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,dg1,dg2,dlam,            & 
& dZP,dZN,dUM,dUP,ctcplChiChacHpmL(gt1,gt2,gt3),ctcplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChaFucSdL = 0._dp 
ctcplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChaFucSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,dYd,               & 
& dYu,dZD,dUM,dUP,dZUL,dZUR,ctcplChaFucSdL(gt1,gt2,gt3),ctcplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvChacSeL = 0._dp 
ctcplFvChacSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingFvChacSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,dg2,dYe,dYv,dZE,            & 
& dUV,dUM,dUP,ctcplFvChacSeL(gt1,gt2,gt3),ctcplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaChahhL = 0._dp 
ctcplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CT_CouplingcChaChahh(gt1,gt2,gt3,g2,lam,ZH,UM,UP,dg2,dlam,dZH,dUM,               & 
& dUP,ctcplcChaChahhL(gt1,gt2,gt3),ctcplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdChaSuL = 0._dp 
ctcplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcFdChaSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,dYd,               & 
& dYu,dZU,dUM,dUP,dZDL,dZDR,ctcplcFdChaSuL(gt1,gt2,gt3),ctcplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChaSvImL = 0._dp 
ctcplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 9
Call CT_CouplingcFeChaSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVI,dUM,dUP,dZEL,dZER,ctcplcFeChaSvImL(gt1,gt2,gt3),ctcplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChaSvReL = 0._dp 
ctcplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 9
Call CT_CouplingcFeChaSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVR,dUM,dUP,dZEL,dZER,ctcplcFeChaSvReL(gt1,gt2,gt3),ctcplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChihhL = 0._dp 
ctcplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CT_CouplingChiChihh(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,dg1,dg2,dlam,dkap,           & 
& dZH,dZN,ctcplChiChihhL(gt1,gt2,gt3),ctcplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFdcSdL = 0._dp 
ctcplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFdcSd(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,dg1,dg2,dYd,              & 
& dZD,dZN,dZDL,dZDR,ctcplChiFdcSdL(gt1,gt2,gt3),ctcplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFecSeL = 0._dp 
ctcplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFecSe(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,dg1,dg2,dYe,              & 
& dZE,dZN,dZEL,dZER,ctcplChiFecSeL(gt1,gt2,gt3),ctcplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFucSuL = 0._dp 
ctcplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFucSu(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,dg1,dg2,dYu,              & 
& dZU,dZN,dZUL,dZUR,ctcplChiFucSuL(gt1,gt2,gt3),ctcplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFvSvImL = 0._dp 
ctcplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplingChiFvSvIm(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,dg1,dg2,dlamN,          & 
& dYv,dZVI,dZN,dUV,ctcplChiFvSvImL(gt1,gt2,gt3),ctcplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFvSvReL = 0._dp 
ctcplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 9
  Do gt3 = 1, 9
Call CT_CouplingChiFvSvRe(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,dg1,dg2,dlamN,          & 
& dYv,dZVR,dZN,dUV,ctcplChiFvSvReL(gt1,gt2,gt3),ctcplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaChiHpmL = 0._dp 
ctcplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CT_CouplingcChaChiHpm(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,dg1,dg2,dlam,            & 
& dZP,dZN,dUM,dUP,ctcplcChaChiHpmL(gt1,gt2,gt3),ctcplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdChiSdL = 0._dp 
ctcplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CT_CouplingcFdChiSd(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,dg1,dg2,dYd,              & 
& dZD,dZN,dZDL,dZDR,ctcplcFdChiSdL(gt1,gt2,gt3),ctcplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChiSeL = 0._dp 
ctcplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CT_CouplingcFeChiSe(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,dg1,dg2,dYe,              & 
& dZE,dZN,dZEL,dZER,ctcplcFeChiSeL(gt1,gt2,gt3),ctcplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuChiSuL = 0._dp 
ctcplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CT_CouplingcFuChiSu(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,dg1,dg2,dYu,              & 
& dZU,dZN,dZUL,dZUR,ctcplcFuChiSuL(gt1,gt2,gt3),ctcplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplGluFdcSdL = 0._dp 
ctcplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingGluFdcSd(gt2,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,dZDR,              & 
& ctcplGluFdcSdL(gt2,gt3),ctcplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


ctcplcFdFdhhL = 0._dp 
ctcplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFdFdhh(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,dYd,dZH,dZDL,dZDR,ctcplcFdFdhhL(gt1,gt2,gt3)& 
& ,ctcplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFdcSuL = 0._dp 
ctcplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChaFdcSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,dYd,              & 
& dYu,dZU,dUM,dUP,dZDL,dZDR,ctcplcChaFdcSuL(gt1,gt2,gt3),ctcplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFdcHpmL = 0._dp 
ctcplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFuFdcHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,dYu,               & 
& dZP,dZDL,dZDR,dZUL,dZUR,ctcplcFuFdcHpmL(gt1,gt2,gt3),ctcplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFecHpmL = 0._dp 
ctcplFvFecHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingFvFecHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,dZP,dUV,             & 
& dZEL,dZER,ctcplFvFecHpmL(gt1,gt2,gt3),ctcplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFehhL = 0._dp 
ctcplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFeFehh(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,dYe,dZH,dZEL,dZER,ctcplcFeFehhL(gt1,gt2,gt3)& 
& ,ctcplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFeSvImL = 0._dp 
ctcplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 9
Call CT_CouplingcChaFeSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVI,dUM,dUP,dZEL,dZER,ctcplcChaFeSvImL(gt1,gt2,gt3),ctcplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFeSvReL = 0._dp 
ctcplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 9
Call CT_CouplingcChaFeSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,dg2,dYe,            & 
& dYv,dZVR,dUM,dUP,dZEL,dZER,ctcplcChaFeSvReL(gt1,gt2,gt3),ctcplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplGluFucSuL = 0._dp 
ctcplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingGluFucSu(gt2,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,dZUR,              & 
& ctcplGluFucSuL(gt2,gt3),ctcplGluFucSuR(gt2,gt3))

 End Do 
End Do 


ctcplcFuFuhhL = 0._dp 
ctcplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFuFuhh(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,dYu,dZH,dZUL,dZUR,ctcplcFuFuhhL(gt1,gt2,gt3)& 
& ,ctcplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFuHpmL = 0._dp 
ctcplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFdFuHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,dYu,dZP,            & 
& dZDL,dZDR,dZUL,dZUR,ctcplcFdFuHpmL(gt1,gt2,gt3),ctcplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFvhhL = 0._dp 
ctcplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 3
Call CT_CouplingFvFvhh(gt1,gt2,gt3,lamN,Yv,ZH,UV,dlamN,dYv,dZH,dUV,ctcplFvFvhhL(gt1,gt2,gt3)& 
& ,ctcplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFvHpmL = 0._dp 
ctcplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CT_CouplingcFeFvHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,dZP,dUV,             & 
& dZEL,dZER,ctcplcFeFvHpmL(gt1,gt2,gt3),ctcplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFvSeL = 0._dp 
ctcplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingcChaFvSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,dg2,dYe,dYv,dZE,            & 
& dUV,dUM,dUP,ctcplcChaFvSeL(gt1,gt2,gt3),ctcplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdGluSdL = 0._dp 
ctcplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingcFdGluSd(gt1,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,dZDR,              & 
& ctcplcFdGluSdL(gt1,gt3),ctcplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


ctcplcFuGluSuL = 0._dp 
ctcplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingcFuGluSu(gt1,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,dZUR,              & 
& ctcplcFuGluSuL(gt1,gt3),ctcplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


ctcplcChacFuSdL = 0._dp 
ctcplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChacFuSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,dYd,              & 
& dYu,dZD,dUM,dUP,dZUL,dZUR,ctcplcChacFuSdL(gt1,gt2,gt3),ctcplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChacVWmL = 0._dp 
ctcplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CT_CouplingChiChacVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,ctcplChiChacVWmL(gt1,gt2)& 
& ,ctcplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVPL = 0._dp 
ctcplcChaChaVPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVP(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,dSinTW,              & 
& dCosTW,dTanTW,ctcplcChaChaVPL(gt1,gt2),ctcplcChaChaVPR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVZL = 0._dp 
ctcplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVZ(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,dSinTW,              & 
& dCosTW,dTanTW,ctcplcChaChaVZL(gt1,gt2),ctcplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


ctcplChiChiVZL = 0._dp 
ctcplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CT_CouplingChiChiVZ(gt1,gt2,g1,g2,ZN,TW,dg1,dg2,dZN,dSinTW,dCosTW,               & 
& dTanTW,ctcplChiChiVZL(gt1,gt2),ctcplChiChiVZR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChiVWmL = 0._dp 
ctcplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
Call CT_CouplingcChaChiVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,ctcplcChaChiVWmL(gt1,gt2)& 
& ,ctcplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVGL = 0._dp 
ctcplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,ctcplcFdFdVGL(gt1,gt2),ctcplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVPL = 0._dp 
ctcplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFdFdVPL(gt1,gt2)& 
& ,ctcplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZL = 0._dp 
ctcplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFdFdVZL(gt1,gt2)& 
& ,ctcplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFdcVWmL = 0._dp 
ctcplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFdcVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFuFdcVWmL(gt1,gt2)   & 
& ,ctcplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


ctcplFvFecVWmL = 0._dp 
ctcplFvFecVWmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
Call CT_CouplingFvFecVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,ctcplFvFecVWmL(gt1,gt2)       & 
& ,ctcplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVPL = 0._dp 
ctcplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFeFeVPL(gt1,gt2)& 
& ,ctcplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZL = 0._dp 
ctcplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFeFeVZL(gt1,gt2)& 
& ,ctcplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVGL = 0._dp 
ctcplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,ctcplcFuFuVGL(gt1,gt2),ctcplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVPL = 0._dp 
ctcplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFuFuVPL(gt1,gt2)& 
& ,ctcplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFuVWmL = 0._dp 
ctcplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFuVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFdFuVWmL(gt1,gt2)     & 
& ,ctcplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZL = 0._dp 
ctcplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFuFuVZL(gt1,gt2)& 
& ,ctcplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVZL = 0._dp 
ctcplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CT_CouplingFvFvVZ(gt1,gt2,g1,g2,UV,TW,dg1,dg2,dUV,dSinTW,dCosTW,dTanTW,          & 
& ctcplFvFvVZL(gt1,gt2),ctcplFvFvVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFvVWmL = 0._dp 
ctcplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
Call CT_CouplingcFeFvVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,ctcplcFeFvVWmL(gt1,gt2)       & 
& ,ctcplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


ctcplGluGluVGL = 0._dp 
ctcplGluGluVGR = 0._dp 
Call CT_CouplingGluGluVG(g3,pG,dg3,dpG,ctcplGluGluVGL,ctcplGluGluVGR)



Iname = Iname - 1 
End Subroutine CalculateCouplingCT

Subroutine CT_CouplingAhAhAh(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZA,dlam,            & 
& dTlam,dkap,dTk,dvd,dvu,dvS,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vu,vS,ZA(3,3),dvd,dvu,dvS,dZA(3,3)

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,dlam,dTlam,dkap,dTk

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(vS*lam*Conjg(kap)*dZA(gt3,3)*ZA(gt1,2)*ZA(gt2,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt3,3)*ZA(gt1,2)*ZA(gt2,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt3,3)*ZA(gt1,2)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(dZA(gt3,3)*Tlam*ZA(gt1,2)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt3,2)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt3,2)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt3,2)*ZA(gt1,3)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt3,3)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt3,3)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res+(dZA(gt3,2)*Tlam*ZA(gt1,3)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt3,3)*ZA(gt1,1)*ZA(gt2,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt3,3)*ZA(gt1,1)*ZA(gt2,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt3,3)*ZA(gt1,1)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(dZA(gt3,3)*Tlam*ZA(gt1,1)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt3,1)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt3,1)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt3,1)*ZA(gt1,3)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt3,3)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt3,3)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res+(dZA(gt3,1)*Tlam*ZA(gt1,3)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt3,2)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt3,2)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt3,2)*ZA(gt1,1)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt3,3)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt3,3)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res+(dZA(gt3,2)*Tlam*ZA(gt1,1)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt3,1)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt3,1)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt3,1)*ZA(gt1,2)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt3,3)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt3,3)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res+(dZA(gt3,1)*Tlam*ZA(gt1,2)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt3,1)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt3,1)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res+(vd*lam*Conjg(kap)*dZA(gt3,2)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt3,2)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res+(Conjg(Tk)*dZA(gt3,3)*ZA(gt1,3)*ZA(gt2,3))/sqrt(2._dp)
res = res-((dZA(gt3,3)*Tk*ZA(gt1,3)*ZA(gt2,3))/sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,2)*ZA(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,2)*ZA(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,3)*ZA(gt1,2)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dZA(gt2,3)*Tlam*ZA(gt1,2)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt2,2)*ZA(gt1,3)*ZA(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,2)*ZA(gt1,3)*ZA(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,2)*ZA(gt1,3)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,3)*ZA(gt3,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,3)*ZA(gt3,1))/2._dp
res = res+(dZA(gt2,2)*Tlam*ZA(gt1,3)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dZA(gt1,3)*Tlam*ZA(gt2,2)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,1))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(dZA(gt1,2)*Tlam*ZA(gt2,3)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(vu*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(vu*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(dlam*vu*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(dkap*vu*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(dvu*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,1))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,1)*ZA(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,1)*ZA(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,3)*ZA(gt1,1)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dZA(gt2,3)*Tlam*ZA(gt1,1)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt2,1)*ZA(gt1,3)*ZA(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,1)*ZA(gt1,3)*ZA(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,1)*ZA(gt1,3)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,3)*ZA(gt3,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,3)*ZA(gt3,2))/2._dp
res = res+(dZA(gt2,1)*Tlam*ZA(gt1,3)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dZA(gt1,3)*Tlam*ZA(gt2,1)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,2))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(dZA(gt1,1)*Tlam*ZA(gt2,3)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(vd*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(vd*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(dlam*vd*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(dkap*vd*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(dvd*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,2))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt2,2)*ZA(gt1,1)*ZA(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,2)*ZA(gt1,1)*ZA(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,2)*ZA(gt1,1)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,1)*ZA(gt3,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,1)*ZA(gt3,3))/2._dp
res = res+(dZA(gt2,2)*Tlam*ZA(gt1,1)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt2,1)*ZA(gt1,2)*ZA(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,1)*ZA(gt1,2)*ZA(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,1)*ZA(gt1,2)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,2)*ZA(gt3,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,2)*ZA(gt3,3))/2._dp
res = res+(dZA(gt2,1)*Tlam*ZA(gt1,2)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt2,1)*ZA(gt1,3)*ZA(gt3,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt2,1)*ZA(gt1,3)*ZA(gt3,3))/2._dp
res = res+(vd*lam*Conjg(kap)*dZA(gt2,2)*ZA(gt1,3)*ZA(gt3,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt2,2)*ZA(gt1,3)*ZA(gt3,3))/2._dp
res = res+(Conjg(Tk)*dZA(gt2,3)*ZA(gt1,3)*ZA(gt3,3))/sqrt(2._dp)
res = res-((dZA(gt2,3)*Tk*ZA(gt1,3)*ZA(gt3,3))/sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(dZA(gt1,2)*Tlam*ZA(gt2,1)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(vu*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(vu*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(dlam*vu*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(dkap*vu*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(dvu*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZA(gt3,3))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(dZA(gt1,1)*Tlam*ZA(gt2,2)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(vd*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res-(vd*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(dlam*vd*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res-(dkap*vd*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res-(dvd*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZA(gt3,3))/2._dp
res = res+(vu*lam*Conjg(kap)*dZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res+(vd*lam*Conjg(kap)*dZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res+(Conjg(Tk)*dZA(gt1,3)*ZA(gt2,3)*ZA(gt3,3))/sqrt(2._dp)
res = res-((dZA(gt1,3)*Tk*ZA(gt2,3)*ZA(gt3,3))/sqrt(2._dp))
res = res+(vu*lam*Conjg(dkap)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(vu*kap*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res+(dlam*vu*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(dkap*vu*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(dvu*kap*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res+(vd*lam*Conjg(dkap)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(vd*kap*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res+(dlam*vd*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(dkap*vd*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-(dvd*kap*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZA(gt3,3))/2._dp
res = res-((dTk*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,3))/sqrt(2._dp))
res = res+(Conjg(dTk)*ZA(gt1,3)*ZA(gt2,3)*ZA(gt3,3))/sqrt(2._dp)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhAh  
 
 
Subroutine CT_CouplingAhAhhh(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,              & 
& ZH,ZA,dg1,dg2,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dZH,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),ZA(3,3),dg1,dg2,dvd,dvu,dvS,dZH(3,3),dZA(3,3)

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,dlam,dTlam,dkap,dTk

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1**2*vd*dZH(gt3,1)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res-(g2**2*vd*dZH(gt3,1)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res+(g1**2*vu*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res+(g2**2*vu*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,1))
res = res-(vS*lam*Conjg(lam)*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,1))
res = res-(vS*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,1))/2._dp
res = res-(vS*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,1))/2._dp
res = res-(Conjg(Tlam)*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res-(dZH(gt3,3)*Tlam*ZA(gt1,2)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res-(Conjg(Tlam)*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,1))/2._dp
res = res-(dZH(gt3,2)*Tlam*ZA(gt1,3)*ZA(gt2,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,2))/2._dp
res = res-(vS*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,2))/2._dp
res = res-(Conjg(Tlam)*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res-(dZH(gt3,3)*Tlam*ZA(gt1,1)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vd*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res+(g2**2*vd*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,2))
res = res-(g1**2*vu*dZH(gt3,2)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res-(g2**2*vu*dZH(gt3,2)*ZA(gt1,2)*ZA(gt2,2))/4._dp
res = res-(vS*lam*Conjg(lam)*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,2))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res-(Conjg(Tlam)*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,2))/2._dp
res = res-(dZH(gt3,1)*Tlam*ZA(gt1,3)*ZA(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res-(Conjg(Tlam)*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,1)*ZA(gt2,3))/2._dp
res = res-(dZH(gt3,2)*Tlam*ZA(gt1,1)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res-(Conjg(Tlam)*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,2)*ZA(gt2,3))/2._dp
res = res-(dZH(gt3,1)*Tlam*ZA(gt1,2)*ZA(gt2,3))/(2._dp*sqrt(2._dp))
res = res-(vu*lam*Conjg(kap)*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,1)*ZA(gt1,3)*ZA(gt2,3))
res = res-(vd*lam*Conjg(kap)*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,3))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,2)*ZA(gt1,3)*ZA(gt2,3))
res = res-2*vS*kap*Conjg(kap)*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,3)
res = res+(Conjg(Tk)*dZH(gt3,3)*ZA(gt1,3)*ZA(gt2,3))/sqrt(2._dp)
res = res+(dZH(gt3,3)*Tk*ZA(gt1,3)*ZA(gt2,3))/sqrt(2._dp)
res = res-(g1**2*vd*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,1))/4._dp
res = res-(g2**2*vd*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,1))/4._dp
res = res+(g1**2*vd*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,1))
res = res+(vS*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,2)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,3)*ZA(gt1,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dZA(gt2,3)*Tlam*ZA(gt1,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZA(gt2,2)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,2)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,2)*ZA(gt1,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vu*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(lam)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,1))
res = res-(dZA(gt2,2)*Tlam*ZA(gt1,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(g1**2*vd*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(g2**2*vd*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(dvd*g1**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(dvd*g2**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/4._dp
res = res-(dg1*g1*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dg2*g2*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))/2._dp
res = res+(g1**2*vd*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res+(vS*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dZA(gt1,3)*Tlam*ZA(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dvd*g1**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvd*g2**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(dlam*vd*Conjg(lam)*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(dvd*lam*Conjg(lam)*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(dTlam*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,1))/2._dp
res = res+(vS*lam*Conjg(kap)*dZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vu*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(lam)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))
res = res-(dZA(gt1,2)*Tlam*ZA(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vu*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vu*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))
res = res-(dlam*vu*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvu*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dlam*vd*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))
res = res-(dkap*vu*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvu*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvd*lam*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,1))
res = res+(g1**2*vu*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,2))/4._dp
res = res-(vu*lam*Conjg(lam)*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,2))
res = res+(vS*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,1)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,3)*ZA(gt1,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dZA(gt2,3)*Tlam*ZA(gt1,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(g1**2*vu*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,2))/4._dp
res = res-(g2**2*vu*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,2))/4._dp
res = res+(vS*lam*Conjg(kap)*dZA(gt2,1)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt2,1)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,1)*ZA(gt1,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vd*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(lam)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,2))
res = res-(dZA(gt2,1)*Tlam*ZA(gt1,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vu*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res-(vu*lam*Conjg(lam)*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res+(vS*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dZA(gt1,3)*Tlam*ZA(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dvu*g1**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*g2**2*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(dlam*vu*Conjg(lam)*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(dvu*lam*Conjg(lam)*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(dTlam*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,2))/2._dp
res = res-(g1**2*vu*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(g2**2*vu*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(dvu*g1**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(dvu*g2**2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/4._dp
res = res-(dg1*g1*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dg2*g2*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))/2._dp
res = res+(vS*lam*Conjg(kap)*dZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vd*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(lam)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))
res = res-(dZA(gt1,1)*Tlam*ZA(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vd*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vd*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))
res = res-(dlam*vd*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dvd*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dkap*vd*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dlam*vu*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))
res = res-(dvd*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dvu*lam*Conjg(lam)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,2))
res = res-(vS*lam*Conjg(lam)*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,3))
res = res-(vS*lam*Conjg(kap)*dZA(gt2,2)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res-(vS*kap*Conjg(lam)*dZA(gt2,2)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,2)*ZA(gt1,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res-(dZA(gt2,2)*Tlam*ZA(gt1,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZA(gt2,1)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res-(vS*kap*Conjg(lam)*dZA(gt2,1)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt2,1)*ZA(gt1,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,3))
res = res+(vd*lam*Conjg(kap)*dZA(gt2,3)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZA(gt2,3)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res-(dZA(gt2,1)*Tlam*ZA(gt1,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt2,1)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZA(gt2,1)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res+(vd*lam*Conjg(kap)*dZA(gt2,2)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZA(gt2,2)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res-2*vS*kap*Conjg(kap)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,3)
res = res+(Conjg(Tk)*dZA(gt2,3)*ZA(gt1,3)*ZH(gt3,3))/sqrt(2._dp)
res = res+(dZA(gt2,3)*Tk*ZA(gt1,3)*ZH(gt3,3))/sqrt(2._dp)
res = res-(vS*lam*Conjg(lam)*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))
res = res-(vS*lam*Conjg(kap)*dZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vS*kap*Conjg(lam)*dZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dZA(gt1,2)*Tlam*ZA(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))
res = res-(dlam*vS*Conjg(lam)*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))
res = res-(dvS*lam*Conjg(lam)*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,3))
res = res-(dTlam*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vS*kap*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dkap*vS*Conjg(lam)*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dvS*kap*Conjg(lam)*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vu*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dlam*vu*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dkap*vu*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvu*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vS*kap*Conjg(lam)*dZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(Conjg(Tlam)*dZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))
res = res+(vd*lam*Conjg(kap)*dZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dZA(gt1,1)*Tlam*ZA(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vS*kap*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(Conjg(dTlam)*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dkap*vS*Conjg(lam)*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dvS*kap*Conjg(lam)*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vS*lam*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))
res = res-(dlam*vS*Conjg(lam)*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))
res = res-(dvS*lam*Conjg(lam)*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,3))
res = res+(vd*lam*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(dlam)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dlam*vd*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dkap*vd*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvd*kap*Conjg(lam)*ZA(gt1,3)*ZA(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vu*lam*Conjg(kap)*dZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*lam*Conjg(kap)*dZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res-2*vS*kap*Conjg(kap)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3)
res = res+(Conjg(Tk)*dZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3))/sqrt(2._dp)
res = res+(dZA(gt1,3)*Tk*ZA(gt2,3)*ZH(gt3,3))/sqrt(2._dp)
res = res+(vu*lam*Conjg(dkap)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(dlam)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dlam*vu*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dkap*vu*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvu*kap*Conjg(lam)*ZA(gt1,1)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*lam*Conjg(dkap)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(dlam)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dlam*vd*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dkap*vd*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvd*kap*Conjg(lam)*ZA(gt1,2)*ZA(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dTk*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3))/sqrt(2._dp)
res = res-2*vS*kap*Conjg(dkap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3)
res = res+(Conjg(dTk)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3))/sqrt(2._dp)
res = res-2*dkap*vS*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3)
res = res-2*dvS*kap*Conjg(kap)*ZA(gt1,3)*ZA(gt2,3)*ZH(gt3,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhhh  
 
 
Subroutine CT_CouplingAhhhhh(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,              & 
& dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dZH,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vu,vS,ZH(3,3),ZA(3,3),dvd,dvu,dvS,dZH(3,3),dZA(3,3)

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,dlam,dTlam,dkap,dTk

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(vS*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,2)*ZH(gt2,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,2)*ZH(gt2,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,3)*ZA(gt1,2)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res-(dZH(gt3,3)*Tlam*ZA(gt1,2)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,2)*ZA(gt1,3)*ZH(gt2,1))/2._dp
res = res-(vS*kap*Conjg(lam)*dZH(gt3,2)*ZA(gt1,3)*ZH(gt2,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,2)*ZA(gt1,3)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,3)*ZH(gt2,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,3)*ZH(gt2,1))/2._dp
res = res-(dZH(gt3,2)*Tlam*ZA(gt1,3)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,1)*ZH(gt2,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,3)*ZA(gt1,1)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res-(dZH(gt3,3)*Tlam*ZA(gt1,1)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,1)*ZA(gt1,3)*ZH(gt2,2))/2._dp
res = res-(vS*kap*Conjg(lam)*dZH(gt3,1)*ZA(gt1,3)*ZH(gt2,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,1)*ZA(gt1,3)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,3)*ZH(gt2,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,3)*ZH(gt2,2))/2._dp
res = res-(dZH(gt3,1)*Tlam*ZA(gt1,3)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZH(gt3,2)*ZA(gt1,1)*ZH(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,2)*ZA(gt1,1)*ZH(gt2,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,2)*ZA(gt1,1)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res-(vu*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,1)*ZH(gt2,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,1)*ZH(gt2,3))/2._dp
res = res-(dZH(gt3,2)*Tlam*ZA(gt1,1)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZH(gt3,1)*ZA(gt1,2)*ZH(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,1)*ZA(gt1,2)*ZH(gt2,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,1)*ZA(gt1,2)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res-(vd*lam*Conjg(kap)*dZH(gt3,3)*ZA(gt1,2)*ZH(gt2,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt3,3)*ZA(gt1,2)*ZH(gt2,3))/2._dp
res = res-(dZH(gt3,1)*Tlam*ZA(gt1,2)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt3,1)*ZA(gt1,3)*ZH(gt2,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZH(gt3,1)*ZA(gt1,3)*ZH(gt2,3))/2._dp
res = res+(vd*lam*Conjg(kap)*dZH(gt3,2)*ZA(gt1,3)*ZH(gt2,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZH(gt3,2)*ZA(gt1,3)*ZH(gt2,3))/2._dp
res = res-((Conjg(Tk)*dZH(gt3,3)*ZA(gt1,3)*ZH(gt2,3))/sqrt(2._dp))
res = res+(dZH(gt3,3)*Tk*ZA(gt1,3)*ZH(gt2,3))/sqrt(2._dp)
res = res-(vS*lam*Conjg(kap)*dZH(gt2,3)*ZA(gt1,2)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,3)*ZA(gt1,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,3)*ZA(gt1,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dZH(gt2,3)*Tlam*ZA(gt1,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,2)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res-(vS*kap*Conjg(lam)*dZH(gt2,2)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,2)*ZA(gt1,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt2,3)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZH(gt2,3)*ZA(gt1,3)*ZH(gt3,1))/2._dp
res = res-(dZH(gt2,2)*Tlam*ZA(gt1,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vS*kap*Conjg(lam)*dZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dZA(gt1,3)*Tlam*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vS*kap*Conjg(dlam)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(dTlam)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dkap*vS*Conjg(lam)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dvS*kap*Conjg(lam)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dZA(gt1,2)*Tlam*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(Conjg(dTlam)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vu*lam*Conjg(dkap)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vu*kap*Conjg(dlam)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dlam*vu*Conjg(kap)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dkap*vu*Conjg(lam)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvu*kap*Conjg(lam)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vS*lam*Conjg(kap)*dZH(gt2,3)*ZA(gt1,1)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,3)*ZA(gt1,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,3)*ZA(gt1,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dZH(gt2,3)*Tlam*ZA(gt1,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,1)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res-(vS*kap*Conjg(lam)*dZH(gt2,1)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,1)*ZA(gt1,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZH(gt2,3)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZH(gt2,3)*ZA(gt1,3)*ZH(gt3,2))/2._dp
res = res-(dZH(gt2,1)*Tlam*ZA(gt1,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vS*kap*Conjg(lam)*dZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dZA(gt1,3)*Tlam*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vS*kap*Conjg(dlam)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(dTlam)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dkap*vS*Conjg(lam)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dvS*kap*Conjg(lam)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dZA(gt1,1)*Tlam*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(Conjg(dTlam)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vd*lam*Conjg(dkap)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vd*kap*Conjg(dlam)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dlam*vd*Conjg(kap)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dkap*vd*Conjg(lam)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dvd*kap*Conjg(lam)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vS*lam*Conjg(kap)*dZH(gt2,2)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,2)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,2)*ZA(gt1,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vu*lam*Conjg(kap)*dZH(gt2,3)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt2,3)*ZA(gt1,1)*ZH(gt3,3))/2._dp
res = res-(dZH(gt2,2)*Tlam*ZA(gt1,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(kap)*dZH(gt2,1)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,1)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,1)*ZA(gt1,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vd*lam*Conjg(kap)*dZH(gt2,3)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt2,3)*ZA(gt1,2)*ZH(gt3,3))/2._dp
res = res-(dZH(gt2,1)*Tlam*ZA(gt1,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt2,1)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZH(gt2,1)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res+(vd*lam*Conjg(kap)*dZH(gt2,2)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZH(gt2,2)*ZA(gt1,3)*ZH(gt3,3))/2._dp
res = res-((Conjg(Tk)*dZH(gt2,3)*ZA(gt1,3)*ZH(gt3,3))/sqrt(2._dp))
res = res+(dZH(gt2,3)*Tk*ZA(gt1,3)*ZH(gt3,3))/sqrt(2._dp)
res = res-(vS*lam*Conjg(kap)*dZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vu*kap*Conjg(lam)*dZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dZA(gt1,2)*Tlam*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(Conjg(dTlam)*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vu*lam*Conjg(dkap)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vu*kap*Conjg(dlam)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dlam*vu*Conjg(kap)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dkap*vu*Conjg(lam)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dvu*kap*Conjg(lam)*ZA(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vd*lam*Conjg(kap)*dZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vd*kap*Conjg(lam)*dZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dZA(gt1,1)*Tlam*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dTlam*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(Conjg(dTlam)*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZA(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vd*lam*Conjg(dkap)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vd*kap*Conjg(dlam)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dlam*vd*Conjg(kap)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dkap*vd*Conjg(lam)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dvd*kap*Conjg(lam)*ZA(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vu*lam*Conjg(kap)*dZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(kap)*dZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-((Conjg(Tk)*dZA(gt1,3)*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp))
res = res+(dZA(gt1,3)*Tk*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp)
res = res-(vu*lam*Conjg(dkap)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(dlam)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dlam*vu*Conjg(kap)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dvu*lam*Conjg(kap)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dkap*vu*Conjg(lam)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvu*kap*Conjg(lam)*ZA(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(dkap)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(dlam)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dlam*vd*Conjg(kap)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dvd*lam*Conjg(kap)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dkap*vd*Conjg(lam)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvd*kap*Conjg(lam)*ZA(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dTk*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp)
res = res-((Conjg(dTk)*ZA(gt1,3)*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhhh  
 
 
Subroutine CT_CouplingAhHpmcHpm(gt1,gt2,gt3,g2,lam,Tlam,kap,vd,vu,vS,ZA,              & 
& ZP,dg2,dlam,dTlam,dkap,dvd,dvu,dvS,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZA(3,3),ZP(2,2),dg2,dvd,dvu,dvS,dZA(3,3),dZP(2,2)

Complex(dp), Intent(in) :: lam,Tlam,kap,dlam,dTlam,dkap

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHpmcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vu*dZP(gt3,2)*ZA(gt1,1)*ZP(gt2,1))/4._dp
res = res+(vu*lam*Conjg(lam)*dZP(gt3,2)*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2**2*vd*dZP(gt3,2)*ZA(gt1,2)*ZP(gt2,1))/4._dp
res = res+(vd*lam*Conjg(lam)*dZP(gt3,2)*ZA(gt1,2)*ZP(gt2,1))/2._dp
res = res-(vS*lam*Conjg(kap)*dZP(gt3,2)*ZA(gt1,3)*ZP(gt2,1))
res = res+(dZP(gt3,2)*Tlam*ZA(gt1,3)*ZP(gt2,1))/sqrt(2._dp)
res = res+(g2**2*vu*dZP(gt3,1)*ZA(gt1,1)*ZP(gt2,2))/4._dp
res = res-(vu*lam*Conjg(lam)*dZP(gt3,1)*ZA(gt1,1)*ZP(gt2,2))/2._dp
res = res+(g2**2*vd*dZP(gt3,1)*ZA(gt1,2)*ZP(gt2,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZP(gt3,1)*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = res+vS*kap*Conjg(lam)*dZP(gt3,1)*ZA(gt1,3)*ZP(gt2,2)
res = res-((Conjg(Tlam)*dZP(gt3,1)*ZA(gt1,3)*ZP(gt2,2))/sqrt(2._dp))
res = res+(g2**2*vu*dZP(gt2,2)*ZA(gt1,1)*ZP(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZP(gt2,2)*ZA(gt1,1)*ZP(gt3,1))/2._dp
res = res+(g2**2*vd*dZP(gt2,2)*ZA(gt1,2)*ZP(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*dZP(gt2,2)*ZA(gt1,2)*ZP(gt3,1))/2._dp
res = res+vS*kap*Conjg(lam)*dZP(gt2,2)*ZA(gt1,3)*ZP(gt3,1)
res = res-((Conjg(Tlam)*dZP(gt2,2)*ZA(gt1,3)*ZP(gt3,1))/sqrt(2._dp))
res = res+(g2**2*vu*dZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(g2**2*vd*dZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*dZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+vS*kap*Conjg(lam)*dZA(gt1,3)*ZP(gt2,2)*ZP(gt3,1)
res = res-((Conjg(Tlam)*dZA(gt1,3)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+(dvu*g2**2*ZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(dg2*g2*vu*ZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dlam*vu*Conjg(lam)*ZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dvu*lam*Conjg(lam)*ZA(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dvd*g2**2*ZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(dg2*g2*vd*ZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dlam*vd*Conjg(lam)*ZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dvd*lam*Conjg(lam)*ZA(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+vS*kap*Conjg(dlam)*ZA(gt1,3)*ZP(gt2,2)*ZP(gt3,1)
res = res-((Conjg(dTlam)*ZA(gt1,3)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+dkap*vS*Conjg(lam)*ZA(gt1,3)*ZP(gt2,2)*ZP(gt3,1)
res = res+dvS*kap*Conjg(lam)*ZA(gt1,3)*ZP(gt2,2)*ZP(gt3,1)
res = res-(g2**2*vu*dZP(gt2,1)*ZA(gt1,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*dZP(gt2,1)*ZA(gt1,1)*ZP(gt3,2))/2._dp
res = res-(g2**2*vd*dZP(gt2,1)*ZA(gt1,2)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*dZP(gt2,1)*ZA(gt1,2)*ZP(gt3,2))/2._dp
res = res-(vS*lam*Conjg(kap)*dZP(gt2,1)*ZA(gt1,3)*ZP(gt3,2))
res = res+(dZP(gt2,1)*Tlam*ZA(gt1,3)*ZP(gt3,2))/sqrt(2._dp)
res = res-(g2**2*vu*dZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*dZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(g2**2*vd*dZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*dZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(vS*lam*Conjg(kap)*dZA(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = res+(dZA(gt1,3)*Tlam*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp)
res = res-(dvu*g2**2*ZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vu*ZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vu*lam*Conjg(dlam)*ZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vu*Conjg(lam)*ZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvu*lam*Conjg(lam)*ZA(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvd*g2**2*ZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vd*ZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vd*lam*Conjg(dlam)*ZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vd*Conjg(lam)*ZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvd*lam*Conjg(lam)*ZA(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dTlam*ZA(gt1,3)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp)
res = res-(vS*lam*Conjg(dkap)*ZA(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = res-(dlam*vS*Conjg(kap)*ZA(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = res-(dvS*lam*Conjg(kap)*ZA(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHpmcHpm  
 
 
Subroutine CT_CouplingAhSdcSd(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,dYd,dTd,              & 
& dlam,dvu,dvS,dZD,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,vS,ZA(3,3),dvu,dvS,dZA(3,3)

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,ZD(6,6),dYd(3,3),dTd(3,3),dlam,dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZD(gt3,j2)*ZA(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2)*ZA(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZA(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*dZA(gt1,2)*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*dZA(gt1,3)*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZD(gt2,j2))*dTd(j1,j2)*ZA(gt1,1)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZA(gt1,2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZA(gt1,3)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,3)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,3)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZA(gt1,3)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZA(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZA(gt1,2)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZA(gt1,3)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,3 + j1))*Conjg(Td(j1,j2))*ZA(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*ZA(gt1,2)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,2)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,2)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,2)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*ZA(gt1,3)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,3)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,3)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZA(gt1,3)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*ZA(gt1,1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZD(gt2,j2))*dZA(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZD(gt2,j2))*ZA(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSdcSd  
 
 
Subroutine CT_CouplingAhSecSe(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,dYe,dTe,              & 
& dlam,dvu,dvS,dZE,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,vS,ZA(3,3),dvu,dvS,dZA(3,3)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,ZE(6,6),dYe(3,3),dTe(3,3),dlam,dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZE(gt3,j2)*ZA(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2)*ZA(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZA(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*dZA(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*dZA(gt1,3)*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt2,j2))*dTe(j1,j2)*ZA(gt1,1)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZA(gt1,2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZA(gt1,3)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,3)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,3)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZA(gt1,3)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZA(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZA(gt1,2)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZA(gt1,3)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,3 + j1))*Conjg(Te(j1,j2))*ZA(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*ZA(gt1,2)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,2)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,2)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,2)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*ZA(gt1,3)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,3)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,3)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZA(gt1,3)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*ZA(gt1,1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt2,j2))*dZA(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt2,j2))*ZA(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSecSe  
 
 
Subroutine CT_CouplingAhSucSu(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,dlam,dYu,             & 
& dTu,dvd,dvS,dZU,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vS,ZA(3,3),dvd,dvS,dZA(3,3)

Complex(dp), Intent(in) :: lam,Yu(3,3),Tu(3,3),ZU(6,6),dlam,dYu(3,3),dTu(3,3),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2)*ZA(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZA(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZU(gt3,j2)*ZA(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZA(gt1,1)*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZU(gt2,j2))*dZA(gt1,3)*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZA(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZU(gt2,j2))*dTu(j1,j2)*ZA(gt1,2)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZA(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZA(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZA(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZA(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZA(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZA(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZA(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZA(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZA(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*ZA(gt1,2)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZU(gt2,j2))*dZA(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZU(gt2,j2))*ZA(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSucSu  
 
 
Subroutine CT_CouplingAhSvImSvIm(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,              & 
& vd,vu,vS,ZVI,ZA,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVI,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vu,vS,ZA(3,3),dvd,dvu,dvS,dZA(3,3)

Complex(dp), Intent(in) :: MUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVI(9,9),dMUX(3,3),               & 
& dlam,dkap,dlamN(3,3),dTLN(3,3),dYv(3,3),dTv(3,3),dZVI(9,9)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSvImSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(TLN(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*Conjg(TLN(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dkap*vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dkap*vS*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*dTLN(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*dTLN(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*dZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*dZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dlamN(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dlamN(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dlamN(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dlamN(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSvImSvIm  
 
 
Subroutine CT_CouplingAhSvImSvRe(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,              & 
& vd,vu,vS,ZVI,ZVR,ZA,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVI,dZVR,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vu,vS,ZA(3,3),dvd,dvu,dvS,dZA(3,3)

Complex(dp), Intent(in) :: MUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVI(9,9),ZVR(9,9),dMUX(3,3),      & 
& dlam,dkap,dlamN(3,3),dTLN(3,3),dYv(3,3),dTv(3,3),dZVI(9,9),dZVR(9,9)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSvImSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dkap*vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dkap*vS*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dTLN(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dTLN(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dkap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSvImSvRe  
 
 
Subroutine CT_CouplingAhSvReSvRe(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,              & 
& vd,vu,vS,ZVR,ZA,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVR,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vu,vS,ZA(3,3),dvd,dvu,dvS,dZA(3,3)

Complex(dp), Intent(in) :: MUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVR(9,9),dMUX(3,3),               & 
& dlam,dkap,dlamN(3,3),dTLN(3,3),dYv(3,3),dTv(3,3),dZVR(9,9)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSvReSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*dZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZA(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dkap*vS*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*kap*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dkap*vS*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*kap*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,6 + j2))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dTLN(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dTLN(j1,j2)*ZA(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZA(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j1))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,6 + j2))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZA(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZA(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZA(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVR(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZA(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVR(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZA(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZA(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZA(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSvReSvRe  
 
 
Subroutine CT_Couplinghhhhhh(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,              & 
& ZH,dg1,dg2,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),dg1,dg2,dvd,dvu,dvS,dZH(3,3)

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,dlam,dTlam,dkap,dTk

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*g1**2*vd*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(-3*g2**2*vd*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(g1**2*vu*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res+(g2**2*vu*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))
res = res-(vS*lam*Conjg(lam)*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1**2*vu*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res+(g2**2*vu*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))
res = res+(g1**2*vd*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res+(g2**2*vd*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(dZH(gt3,3)*Tlam*ZH(gt1,2)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,1))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,1))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,1))
res = res+(dZH(gt3,2)*Tlam*ZH(gt1,3)*ZH(gt2,1))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vu*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(g2**2*vu*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))
res = res+(g1**2*vd*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res+(g2**2*vd*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(dZH(gt3,3)*Tlam*ZH(gt1,1)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vd*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(g2**2*vd*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))
res = res+(-3*g1**2*vu*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res+(-3*g2**2*vu*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2))/4._dp
res = res-(vS*lam*Conjg(lam)*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,2))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,2))
res = res+(vd*lam*Conjg(kap)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,2))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,2))
res = res+(dZH(gt3,1)*Tlam*ZH(gt1,3)*ZH(gt2,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,3))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,3))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,3)*ZH(gt1,1)*ZH(gt2,3))
res = res+(dZH(gt3,2)*Tlam*ZH(gt1,1)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,3))
res = res+(vd*lam*Conjg(kap)*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,3))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,3)*ZH(gt1,2)*ZH(gt2,3))
res = res+(dZH(gt3,1)*Tlam*ZH(gt1,2)*ZH(gt2,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt3,1)*ZH(gt1,3)*ZH(gt2,3))
res = res+(vd*lam*Conjg(kap)*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,3))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt3,2)*ZH(gt1,3)*ZH(gt2,3))
res = res-6*vS*kap*Conjg(kap)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,3)
res = res-((Conjg(Tk)*dZH(gt3,3)*ZH(gt1,3)*ZH(gt2,3))/sqrt(2._dp))
res = res-((dZH(gt3,3)*Tk*ZH(gt1,3)*ZH(gt2,3))/sqrt(2._dp))
res = res+(-3*g1**2*vd*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(-3*g2**2*vd*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(g1**2*vu*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))
res = res-(vS*lam*Conjg(lam)*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,1))
res = res+(g1**2*vu*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))
res = res+(g1**2*vd*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dZH(gt2,3)*Tlam*ZH(gt1,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,1))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,1))
res = res+(dZH(gt2,2)*Tlam*ZH(gt1,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(-3*g1**2*vd*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*g2**2*vd*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(g1**2*vu*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(vS*lam*Conjg(lam)*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*dvd*g1**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*dvd*g2**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(-3*dg1*g1*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dg2*g2*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dvu*g1**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(dvu*g2**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dlam*vu*Conjg(lam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dvu*lam*Conjg(lam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,1))
res = res+(g1**2*vu*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vu*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(g1**2*vd*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(g2**2*vd*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(vS*lam*Conjg(kap)*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dZH(gt1,3)*Tlam*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dvu*g1**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvu*g2**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dlam*vu*Conjg(lam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dvu*lam*Conjg(lam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(dvd*g1**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dvd*g2**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dlam*vd*Conjg(lam)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dvd*lam*Conjg(lam)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(dTlam*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(Conjg(dTlam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vS*lam*Conjg(lam)*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))
res = res+(vS*lam*Conjg(kap)*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(Conjg(Tlam)*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))
res = res+(dZH(gt1,2)*Tlam*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,1))
res = res+(dTlam*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(Conjg(dTlam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vu*lam*Conjg(dkap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(vu*kap*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))
res = res+(dlam*vu*Conjg(kap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dlam*vd*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))
res = res+(dkap*vu*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res+(dvu*kap*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))/2._dp
res = res-(dvd*lam*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,1))
res = res+(g1**2*vu*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))
res = res+(g1**2*vd*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dZH(gt2,3)*Tlam*ZH(gt1,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vd*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))
res = res+(-3*g1**2*vu*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res+(-3*g2**2*vu*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2))/4._dp
res = res-(vS*lam*Conjg(lam)*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,2))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,2))
res = res+(vd*lam*Conjg(kap)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,2))
res = res+(dZH(gt2,1)*Tlam*ZH(gt1,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vu*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vu*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(g1**2*vd*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(vS*lam*Conjg(kap)*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dZH(gt1,3)*Tlam*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dvu*g1**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvu*g2**2*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dlam*vu*Conjg(lam)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dvu*lam*Conjg(lam)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(dvd*g1**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dvd*g2**2*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dlam*vd*Conjg(lam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dvd*lam*Conjg(lam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(dTlam*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(Conjg(dTlam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(g1**2*vd*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(g2**2*vd*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*g1**2*vu*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*g2**2*vu*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res-(vS*lam*Conjg(lam)*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))
res = res+(dvd*g1**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(dvd*g2**2*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dlam*vd*Conjg(lam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dvd*lam*Conjg(lam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*dvu*g1**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*dvu*g2**2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/4._dp
res = res+(-3*dg1*g1*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dg2*g2*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,2))
res = res+(vS*lam*Conjg(kap)*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(Conjg(Tlam)*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))
res = res+(vd*lam*Conjg(kap)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))
res = res+(dZH(gt1,1)*Tlam*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(Conjg(dTlam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,2))
res = res+(vd*lam*Conjg(dkap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(vd*kap*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))
res = res+(dlam*vd*Conjg(kap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res+(dkap*vd*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dlam*vu*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))
res = res+(dvd*kap*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))/2._dp
res = res-(dvu*lam*Conjg(lam)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,2))
res = res-(vS*lam*Conjg(lam)*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,3))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt2,3)*ZH(gt1,1)*ZH(gt3,3))
res = res+(dZH(gt2,2)*Tlam*ZH(gt1,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(kap)*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,3))
res = res+(vd*lam*Conjg(kap)*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,3))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt2,3)*ZH(gt1,2)*ZH(gt3,3))
res = res+(dZH(gt2,1)*Tlam*ZH(gt1,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt2,1)*ZH(gt1,3)*ZH(gt3,3))
res = res+(vd*lam*Conjg(kap)*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,3))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt2,2)*ZH(gt1,3)*ZH(gt3,3))
res = res-6*vS*kap*Conjg(kap)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,3)
res = res-((Conjg(Tk)*dZH(gt2,3)*ZH(gt1,3)*ZH(gt3,3))/sqrt(2._dp))
res = res-((dZH(gt2,3)*Tk*ZH(gt1,3)*ZH(gt3,3))/sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))
res = res+(vS*lam*Conjg(kap)*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vu*lam*Conjg(kap)*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))
res = res+(dZH(gt1,2)*Tlam*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,3))
res = res+(dTlam*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(Conjg(dTlam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vu*lam*Conjg(dkap)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))
res = res+(dlam*vu*Conjg(kap)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dlam*vd*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))
res = res+(dkap*vu*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res+(dvu*kap*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))/2._dp
res = res-(dvd*lam*Conjg(lam)*ZH(gt1,3)*ZH(gt2,1)*ZH(gt3,3))
res = res+(vS*lam*Conjg(kap)*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(lam)*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(Conjg(Tlam)*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))
res = res+(vd*lam*Conjg(kap)*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))
res = res+(dZH(gt1,1)*Tlam*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(dTlam*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(vS*lam*Conjg(dkap)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vS*kap*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(Conjg(dTlam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/(2._dp*sqrt(2._dp))
res = res+(dlam*vS*Conjg(kap)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvS*lam*Conjg(kap)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dkap*vS*Conjg(lam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvS*kap*Conjg(lam)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,3))
res = res+(vd*lam*Conjg(dkap)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))
res = res+(dlam*vd*Conjg(kap)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res+(dkap*vd*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dlam*vu*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))
res = res+(dvd*kap*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))/2._dp
res = res-(dvu*lam*Conjg(lam)*ZH(gt1,3)*ZH(gt2,2)*ZH(gt3,3))
res = res+(vu*lam*Conjg(kap)*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(lam)*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(lam)*dZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))
res = res+(vd*lam*Conjg(kap)*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(lam)*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(vu*lam*Conjg(lam)*dZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))
res = res-6*vS*kap*Conjg(kap)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res-((Conjg(Tk)*dZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp))
res = res-((dZH(gt1,3)*Tk*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp))
res = res+(vu*lam*Conjg(dkap)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vu*kap*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(vd*lam*Conjg(dlam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))
res = res+(dlam*vu*Conjg(kap)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvu*lam*Conjg(kap)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dlam*vd*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))
res = res+(dkap*vu*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvu*kap*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dvd*lam*Conjg(lam)*ZH(gt1,1)*ZH(gt2,3)*ZH(gt3,3))
res = res+(vd*lam*Conjg(dkap)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(vd*kap*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(vu*lam*Conjg(dlam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))
res = res+(dlam*vd*Conjg(kap)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dvd*lam*Conjg(kap)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res+(dkap*vd*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dlam*vu*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))
res = res+(dvd*kap*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))/2._dp
res = res-(dvu*lam*Conjg(lam)*ZH(gt1,2)*ZH(gt2,3)*ZH(gt3,3))
res = res-((dTk*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp))
res = res-6*vS*kap*Conjg(dkap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res-((Conjg(dTk)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3))/sqrt(2._dp))
res = res-6*dkap*vS*Conjg(kap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
res = res-6*dvS*kap*Conjg(kap)*ZH(gt1,3)*ZH(gt2,3)*ZH(gt3,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_Couplinghhhhhh  
 
 
Subroutine CT_CouplinghhHpmcHpm(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,vd,vu,vS,              & 
& ZH,ZP,dg1,dg2,dlam,dTlam,dkap,dvd,dvu,dvS,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),ZP(2,2),dg1,dg2,dvd,dvu,dvS,dZH(3,3),dZP(2,2)

Complex(dp), Intent(in) :: lam,Tlam,kap,dlam,dTlam,dkap

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpmcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1**2*vd*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))/4._dp
res = res-(g2**2*vd*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))/4._dp
res = res-(g2**2*vu*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,1))/4._dp
res = res+(vu*lam*Conjg(lam)*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1**2*vu*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))/4._dp
res = res-(g2**2*vu*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))/4._dp
res = res-(g2**2*vd*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,1))/4._dp
res = res+(vd*lam*Conjg(lam)*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,1))/2._dp
res = res-(vS*lam*Conjg(lam)*dZP(gt3,1)*ZH(gt1,3)*ZP(gt2,1))
res = res-(vS*lam*Conjg(kap)*dZP(gt3,2)*ZH(gt1,3)*ZP(gt2,1))
res = res-((dZP(gt3,2)*Tlam*ZH(gt1,3)*ZP(gt2,1))/sqrt(2._dp))
res = res-(g2**2*vu*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,2))/4._dp
res = res+(vu*lam*Conjg(lam)*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res+(g1**2*vd*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))/4._dp
res = res-(g2**2*vd*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))/4._dp
res = res-(g2**2*vd*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,2))/4._dp
res = res+(vd*lam*Conjg(lam)*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1**2*vu*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))/4._dp
res = res-(g2**2*vu*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))/4._dp
res = res-(vS*kap*Conjg(lam)*dZP(gt3,1)*ZH(gt1,3)*ZP(gt2,2))
res = res-((Conjg(Tlam)*dZP(gt3,1)*ZH(gt1,3)*ZP(gt2,2))/sqrt(2._dp))
res = res-(vS*lam*Conjg(lam)*dZP(gt3,2)*ZH(gt1,3)*ZP(gt2,2))
res = res-(g1**2*vd*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,1))/4._dp
res = res+(vu*lam*Conjg(lam)*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,1))/2._dp
res = res+(g1**2*vu*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,1))/4._dp
res = res+(vd*lam*Conjg(lam)*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,1))/2._dp
res = res-(vS*lam*Conjg(lam)*dZP(gt2,1)*ZH(gt1,3)*ZP(gt3,1))
res = res-(vS*kap*Conjg(lam)*dZP(gt2,2)*ZH(gt1,3)*ZP(gt3,1))
res = res-((Conjg(Tlam)*dZP(gt2,2)*ZH(gt1,3)*ZP(gt3,1))/sqrt(2._dp))
res = res-(g1**2*vd*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res+(g1**2*vu*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(vS*lam*Conjg(lam)*dZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))
res = res-(dvd*g1**2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvd*g2**2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dg1*g1*vd*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dg2*g2*vd*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dvu*g1**2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvu*g2**2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dg2*g2*vu*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,1))
res = res-(g2**2*vu*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(vu*lam*Conjg(lam)*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(g2**2*vd*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(vd*lam*Conjg(lam)*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(vS*kap*Conjg(lam)*dZH(gt1,3)*ZP(gt2,2)*ZP(gt3,1))
res = res-((Conjg(Tlam)*dZH(gt1,3)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(dvu*g2**2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(dg2*g2*vu*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(vu*lam*Conjg(dlam)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dlam*vu*Conjg(lam)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dvu*lam*Conjg(lam)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dvd*g2**2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(dg2*g2*vd*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(vd*lam*Conjg(dlam)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dlam*vd*Conjg(lam)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dvd*lam*Conjg(lam)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(vS*kap*Conjg(dlam)*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,1))
res = res-((Conjg(dTlam)*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(dkap*vS*Conjg(lam)*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,1))
res = res-(dvS*kap*Conjg(lam)*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,1))
res = res-(g2**2*vu*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res+(g1**2*vd*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(g1**2*vu*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))/4._dp
res = res-(vS*lam*Conjg(kap)*dZP(gt2,1)*ZH(gt1,3)*ZP(gt3,2))
res = res-(vS*lam*Conjg(lam)*dZP(gt2,2)*ZH(gt1,3)*ZP(gt3,2))
res = res-((dZP(gt2,1)*Tlam*ZH(gt1,3)*ZP(gt3,2))/sqrt(2._dp))
res = res-(g2**2*vu*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(g2**2*vd*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(vS*lam*Conjg(kap)*dZH(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = res-((dZH(gt1,3)*Tlam*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-(dvu*g2**2*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vu*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vu*lam*Conjg(dlam)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vu*Conjg(lam)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvu*lam*Conjg(lam)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvd*g2**2*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vd*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vd*lam*Conjg(dlam)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vd*Conjg(lam)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvd*lam*Conjg(lam)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-((dTlam*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-(vS*lam*Conjg(dkap)*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = res-(dlam*vS*Conjg(kap)*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = res-(dvS*lam*Conjg(kap)*ZH(gt1,3)*ZP(gt2,1)*ZP(gt3,2))
res = res+(g1**2*vd*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g1**2*vu*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(vS*lam*Conjg(lam)*dZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))
res = res+(dvd*g1**2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvd*g2**2*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dg2*g2*vd*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dvu*g1**2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvu*g2**2*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dg1*g1*vu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dg2*g2*vu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(vS*lam*Conjg(dlam)*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))
res = res-(dlam*vS*Conjg(lam)*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))
res = res-(dvS*lam*Conjg(lam)*ZH(gt1,3)*ZP(gt2,2)*ZP(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpmcHpm  
 
 
Subroutine CT_CouplinghhSdcSd(gt1,gt2,gt3,g1,g2,Yd,Td,lam,vd,vu,vS,ZD,ZH,             & 
& dg1,dg2,dYd,dTd,dlam,dvd,dvu,dvS,dZD,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),dg1,dg2,dvd,dvu,dvS,dZH(3,3)

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,ZD(6,6),dYd(3,3),dTd(3,3),dlam,dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,j1))*dZH(gt1,1)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZD(gt2,j1))*dZH(gt1,1)*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,j1))*dZH(gt1,2)*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt2,j1))*dZH(gt1,2)*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,3 + j1))*dZH(gt1,1)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,3 + j1))*dZH(gt1,2)*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt2,j1))*dZD(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,3 + j1))*dZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZD(gt2,j1))*ZD(gt3,j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1)*ZH(gt1,2))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*dZH(gt1,2)*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*dZH(gt1,3)*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZH(gt1,1)*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZH(gt1,2)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZH(gt1,3)*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZD(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*dTd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,3 + j1))*Conjg(Td(j1,j2))*ZD(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*ZD(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*ZD(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*dZH(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*ZH(gt1,1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,j2))*ZD(gt3,3 + j1)*ZH(gt1,1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*dZH(gt1,1)*Yd(j2,j1)*ZD(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*dZH(gt1,1)*Yd(j1,j2)*ZD(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*dZD(gt3,j3)*Yd(j1,j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZD(gt2,3 + j3))*Conjg(Yd(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZD(gt2,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYd(j1,j3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSdcSd  
 
 
Subroutine CT_CouplinghhSecSe(gt1,gt2,gt3,g1,g2,Ye,Te,lam,vd,vu,vS,ZE,ZH,             & 
& dg1,dg2,dYe,dTe,dlam,dvd,dvu,dvS,dZE,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),dg1,dg2,dvd,dvu,dvS,dZH(3,3)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,ZE(6,6),dYe(3,3),dTe(3,3),dlam,dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZE(gt2,j1))*dZH(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZE(gt2,j1))*dZH(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZE(gt2,j1))*dZH(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt2,j1))*dZH(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZE(gt2,3 + j1))*dZH(gt1,1)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZE(gt2,3 + j1))*dZH(gt1,2)*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+dg1*g1*vd*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,1)
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt2,j1))*dZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZE(gt2,3 + j1))*dZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZE(gt2,j1))*ZE(gt3,j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1)*ZH(gt1,2))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*dZH(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*dZH(gt1,3)*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZH(gt1,1)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZH(gt1,2)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZH(gt1,3)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZE(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,3 + j1))*Conjg(Te(j1,j2))*ZE(gt3,j2)*ZH(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*ZE(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*ZE(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*dZH(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*ZH(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,j2))*ZE(gt3,3 + j1)*ZH(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*dZH(gt1,1)*Ye(j2,j1)*ZE(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*dZH(gt1,1)*Ye(j1,j2)*ZE(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*dZE(gt3,j3)*Ye(j1,j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZE(gt2,3 + j3))*Conjg(Ye(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZE(gt2,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZH(gt1,1))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSecSe  
 
 
Subroutine CT_CouplinghhSucSu(gt1,gt2,gt3,g1,g2,lam,Yu,Tu,vd,vu,vS,ZU,ZH,             & 
& dg1,dg2,dlam,dYu,dTu,dvd,dvu,dvS,dZU,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),dg1,dg2,dvd,dvu,dvS,dZH(3,3)

Complex(dp), Intent(in) :: lam,Yu(3,3),Tu(3,3),ZU(6,6),dlam,dYu(3,3),dTu(3,3),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,2))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZU(gt2,j1))*dZU(gt3,j1)*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1)*ZH(gt1,2))/3._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZU(gt2,j1))*dZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZH(gt1,1)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZU(gt2,j1))*dZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZU(gt2,j1))*dZH(gt1,2)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZU(gt2,j1))*ZH(gt1,1)*ZU(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZU(gt2,j1))*ZH(gt1,2)*ZU(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZU(gt2,3 + j1))*dZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZU(gt2,3 + j1))*dZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*dg1*g1*vd*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*g1*vu*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2)*ZH(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZH(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZU(gt3,j2)*ZH(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZH(gt1,1)*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZU(gt2,j2))*dZH(gt1,3)*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZH(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,1)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,j2))*dTu(j1,j2)*ZH(gt1,2)*ZU(gt3,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZH(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,3)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZH(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZH(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZH(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZH(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,1)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZH(gt1,2)*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZH(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZH(gt1,3)*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*ZH(gt1,2)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZU(gt2,j2))*dZH(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,j2))*ZH(gt1,2)*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZU(gt3,j3)*Yu(j1,j2)*ZH(gt1,2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZH(gt1,2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZH(gt1,2)*Yu(j2,j1)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yu(j2,j1)*ZH(gt1,2)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZH(gt1,2)*Yu(j1,j2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZU(gt2,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZH(gt1,2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSucSu  
 
 
Subroutine CT_CouplinghhSvImSvIm(gt1,gt2,gt3,g1,g2,MUX,lam,kap,lamN,TLN,              & 
& Yv,Tv,vd,vu,vS,ZVI,ZH,dg1,dg2,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,               & 
& dvS,dZVI,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),dg1,dg2,dvd,dvu,dvS,dZH(3,3)

Complex(dp), Intent(in) :: MUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVI(9,9),dMUX(3,3),               & 
& dlam,dkap,dlamN(3,3),dTLN(3,3),dYv(3,3),dTv(3,3),dZVI(9,9)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSvImSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVI(gt3,j1))*Conjg(ZVI(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZVI(gt2,j1))*Conjg(ZVI(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(TLN(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*Conjg(TLN(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dkap*vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dkap*vS*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*dTLN(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*dTLN(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*dZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*dZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dlamN(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dlamN(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dlamN(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dlamN(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j1,j3))*dlamN(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dlamN(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j3,j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVI(gt2,j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*dZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*dZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j1,j3))*dZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,6 + j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,6 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,6 + j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVI(gt3,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt3,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVI(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVI(gt3,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVI(gt3,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSvImSvIm  
 
 
Subroutine CT_CouplinghhSvImSvRe(gt1,gt2,gt3,MUX,lam,kap,lamN,TLN,Yv,Tv,              & 
& vd,vu,vS,ZVI,ZVR,ZH,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,dvS,dZVI,dZVR,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vu,vS,ZH(3,3),dvd,dvu,dvS,dZH(3,3)

Complex(dp), Intent(in) :: MUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVI(9,9),ZVR(9,9),dMUX(3,3),      & 
& dlam,dkap,dlamN(3,3),dTLN(3,3),dYv(3,3),dTv(3,3),dZVI(9,9),dZVR(9,9)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSvImSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTLN(j1,j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*kap*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dkap*vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*kap*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dkap*vS*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*kap*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dTLN(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dTLN(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(lam)*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(lam)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dlam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(lam)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(kap)*Conjg(dZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dkap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(kap)*Conjg(ZVI(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j1))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVI(gt2,6 + j2))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*dlamN(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dlamN(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVI(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(ZVI(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*dZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVI(gt2,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,6 + j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVI(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVI(gt2,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVI(gt2,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZVI(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVI(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSvImSvRe  
 
 
Subroutine CT_CouplinghhSvReSvRe(gt1,gt2,gt3,g1,g2,MUX,lam,kap,lamN,TLN,              & 
& Yv,Tv,vd,vu,vS,ZVR,ZH,dg1,dg2,dMUX,dlam,dkap,dlamN,dTLN,dYv,dTv,dvd,dvu,               & 
& dvS,dZVR,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,vS,ZH(3,3),dg1,dg2,dvd,dvu,dvS,dZH(3,3)

Complex(dp), Intent(in) :: MUX(3,3),lam,kap,lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVR(9,9),dMUX(3,3),               & 
& dlam,dkap,dlamN(3,3),dTLN(3,3),dYv(3,3),dTv(3,3),dZVR(9,9)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSvReSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*dZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVR(gt3,j1))*Conjg(ZVR(gt2,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZVR(gt2,j1))*Conjg(ZVR(gt3,j1))*ZH(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*dZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*dZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*dZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*dZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,1)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Conjg(Tv(j1,j2))*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dTv(j1,j2)*ZH(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dlamN(j2,j1))*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dTLN(j1,j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dkap*vS*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*kap*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*kap*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dkap*vS*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*kap*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j2,j1))*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j1))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,6 + j2))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*Conjg(TLN(j1,j2))*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dTLN(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dTLN(j1,j2)*ZH(gt1,3))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,1)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,2)*lamN(j2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt3,6 + j1))*Conjg(ZVR(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(kap)*Conjg(dZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dkap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(kap)*Conjg(ZVR(gt2,6 + j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*ZH(gt1,2)*Tv(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*dZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*dZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j1))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j1))*Conjg(ZVR(gt2,6 + j2))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*TLN(j1,j2))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j1,j2))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*MUX(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,2)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,3)*Yv(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dZH(gt1,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*dYv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*dYv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,j3))*Yv(j1,j2)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVR(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Yv(j3,j1))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Yv(j2,j1)*ZH(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dlamN(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*dlamN(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dlamN(j1,j2)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dlamN(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dlamN(j2,j1)*ZH(gt1,3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dMUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j1,j2)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*MUX(j2,j1)*ZH(gt1,3))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVR(gt2,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(ZVR(gt2,j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZH(gt1,3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*dZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*dZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*dZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*dZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,2)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt3,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVR(gt2,6 + j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,j3))*ZH(gt1,3)*lamN(j1,j2))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j1,j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,6 + j3))*Conjg(ZVR(gt2,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,6 + j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVR(gt2,6 + j2))*Conjg(ZVR(gt3,6 + j3))*Conjg(lamN(j1,j3))*ZH(gt1,3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*dZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*dZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt3,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j3))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,6 + j3))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVR(gt2,6 + j3))*Conjg(ZVR(gt3,3 + j2))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlamN(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j2))*Conjg(MUX(j1,j3))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dZVR(gt2,3 + j2))*Conjg(MUX(j3,j1))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j1,j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(Conjg(dMUX(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,6 + j3))*ZH(gt1,3)*lamN(j2,j1))/(4._dp*sqrt(2._dp))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt3,3 + j2))*Conjg(ZVR(gt2,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVR(gt2,3 + j3))*Conjg(ZVR(gt3,3 + j2))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(ZVR(gt2,3 + j2))*Conjg(ZVR(gt3,3 + j3))*Conjg(lamN(j3,j1))*ZH(gt1,3)*lamN(j2,j1))/2._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSvReSvRe  
 
 
Subroutine CT_CouplingHpmSucSd(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,               & 
& ZD,ZU,ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,Yu(3,3),Tu(3,3),ZD(6,6),ZU(6,6),dYd(3,3),dTd(3,3),dlam,           & 
& dYu(3,3),dTu(3,3),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSucSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZP(gt1,1)*ZD(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZU(gt2,j1))*dZP(gt1,2)*ZD(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZU(gt2,j1))*dZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZP(gt1,2)*Yd(j1,j2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZP(gt1,1)*ZD(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZP(gt1,2)*ZD(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dTd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dZP(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dZD(gt3,3 + j1)*ZP(gt1,1)*Td(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZU(gt2,j2))*ZD(gt3,3 + j1)*ZP(gt1,1)*Td(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZP(gt1,1)*Yd(j2,j1)*ZD(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZP(gt1,2)*Yd(j2,j1)*ZD(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dZP(gt1,1)*Yd(j1,j2)*ZD(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZP(gt1,2)*Yu(j1,j2)*ZD(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dZD(gt3,j3)*Yd(j1,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dYd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZU(gt2,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j1,j3))*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZD(gt3,j3)*Yu(j1,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZU(gt2,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSucSd  
 
 
Subroutine CT_CouplingHpmSvImcSe(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,              & 
& vu,vS,ZVI,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVI,dZE,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,lamN(3,3),Yv(3,3),Tv(3,3),ZVI(9,9),ZE(6,6),dYe(3,3),              & 
& dTe(3,3),dlam,dlamN(3,3),dYv(3,3),dTv(3,3),dZVI(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSvImcSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZVI(gt2,j1))*dZP(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVI(gt2,j1))*dZP(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZVI(gt2,j1))*dZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZVI(gt2,j1))*dZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZVI(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*dZP(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*dZP(gt1,1)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZP(gt1,2)*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*dZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZVI(gt2,3 + j1))*Conjg(Yv(j1,j2))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(ZVI(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(lam)*Conjg(dZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dlam)*Conjg(ZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(lam)*Conjg(ZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTv(j1,j2))*Conjg(ZVI(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZVI(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,j2))*dZP(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZVI(gt2,j2))*dZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZVI(gt2,j2))*ZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZP(gt1,1)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZP(gt1,2)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*dZP(gt1,1)*Ye(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*dZP(gt1,2)*Yv(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*dZE(gt3,j3)*Ye(j1,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*dYe(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZVI(gt2,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j1,j3))*Conjg(ZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*dZE(gt3,j3)*Yv(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZVI(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yv(j3,j1))*Conjg(ZVI(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*dlamN(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*dYv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZVI(gt2,j2))*Conjg(Yv(j1,j3))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*dZP(gt1,2)*ZE(gt3,j3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*dZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dZVI(gt2,6 + j2))*Conjg(Yv(j1,j3))*ZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*Conjg(dYv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,6 + j2))*ZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSvImcSe  
 
 
Subroutine CT_CouplingHpmSvRecSe(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,              & 
& vu,vS,ZVR,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVR,dZE,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,lamN(3,3),Yv(3,3),Tv(3,3),ZVR(9,9),ZE(6,6),dYe(3,3),              & 
& dTe(3,3),dlam,dlamN(3,3),dYv(3,3),dTv(3,3),dZVR(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSvRecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVR(gt2,j1))*dZP(gt1,1)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZVR(gt2,j1))*dZP(gt1,2)*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZVR(gt2,j1))*dZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZVR(gt2,j1))*dZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZVR(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,j2))*dZP(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*dZP(gt1,1)*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZP(gt1,2)*ZE(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*dZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt2,3 + j1))*Conjg(Yv(j1,j2))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*dZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZVR(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTv(j1,j2))*Conjg(ZVR(gt2,3 + j1))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(Tv(j1,j2))*ZE(gt3,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*dZP(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZVR(gt2,j2))*dZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,j2))*ZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZP(gt1,1)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZP(gt1,2)*Ye(j2,j1)*ZE(gt3,3 + j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*dZP(gt1,1)*Ye(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*dZP(gt1,2)*Yv(j1,j2)*ZE(gt3,j3))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*dZE(gt3,j3)*Ye(j1,j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*dYe(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*dZE(gt3,j3)*Yv(j1,j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,3 + j3))*Conjg(Yv(j3,j1))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yv(j3,j1))*Conjg(ZVR(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*dlamN(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*dYv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,j2))*Conjg(Yv(j1,j3))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)*ZE(gt3,j3)*ZP(gt1,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*dZP(gt1,2)*ZE(gt3,j3)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*dZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt2,6 + j2))*Conjg(Yv(j1,j3))*ZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dYv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*ZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,6 + j2))*ZE(gt3,j3)*ZP(gt1,2)*lamN(j1,j2))/2._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSvRecSe  
 
 
Subroutine CT_CouplingSdcHpmcSu(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,              & 
& ZD,ZU,ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,Yu(3,3),Tu(3,3),ZD(6,6),ZU(6,6),dYd(3,3),dTd(3,3),dlam,           & 
& dYu(3,3),dTu(3,3),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcHpmcSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZD(gt1,j1))*dZU(gt3,j1)*ZP(gt2,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt1,j1))*dZU(gt3,j1)*ZP(gt2,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZD(gt1,j1))*dZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt1,j1))*dZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,3 + j1))*Conjg(Td(j1,j2))*dZU(gt3,j2)*ZP(gt2,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt1,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*dZU(gt3,j2)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt1,j2))*dZP(gt2,1)*Yu(j1,j2)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt1,j2))*dYu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dTu(j1,j2)*ZP(gt2,2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,3 + j1))*Conjg(Td(j1,j2))*dZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*dZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZD(gt1,3 + j1))*Conjg(Td(j1,j2))*ZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZD(gt1,3 + j1))*Conjg(Yd(j1,j2))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dZU(gt3,3 + j1)*ZP(gt2,2)*Tu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dZP(gt2,2)*ZU(gt3,3 + j1)*Tu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZD(gt1,j2))*ZP(gt2,2)*ZU(gt3,3 + j1)*Tu(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dZU(gt3,j3)*Yd(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dZU(gt3,j3)*Yu(j1,j2)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZP(gt2,1)*Yu(j2,j1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZP(gt2,2)*Yu(j2,j1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dYu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZD(gt1,3 + j3))*Conjg(Yd(j3,j1))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dYu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZD(gt1,3 + j3))*Conjg(Yd(j3,j1))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dZP(gt2,1)*Yd(j1,j2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dZP(gt2,2)*Yu(j1,j2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dYd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZD(gt1,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j1,j3))*Conjg(ZD(gt1,j2))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dYu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZD(gt1,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j1,j3))*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcHpmcSu  
 
 
Subroutine CT_CouplingSeSvImcHpm(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,              & 
& vu,vS,ZVI,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVI,dZE,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,lamN(3,3),Yv(3,3),Tv(3,3),ZVI(9,9),ZE(6,6),dYe(3,3),              & 
& dTe(3,3),dlam,dlamN(3,3),dYv(3,3),dTv(3,3),dZVI(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvImcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*dZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*dZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVI(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZVI(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1))*ZP(gt3,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Te(j1,j2))*dZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*dZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dZP(gt3,1)*Yv(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dYv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVI(gt2,3 + j1))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVI(gt2,j2))*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZE(gt1,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZVI(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVI(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dTv(j1,j2)*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*dZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVI(gt2,3 + j1))*Conjg(ZE(gt1,j2))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,j2))*Conjg(ZVI(gt2,3 + j1))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dZP(gt3,1)*Ye(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dZP(gt3,1)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dZP(gt3,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dYe(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVI(gt2,j3))*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,j2))*Conjg(Ye(j1,j3))*Conjg(ZVI(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVI(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,j2))*Conjg(Yv(j1,j3))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,6 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVI(gt2,6 + j3))*Conjg(ZE(gt1,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZE(gt1,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZE(gt1,j2))*Conjg(ZVI(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVI(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVI(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvImcHpm  
 
 
Subroutine CT_CouplingSeSvRecHpm(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,              & 
& vu,vS,ZVR,ZE,ZP,dg2,dYe,dTe,dlam,dlamN,dYv,dTv,dvd,dvu,dvS,dZVR,dZE,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,lamN(3,3),Yv(3,3),Tv(3,3),ZVR(9,9),ZE(6,6),dYe(3,3),              & 
& dTe(3,3),dlam,dlamN(3,3),dYv(3,3),dTv(3,3),dZVR(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvRecHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*dZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*dZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZVR(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZVR(gt2,j1))*Conjg(ZE(gt1,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,2))/4._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1))*ZP(gt3,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Te(j1,j2))*dZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*dZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dZP(gt3,1)*Yv(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dTe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*Conjg(Te(j1,j2))*ZP(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dYv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZVR(gt2,3 + j1))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*Yv(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZVR(gt2,j2))*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZE(gt1,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZVR(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*Conjg(ZVR(gt2,j2))*ZP(gt3,2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dTv(j1,j2)*ZP(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*dZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZVR(gt2,3 + j1))*Conjg(ZE(gt1,j2))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt1,j2))*Conjg(ZVR(gt2,3 + j1))*ZP(gt3,2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dZP(gt3,1)*Ye(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*dZP(gt3,2)*Yv(j1,j2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dZP(gt3,1)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dZP(gt3,2)*Yv(j2,j1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dYe(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,j3))*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,j2))*Conjg(Ye(j1,j3))*Conjg(ZVR(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Ye(j1,j2)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,1))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*dYv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*dYv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZVR(gt2,j3))*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,j2))*Conjg(Yv(j1,j3))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlamN(j1,j3))*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,6 + j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZVR(gt2,6 + j3))*Conjg(ZE(gt1,j2))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dZE(gt1,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(ZE(gt1,j2))*Conjg(ZVR(gt2,6 + j3))*Conjg(lamN(j1,j3))*Yv(j1,j2)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZVR(gt2,3 + j2))*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Conjg(ZVR(gt2,3 + j2))*Yv(j2,j1)*ZP(gt3,2))/2._dp
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvRecHpm  
 
 
Subroutine CT_CouplingAhhhVZ(gt1,gt2,g1,g2,ZH,ZA,TW,dg1,dg2,dZH,dZA,dSinTW,           & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(3,3),ZA(3,3),TW,dg1,dg2,dZH(3,3),dZA(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*dZH(gt2,1)*ZA(gt1,1))/2._dp
res = res-(g1*dZH(gt2,1)*Sin(TW)*ZA(gt1,1))/2._dp
res = res+(g2*Cos(TW)*dZH(gt2,2)*ZA(gt1,2))/2._dp
res = res+(g1*dZH(gt2,2)*Sin(TW)*ZA(gt1,2))/2._dp
res = res-(g2*Cos(TW)*dZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*dZA(gt1,1)*Sin(TW)*ZH(gt2,1))/2._dp
res = res-(dSinTW*g1*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dCosTW*g2*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dg2*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(dg1*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2*Cos(TW)*dZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(g1*dZA(gt1,2)*Sin(TW)*ZH(gt2,2))/2._dp
res = res+(dSinTW*g1*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dCosTW*g2*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dg2*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(dg1*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZ  
 
 
Subroutine CT_CouplingAhHpmcVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(3,3),ZP(2,2),dg2,dZA(3,3),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHpmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,1)*ZA(gt1,1))/2._dp
res = res-(g2*dZP(gt2,2)*ZA(gt1,2))/2._dp
res = res-(g2*dZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZA(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHpmcVWm  
 
 
Subroutine CT_CouplingAhcHpmVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(3,3),ZP(2,2),dg2,dZA(3,3),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhcHpmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,1)*ZA(gt1,1))/2._dp
res = res-(g2*dZP(gt2,2)*ZA(gt1,2))/2._dp
res = res-(g2*dZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZA(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhcHpmVWm  
 
 
Subroutine CT_CouplinghhHpmcVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(3,3),ZP(2,2),dg2,dZH(3,3),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,1)*ZH(gt1,1))/2._dp
res = res+(g2*dZP(gt2,2)*ZH(gt1,2))/2._dp
res = res-(g2*dZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2*dZH(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpmcVWm  
 
 
Subroutine CT_CouplinghhcHpmVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(3,3),ZP(2,2),dg2,dZH(3,3),dZP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcHpmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*dZP(gt2,1)*ZH(gt1,1))/2._dp
res = res-(g2*dZP(gt2,2)*ZH(gt1,2))/2._dp
res = res+(g2*dZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dg2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZH(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcHpmVWm  
 
 
Subroutine CT_CouplingHpmcHpmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,               & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW,dg1,dg2,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*Cos(TW)*dZP(gt2,1)*ZP(gt1,1))/2._dp
res = res-(g2*dZP(gt2,1)*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*Cos(TW)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res-(g2*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g1*Cos(TW)*dZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZP(gt1,1)*Sin(TW)*ZP(gt2,1))/2._dp
res = res-(dCosTW*g1*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dSinTW*g2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*Cos(TW)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g2*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(dCosTW*g1*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dSinTW*g2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVP  
 
 
Subroutine CT_CouplingHpmcHpmVZ(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,               & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW,dg1,dg2,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*dZP(gt2,1)*ZP(gt1,1))/2._dp
res = res+(g1*dZP(gt2,1)*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g2*Cos(TW)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res+(g1*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g2*Cos(TW)*dZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*dZP(gt1,1)*Sin(TW)*ZP(gt2,1))/2._dp
res = res+(dSinTW*g1*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dCosTW*g2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dg1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*Cos(TW)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res+(dSinTW*g1*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dCosTW*g2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVZ  
 
 
Subroutine CT_CouplingSdcSdVG(gt1,gt2,g3,dg3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+dg3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVG  
 
 
Subroutine CT_CouplingSdcSdVP(gt1,gt2,g1,g2,ZD,TW,dg1,dg2,dZD,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,j1))*Cos(TW)*dZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,3 + j1))*Cos(TW)*dZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g1*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g2*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVP  
 
 
Subroutine CT_CouplingSdcSdVZ(gt1,gt2,g1,g2,ZD,TW,dg1,dg2,dZD,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZD(gt1,j1))*Cos(TW)*dZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,3 + j1))*dZD(gt2,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVZ  
 
 
Subroutine CT_CouplingSdcSucVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZD(6,6),ZU(6,6),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSucVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZD(gt1,j1))*dZU(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZD(gt1,j1))*ZU(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZD(gt1,j1))*ZU(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSucVWm  
 
 
Subroutine CT_CouplingSeSvImcVWm(gt1,gt2,g2,ZVI,ZE,dg2,dZVI,dZE,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZVI(9,9),ZE(6,6),dZVI(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvImcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(dZVI(gt2,j1))*Conjg(ZE(gt1,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZE(gt1,j1))*Conjg(ZVI(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZE(gt1,j1))*Conjg(ZVI(gt2,j1)))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvImcVWm  
 
 
Subroutine CT_CouplingSeSvRecVWm(gt1,gt2,g2,ZVR,ZE,dg2,dZVR,dZE,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZVR(9,9),ZE(6,6),dZVR(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSeSvRecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(dZVR(gt2,j1))*Conjg(ZE(gt1,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZE(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZE(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSeSvRecVWm  
 
 
Subroutine CT_CouplingSecSeVP(gt1,gt2,g1,g2,ZE,TW,dg1,dg2,dZE,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,j1))*Cos(TW)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,3 + j1))*Cos(TW)*dZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g2*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVP  
 
 
Subroutine CT_CouplingSecSeVZ(gt1,gt2,g1,g2,ZE,TW,dg1,dg2,dZE,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZE(gt1,j1))*Cos(TW)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+g1*Conjg(ZE(gt1,3 + j1))*dZE(gt2,3 + j1)*Sin(TW)
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+dSinTW*g1*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+g1*Conjg(dZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+dg1*Conjg(ZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVZ  
 
 
Subroutine CT_CouplingSucSuVG(gt1,gt2,g3,dg3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+dg3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVG  
 
 
Subroutine CT_CouplingSucSuVP(gt1,gt2,g1,g2,ZU,TW,dg1,dg2,dZU,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1*Conjg(ZU(gt1,j1))*Cos(TW)*dZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(ZU(gt1,3 + j1))*Cos(TW)*dZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g1*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g2*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(2*dCosTW*g1*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(dZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*Conjg(ZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVP  
 
 
Subroutine CT_CouplingSucSdVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZD(6,6),ZU(6,6),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSdVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*dZD(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*ZD(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*ZD(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSdVWm  
 
 
Subroutine CT_CouplingSucSuVZ(gt1,gt2,g1,g2,ZU,TW,dg1,dg2,dZU,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*Cos(TW)*dZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*Conjg(ZU(gt1,3 + j1))*dZU(gt2,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*dSinTW*g1*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*Conjg(dZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*dg1*Conjg(ZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVZ  
 
 
Subroutine CT_CouplingSvImSvReVZ(gt1,gt2,g1,g2,ZVI,ZVR,TW,dg1,dg2,dZVI,               & 
& dZVR,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZVI(9,9),ZVR(9,9),dZVI(9,9),dZVR(9,9)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvImSvReVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1)))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Cos(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZVR(gt2,j1))*Conjg(ZVI(gt1,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZVI(gt1,j1))*Conjg(ZVR(gt2,j1))*Sin(TW))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvImSvReVZ  
 
 
Subroutine CT_CouplingSvImcSeVWm(gt1,gt2,g2,ZVI,ZE,dg2,dZVI,dZE,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZVI(9,9),ZE(6,6),dZVI(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvImcSeVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZVI(gt1,j1))*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZVI(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZVI(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvImcSeVWm  
 
 
Subroutine CT_CouplingSvRecSeVWm(gt1,gt2,g2,ZVR,ZE,dg2,dZVR,dZE,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZVR(9,9),ZE(6,6),dZVR(9,9),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvRecSeVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZVR(gt1,j1))*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZVR(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZVR(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvRecSeVWm  
 
 
Subroutine CT_CouplinghhcVWmVWm(gt1,g2,vd,vu,ZH,dg2,dvd,dvu,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vd,vu,ZH(3,3),dg2,dvd,dvu,dZH(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*dZH(gt1,1))/2._dp
res = res+(g2**2*vu*dZH(gt1,2))/2._dp
res = res+(dvd*g2**2*ZH(gt1,1))/2._dp
res = res+dg2*g2*vd*ZH(gt1,1)
res = res+(dvu*g2**2*ZH(gt1,2))/2._dp
res = res+dg2*g2*vu*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcVWmVWm  
 
 
Subroutine CT_CouplinghhVZVZ(gt1,g1,g2,vd,vu,ZH,TW,dg1,dg2,dvd,dvu,dZH,               & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZH(3,3),TW,dg1,dg2,dvd,dvu,dZH(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*vd*dZH(gt1,1))/4._dp
res = res+(g2**2*vd*dZH(gt1,1))/4._dp
res = res-(g1**2*vd*Cos(TW)**2*dZH(gt1,1))/4._dp
res = res+(g2**2*vd*Cos(TW)**2*dZH(gt1,1))/4._dp
res = res+(g1**2*vu*dZH(gt1,2))/4._dp
res = res+(g2**2*vu*dZH(gt1,2))/4._dp
res = res-(g1**2*vu*Cos(TW)**2*dZH(gt1,2))/4._dp
res = res+(g2**2*vu*Cos(TW)**2*dZH(gt1,2))/4._dp
res = res+g1*g2*vd*Cos(TW)*dZH(gt1,1)*Sin(TW)
res = res+g1*g2*vu*Cos(TW)*dZH(gt1,2)*Sin(TW)
res = res+(g1**2*vd*dZH(gt1,1)*Sin(TW)**2)/4._dp
res = res-(g2**2*vd*dZH(gt1,1)*Sin(TW)**2)/4._dp
res = res+(g1**2*vu*dZH(gt1,2)*Sin(TW)**2)/4._dp
res = res-(g2**2*vu*dZH(gt1,2)*Sin(TW)**2)/4._dp
res = res+(dvd*g1**2*ZH(gt1,1))/4._dp
res = res+(dvd*g2**2*ZH(gt1,1))/4._dp
res = res+(dg1*g1*vd*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vd*ZH(gt1,1))/2._dp
res = res-(dCosTW*g1**2*vd*Cos(TW)*ZH(gt1,1))/2._dp
res = res+dSinTW*g1*g2*vd*Cos(TW)*ZH(gt1,1)
res = res+(dCosTW*g2**2*vd*Cos(TW)*ZH(gt1,1))/2._dp
res = res-(dvd*g1**2*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res+(dvd*g2**2*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res-(dg1*g1*vd*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vd*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+(dSinTW*g1**2*vd*Sin(TW)*ZH(gt1,1))/2._dp
res = res+dCosTW*g1*g2*vd*Sin(TW)*ZH(gt1,1)
res = res-(dSinTW*g2**2*vd*Sin(TW)*ZH(gt1,1))/2._dp
res = res+dvd*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+dg2*g1*vd*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+dg1*g2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(dvd*g1**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dvd*g2**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dg1*g1*vd*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res-(dg2*g2*vd*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dvu*g1**2*ZH(gt1,2))/4._dp
res = res+(dvu*g2**2*ZH(gt1,2))/4._dp
res = res+(dg1*g1*vu*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vu*ZH(gt1,2))/2._dp
res = res-(dCosTW*g1**2*vu*Cos(TW)*ZH(gt1,2))/2._dp
res = res+dSinTW*g1*g2*vu*Cos(TW)*ZH(gt1,2)
res = res+(dCosTW*g2**2*vu*Cos(TW)*ZH(gt1,2))/2._dp
res = res-(dvu*g1**2*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res+(dvu*g2**2*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res-(dg1*g1*vu*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vu*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+(dSinTW*g1**2*vu*Sin(TW)*ZH(gt1,2))/2._dp
res = res+dCosTW*g1*g2*vu*Sin(TW)*ZH(gt1,2)
res = res-(dSinTW*g2**2*vu*Sin(TW)*ZH(gt1,2))/2._dp
res = res+dvu*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+dg2*g1*vu*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+dg1*g2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(dvu*g1**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dvu*g2**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dg1*g1*vu*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res-(dg2*g2*vu*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZ  
 
 
Subroutine CT_CouplingHpmcVWmVP(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)*dZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZP(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(dCosTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVP  
 
 
Subroutine CT_CouplingHpmcVWmVZ(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*dZP(gt1,1)*Sin(TW))/2._dp
res = res-(g1*g2*vu*dZP(gt1,2)*Sin(TW))/2._dp
res = res+(dSinTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res+(dvd*g1*g2*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg2*g1*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res-(dvu*g1*g2*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVZ  
 
 
Subroutine CT_CouplingcHpmVPVWm(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)*dZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZP(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(dCosTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVPVWm  
 
 
Subroutine CT_CouplingcHpmVWmVZ(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*dZP(gt1,1)*Sin(TW))/2._dp
res = res-(g1*g2*vu*dZP(gt1,2)*Sin(TW))/2._dp
res = res+(dSinTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res+(dvd*g1*g2*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg2*g1*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res-(dvu*g1*g2*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVWmVZ  
 
 
Subroutine CT_CouplingVGVGVG(g3,dg3,res)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingVGVGVG' 
 
res = 0._dp 
res = res+dg3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingVGVGVG  
 
 
Subroutine CT_CouplingcVWmVPVWm(g2,TW,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+dSinTW*g2
res = res+dg2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVPVWm  
 
 
Subroutine CT_CouplingcVWmVWmVZ(g2,TW,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(dCosTW*g2)
res = res-(dg2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVWmVZ  
 
 
Subroutine CT_CouplingcChaChaAh(gt1,gt2,gt3,g2,lam,ZA,UM,UP,dg2,dlam,dZA,             & 
& dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,ZA(3,3),dg2,dZA(3,3)

Complex(dp), Intent(in) :: lam,UM(2,2),UP(2,2),dlam,dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((g2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*dZA(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*dZA(gt3,2))/sqrt(2._dp))
resL = resL+(lam*Conjg(UM(gt2,2))*Conjg(UP(gt1,2))*dZA(gt3,3))/sqrt(2._dp)
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(UM(gt2,2))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,2))*Conjg(UP(gt1,1))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(UM(gt2,1))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,1))*Conjg(UP(gt1,2))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*ZA(gt3,2))/sqrt(2._dp))
resL = resL+(lam*Conjg(dUP(gt1,2))*Conjg(UM(gt2,2))*ZA(gt3,3))/sqrt(2._dp)
resL = resL+(lam*Conjg(dUM(gt2,2))*Conjg(UP(gt1,2))*ZA(gt3,3))/sqrt(2._dp)
resL = resL+(dlam*Conjg(UM(gt2,2))*Conjg(UP(gt1,2))*ZA(gt3,3))/sqrt(2._dp)
resR = 0._dp 
resR = resR+(g2*dZA(gt3,1)*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp)
resR = resR+(g2*dZA(gt3,2)*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp)
resR = resR-((Conjg(lam)*dZA(gt3,3)*UM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
resR = resR+(g2*dUP(gt2,1)*UM(gt1,2)*ZA(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dUM(gt1,2)*UP(gt2,1)*ZA(gt3,1))/sqrt(2._dp)
resR = resR+(dg2*UM(gt1,2)*UP(gt2,1)*ZA(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dUP(gt2,2)*UM(gt1,1)*ZA(gt3,2))/sqrt(2._dp)
resR = resR+(g2*dUM(gt1,1)*UP(gt2,2)*ZA(gt3,2))/sqrt(2._dp)
resR = resR+(dg2*UM(gt1,1)*UP(gt2,2)*ZA(gt3,2))/sqrt(2._dp)
resR = resR-((Conjg(lam)*dUP(gt2,2)*UM(gt1,2)*ZA(gt3,3))/sqrt(2._dp))
resR = resR-((Conjg(lam)*dUM(gt1,2)*UP(gt2,2)*ZA(gt3,3))/sqrt(2._dp))
resR = resR-((Conjg(dlam)*UM(gt1,2)*UP(gt2,2)*ZA(gt3,3))/sqrt(2._dp))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaAh  
 
 
Subroutine CT_CouplingChiChiAh(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,dg1,dg2,               & 
& dlam,dkap,dZA,dZN,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,ZA(3,3),dg1,dg2,dZA(3,3)

Complex(dp), Intent(in) :: lam,kap,ZN(5,5),dlam,dkap,dZN(5,5)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*dZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*dZA(gt3,1))/2._dp
resL = resL+(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*dZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*dZA(gt3,1))/2._dp
resL = resL-((lam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*dZA(gt3,1))/sqrt(2._dp))
resL = resL-((lam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*dZA(gt3,1))/sqrt(2._dp))
resL = resL-(g1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*dZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*dZA(gt3,2))/2._dp
resL = resL-((lam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*dZA(gt3,2))/sqrt(2._dp))
resL = resL-(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*dZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*dZA(gt3,2))/2._dp
resL = resL-((lam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*dZA(gt3,2))/sqrt(2._dp))
resL = resL-((lam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3))*dZA(gt3,3))/sqrt(2._dp))
resL = resL-((lam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4))*dZA(gt3,3))/sqrt(2._dp))
resL = resL+sqrt(2._dp)*kap*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,5))*dZA(gt3,3)
resL = resL+(g1*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,1))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,2))*ZA(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,3))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,3))*ZA(gt3,1))/2._dp
resL = resL-((lam*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,4))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,5))*ZA(gt3,1))/sqrt(2._dp))
resL = resL+(g1*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,1))*ZA(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,2))*ZA(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*ZA(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*ZA(gt3,1))/2._dp
resL = resL-((lam*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,4))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,5))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*ZA(gt3,1))/sqrt(2._dp))
resL = resL-(g1*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,1))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,2))*ZA(gt3,2))/2._dp
resL = resL-((lam*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,3))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,4))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,4))*ZA(gt3,2))/2._dp
resL = resL-((lam*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,5))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-(g1*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,1))*ZA(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,2))*ZA(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*ZA(gt3,2))/2._dp
resL = resL-((lam*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,3))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*ZA(gt3,2))/2._dp
resL = resL-((lam*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,5))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*ZA(gt3,2))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,3))*ZA(gt3,3))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,4))*ZA(gt3,3))/sqrt(2._dp))
resL = resL+sqrt(2._dp)*kap*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,5))*ZA(gt3,3)
resL = resL-((lam*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,3))*ZA(gt3,3))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3))*ZA(gt3,3))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,4))*ZA(gt3,3))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4))*ZA(gt3,3))/sqrt(2._dp))
resL = resL+sqrt(2._dp)*kap*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,5))*ZA(gt3,3)
resL = resL+sqrt(2._dp)*dkap*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,5))*ZA(gt3,3)
resR = 0._dp 
resR = resR-(g1*dZN(gt2,3)*ZA(gt3,1)*ZN(gt1,1))/2._dp
resR = resR+(g1*dZN(gt2,4)*ZA(gt3,2)*ZN(gt1,1))/2._dp
resR = resR+(g2*dZN(gt2,3)*ZA(gt3,1)*ZN(gt1,2))/2._dp
resR = resR-(g2*dZN(gt2,4)*ZA(gt3,2)*ZN(gt1,2))/2._dp
resR = resR-(g1*dZN(gt2,1)*ZA(gt3,1)*ZN(gt1,3))/2._dp
resR = resR+(g2*dZN(gt2,2)*ZA(gt3,1)*ZN(gt1,3))/2._dp
resR = resR+(Conjg(lam)*dZN(gt2,5)*ZA(gt3,2)*ZN(gt1,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,4)*ZA(gt3,3)*ZN(gt1,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,5)*ZA(gt3,1)*ZN(gt1,4))/sqrt(2._dp)
resR = resR+(g1*dZN(gt2,1)*ZA(gt3,2)*ZN(gt1,4))/2._dp
resR = resR-(g2*dZN(gt2,2)*ZA(gt3,2)*ZN(gt1,4))/2._dp
resR = resR+(Conjg(lam)*dZN(gt2,3)*ZA(gt3,3)*ZN(gt1,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,4)*ZA(gt3,1)*ZN(gt1,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,3)*ZA(gt3,2)*ZN(gt1,5))/sqrt(2._dp)
resR = resR-(sqrt(2._dp)*Conjg(kap)*dZN(gt2,5)*ZA(gt3,3)*ZN(gt1,5))
resR = resR-(g1*dZN(gt1,3)*ZA(gt3,1)*ZN(gt2,1))/2._dp
resR = resR+(g1*dZN(gt1,4)*ZA(gt3,2)*ZN(gt2,1))/2._dp
resR = resR-(g1*dZA(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR-(dg1*ZA(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR+(g1*dZA(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR+(dg1*ZA(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR+(g2*dZN(gt1,3)*ZA(gt3,1)*ZN(gt2,2))/2._dp
resR = resR-(g2*dZN(gt1,4)*ZA(gt3,2)*ZN(gt2,2))/2._dp
resR = resR+(g2*dZA(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR+(dg2*ZA(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR-(g2*dZA(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR-(dg2*ZA(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR-(g1*dZN(gt1,1)*ZA(gt3,1)*ZN(gt2,3))/2._dp
resR = resR+(g2*dZN(gt1,2)*ZA(gt3,1)*ZN(gt2,3))/2._dp
resR = resR+(Conjg(lam)*dZN(gt1,5)*ZA(gt3,2)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,4)*ZA(gt3,3)*ZN(gt2,3))/sqrt(2._dp)
resR = resR-(g1*dZA(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR-(dg1*ZA(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR+(g2*dZA(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR+(dg2*ZA(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR+(Conjg(lam)*dZA(gt3,3)*ZN(gt1,4)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZA(gt3,3)*ZN(gt1,4)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZA(gt3,2)*ZN(gt1,5)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZA(gt3,2)*ZN(gt1,5)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,5)*ZA(gt3,1)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(g1*dZN(gt1,1)*ZA(gt3,2)*ZN(gt2,4))/2._dp
resR = resR-(g2*dZN(gt1,2)*ZA(gt3,2)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*dZN(gt1,3)*ZA(gt3,3)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(g1*dZA(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR+(dg1*ZA(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR-(g2*dZA(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR-(dg2*ZA(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*dZA(gt3,3)*ZN(gt1,3)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZA(gt3,3)*ZN(gt1,3)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZA(gt3,1)*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZA(gt3,1)*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,4)*ZA(gt3,1)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,3)*ZA(gt3,2)*ZN(gt2,5))/sqrt(2._dp)
resR = resR-(sqrt(2._dp)*Conjg(kap)*dZN(gt1,5)*ZA(gt3,3)*ZN(gt2,5))
resR = resR+(Conjg(lam)*dZA(gt3,2)*ZN(gt1,3)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZA(gt3,2)*ZN(gt1,3)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZA(gt3,1)*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZA(gt3,1)*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR-(sqrt(2._dp)*Conjg(kap)*dZA(gt3,3)*ZN(gt1,5)*ZN(gt2,5))
resR = resR-(sqrt(2._dp)*Conjg(dkap)*ZA(gt3,3)*ZN(gt1,5)*ZN(gt2,5))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiAh  
 
 
Subroutine CT_CouplingcFdFdAh(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,dYd,dZA,dZDL,dZDR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(3,3),dZA(3,3)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dZA(gt3,1)*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dYd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZA(gt3,1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDL(gt1,j2)*ZA(gt3,1)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZA(gt3,1)*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYd(j1,j2))*ZA(gt3,1)*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdAh  
 
 
Subroutine CT_CouplingcFeFeAh(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,dYe,dZA,dZEL,dZER,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(3,3),dZA(3,3)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3),dYe(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dZA(gt3,1)*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dYe(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZA(gt3,1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZEL(gt1,j2)*ZA(gt3,1)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZA(gt3,1)*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYe(j1,j2))*ZA(gt3,1)*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeAh  
 
 
Subroutine CT_CouplingcFuFuAh(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,dYu,dZA,dZUL,dZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(3,3),dZA(3,3)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3),dYu(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dZA(gt3,2)*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZA(gt3,2)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUL(gt1,j2)*ZA(gt3,2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZA(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*ZA(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuAh  
 
 
Subroutine CT_CouplingFvFvAh(gt1,gt2,gt3,lamN,Yv,ZA,UV,dlamN,dYv,dZA,dUV,             & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(3,3),dZA(3,3)

Complex(dp), Intent(in) :: lamN(3,3),Yv(3,3),UV(9,9),dlamN(3,3),dYv(3,3),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dZA(gt3,2)*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dZA(gt3,2)*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dYv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dYv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,j2))*Conjg(UV(gt1,3 + j1))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,j2))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,j2))*Conjg(UV(gt2,3 + j1))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,j2))*Yv(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dlamN(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dlamN(j1,j2)*ZA(gt3,3))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dZA(gt3,3)*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dZA(gt3,3)*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,6 + j2))*Conjg(UV(gt1,3 + j1))*ZA(gt3,3)*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,6 + j2))*ZA(gt3,3)*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*ZA(gt3,3)*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*ZA(gt3,3)*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZA(gt3,2)*UV(gt1,j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dZA(gt3,3)*UV(gt1,6 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZA(gt3,2)*UV(gt1,3 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dZA(gt3,3)*UV(gt1,3 + j1)*UV(gt2,6 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,j2)*UV(gt1,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,3 + j1)*UV(gt2,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt2,6 + j2)*UV(gt1,3 + j1)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,6 + j2)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt1,6 + j2)*UV(gt2,3 + j1)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dlamN(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,6 + j2)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dlamN(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZA(gt3,3))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvAh  
 
 
Subroutine CT_CouplingChiChacHpm(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,dg1,               & 
& dg2,dlam,dZP,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,ZP(2,2),dg1,dg2,dZP(2,2)

Complex(dp), Intent(in) :: lam,ZN(5,5),UM(2,2),UP(2,2),dlam,dZN(5,5),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChacHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(UM(gt2,2))*Conjg(ZN(gt1,1))*dZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(UM(gt2,2))*Conjg(ZN(gt1,2))*dZP(gt3,1))/sqrt(2._dp)
resL = resL-(g2*Conjg(UM(gt2,1))*Conjg(ZN(gt1,3))*dZP(gt3,1))
resL = resL-(lam*Conjg(UM(gt2,2))*Conjg(ZN(gt1,5))*dZP(gt3,2))
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(UM(gt2,1))*ZP(gt3,1))
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(UM(gt2,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(UM(gt2,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g1*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,1))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(dg1*Conjg(UM(gt2,2))*Conjg(ZN(gt1,1))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(dg2*Conjg(UM(gt2,2))*Conjg(ZN(gt1,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL-(g2*Conjg(dUM(gt2,1))*Conjg(ZN(gt1,3))*ZP(gt3,1))
resL = resL-(dg2*Conjg(UM(gt2,1))*Conjg(ZN(gt1,3))*ZP(gt3,1))
resL = resL-(lam*Conjg(dZN(gt1,5))*Conjg(UM(gt2,2))*ZP(gt3,2))
resL = resL-(lam*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,5))*ZP(gt3,2))
resL = resL-(dlam*Conjg(UM(gt2,2))*Conjg(ZN(gt1,5))*ZP(gt3,2))
resR = 0._dp 
resR = resR-((g1*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,1))/sqrt(2._dp))
resR = resR-((g2*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,2))/sqrt(2._dp))
resR = resR-(g2*dZP(gt3,2)*UP(gt2,1)*ZN(gt1,4))
resR = resR-(Conjg(lam)*dZP(gt3,1)*UP(gt2,2)*ZN(gt1,5))
resR = resR-(Conjg(lam)*dZN(gt1,5)*UP(gt2,2)*ZP(gt3,1))
resR = resR-(Conjg(lam)*dUP(gt2,2)*ZN(gt1,5)*ZP(gt3,1))
resR = resR-(Conjg(dlam)*UP(gt2,2)*ZN(gt1,5)*ZP(gt3,1))
resR = resR-(g2*dZN(gt1,4)*UP(gt2,1)*ZP(gt3,2))
resR = resR-((g1*dZN(gt1,1)*UP(gt2,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dZN(gt1,2)*UP(gt2,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g1*dUP(gt2,2)*ZN(gt1,1)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((dg1*UP(gt2,2)*ZN(gt1,1)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dUP(gt2,2)*ZN(gt1,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((dg2*UP(gt2,2)*ZN(gt1,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-(g2*dUP(gt2,1)*ZN(gt1,4)*ZP(gt3,2))
resR = resR-(dg2*UP(gt2,1)*ZN(gt1,4)*ZP(gt3,2))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChacHpm  
 
 
Subroutine CT_CouplingChaFucSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,             & 
& dYd,dYu,dZD,dUM,dUP,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZD(6,6),UM(2,2),UP(2,2),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),          & 
& dZD(6,6),dUM(2,2),dUP(2,2),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChaFucSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UM(gt1,1))*Conjg(ZUL(gt2,j1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZUL(gt2,j1))*Conjg(UM(gt1,1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUM(gt1,1))*Conjg(ZUL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UM(gt1,1))*Conjg(ZUL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZUL(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZUL(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(UM(gt1,2))*Yd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt1,2))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZUR(gt2,j1)*UP(gt1,2)*ZD(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZD(gt3,j2)*UP(gt1,2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dUP(gt1,2)*ZD(gt3,j2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*UP(gt1,2)*ZD(gt3,j2)*ZUR(gt2,j1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChaFucSd  
 
 
Subroutine CT_CouplingFvChacSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,dg2,dYe,              & 
& dYv,dZE,dUV,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZE(6,6),UV(9,9),UM(2,2),UP(2,2),dYe(3,3),dYv(3,3),dZE(6,6),           & 
& dUV(9,9),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvChacSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UM(gt2,1))*Conjg(UV(gt1,j1))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt1,j1))*Conjg(UM(gt2,1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUM(gt2,1))*Conjg(UV(gt1,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UM(gt2,1))*Conjg(UV(gt1,j1))*ZE(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(UV(gt1,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(UV(gt1,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt1,j2))*Conjg(UM(gt2,2))*Ye(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt2,2))*Conjg(UV(gt1,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZE(gt3,j2)*UP(gt2,2)*UV(gt1,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dUV(gt1,3 + j1)*UP(gt2,2)*ZE(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dUP(gt2,2)*UV(gt1,3 + j1)*ZE(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYv(j1,j2))*UP(gt2,2)*UV(gt1,3 + j1)*ZE(gt3,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvChacSe  
 
 
Subroutine CT_CouplingcChaChahh(gt1,gt2,gt3,g2,lam,ZH,UM,UP,dg2,dlam,dZH,             & 
& dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,ZH(3,3),dg2,dZH(3,3)

Complex(dp), Intent(in) :: lam,UM(2,2),UP(2,2),dlam,dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChahh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((g2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*dZH(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*dZH(gt3,2))/sqrt(2._dp))
resL = resL-((lam*Conjg(UM(gt2,2))*Conjg(UP(gt1,2))*dZH(gt3,3))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(UM(gt2,2))*ZH(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,2))*Conjg(UP(gt1,1))*ZH(gt3,1))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*ZH(gt3,1))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(UM(gt2,1))*ZH(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,1))*Conjg(UP(gt1,2))*ZH(gt3,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*ZH(gt3,2))/sqrt(2._dp))
resL = resL-((lam*Conjg(dUP(gt1,2))*Conjg(UM(gt2,2))*ZH(gt3,3))/sqrt(2._dp))
resL = resL-((lam*Conjg(dUM(gt2,2))*Conjg(UP(gt1,2))*ZH(gt3,3))/sqrt(2._dp))
resL = resL-((dlam*Conjg(UM(gt2,2))*Conjg(UP(gt1,2))*ZH(gt3,3))/sqrt(2._dp))
resR = 0._dp 
resR = resR-((g2*dZH(gt3,1)*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp))
resR = resR-((g2*dZH(gt3,2)*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((Conjg(lam)*dZH(gt3,3)*UM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((g2*dUP(gt2,1)*UM(gt1,2)*ZH(gt3,1))/sqrt(2._dp))
resR = resR-((g2*dUM(gt1,2)*UP(gt2,1)*ZH(gt3,1))/sqrt(2._dp))
resR = resR-((dg2*UM(gt1,2)*UP(gt2,1)*ZH(gt3,1))/sqrt(2._dp))
resR = resR-((g2*dUP(gt2,2)*UM(gt1,1)*ZH(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dUM(gt1,1)*UP(gt2,2)*ZH(gt3,2))/sqrt(2._dp))
resR = resR-((dg2*UM(gt1,1)*UP(gt2,2)*ZH(gt3,2))/sqrt(2._dp))
resR = resR-((Conjg(lam)*dUP(gt2,2)*UM(gt1,2)*ZH(gt3,3))/sqrt(2._dp))
resR = resR-((Conjg(lam)*dUM(gt1,2)*UP(gt2,2)*ZH(gt3,3))/sqrt(2._dp))
resR = resR-((Conjg(dlam)*UM(gt1,2)*UP(gt2,2)*ZH(gt3,3))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChahh  
 
 
Subroutine CT_CouplingcFdChaSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,             & 
& dYd,dYu,dZU,dUM,dUP,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZU(6,6),UM(2,2),UP(2,2),ZDL(3,3),ZDR(3,3),dYd(3,3),dYu(3,3),          & 
& dZU(6,6),dUM(2,2),dUP(2,2),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdChaSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(ZDR(gt1,j1))*Conjg(ZU(gt3,j2))*dYd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZU(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZU(gt3,j2))*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt2,2))*Conjg(ZDR(gt1,j1))*Conjg(ZU(gt3,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZU(gt3,j1))*dZDL(gt1,j1)*UP(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZU(gt3,j1))*dUP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZU(gt3,j1))*UP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZU(gt3,j1))*UP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZDL(gt1,j2)*UP(gt2,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dUP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZU(gt3,3 + j1))*Conjg(Yu(j1,j2))*UP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*Conjg(ZU(gt3,3 + j1))*UP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdChaSu  
 
 
Subroutine CT_CouplingcFeChaSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVI,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVI(9,9),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVI(9,9),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChaSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVI(gt3,j2))*dYe(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVI(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZVI(gt3,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVI(gt3,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dZEL(gt1,j1)*UP(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dUP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZVI(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZVI(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dZEL(gt1,j2)*UP(gt2,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dUP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChaSvIm  
 
 
Subroutine CT_CouplingcFeChaSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVR,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVR(9,9),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVR(9,9),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChaSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVR(gt3,j2))*dYe(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVR(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZVR(gt3,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZVR(gt3,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZVR(gt3,j1))*dZEL(gt1,j1)*UP(gt2,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZVR(gt3,j1))*dUP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(dZVR(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((dg2*Conjg(ZVR(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dZEL(gt1,j2)*UP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dUP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*UP(gt2,2)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChaSvRe  
 
 
Subroutine CT_CouplingChiChihh(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,dg1,dg2,               & 
& dlam,dkap,dZH,dZN,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,ZH(3,3),dg1,dg2,dZH(3,3)

Complex(dp), Intent(in) :: lam,kap,ZN(5,5),dlam,dkap,dZN(5,5)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChihh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*dZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*dZH(gt3,1))/2._dp
resL = resL+(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*dZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*dZH(gt3,1))/2._dp
resL = resL+(lam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*dZH(gt3,1))/sqrt(2._dp)
resL = resL+(lam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*dZH(gt3,1))/sqrt(2._dp)
resL = resL-(g1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*dZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*dZH(gt3,2))/2._dp
resL = resL+(lam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*dZH(gt3,2))/sqrt(2._dp)
resL = resL-(g1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*dZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*dZH(gt3,2))/2._dp
resL = resL+(lam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*dZH(gt3,2))/sqrt(2._dp)
resL = resL+(lam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3))*dZH(gt3,3))/sqrt(2._dp)
resL = resL+(lam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4))*dZH(gt3,3))/sqrt(2._dp)
resL = resL-(sqrt(2._dp)*kap*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,5))*dZH(gt3,3))
resL = resL+(g1*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,1))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,2))*ZH(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,3))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,3))*ZH(gt3,1))/2._dp
resL = resL+(lam*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,4))*ZH(gt3,1))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,5))*ZH(gt3,1))/sqrt(2._dp)
resL = resL+(g1*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,1))*ZH(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,1))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,2))*ZH(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,2))*ZH(gt3,1))/2._dp
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL+(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL-(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,3))*ZH(gt3,1))/2._dp
resL = resL+(lam*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,4))*ZH(gt3,1))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4))*ZH(gt3,1))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,5))*ZH(gt3,1))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5))*ZH(gt3,1))/sqrt(2._dp)
resL = resL-(g1*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,1))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,2))*ZH(gt3,2))/2._dp
resL = resL+(lam*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,3))*ZH(gt3,2))/sqrt(2._dp)
resL = resL-(g1*Conjg(dZN(gt2,1))*Conjg(ZN(gt1,4))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,2))*Conjg(ZN(gt1,4))*ZH(gt3,2))/2._dp
resL = resL+(lam*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,5))*ZH(gt3,2))/sqrt(2._dp)
resL = resL-(g1*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,1))*ZH(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,2))*ZH(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2))*ZH(gt3,2))/2._dp
resL = resL+(lam*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,3))*ZH(gt3,2))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3))*ZH(gt3,2))/sqrt(2._dp)
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL-(dg1*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL+(dg2*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4))*ZH(gt3,2))/2._dp
resL = resL+(lam*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,5))*ZH(gt3,2))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5))*ZH(gt3,2))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt2,4))*Conjg(ZN(gt1,3))*ZH(gt3,3))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt2,3))*Conjg(ZN(gt1,4))*ZH(gt3,3))/sqrt(2._dp)
resL = resL-(sqrt(2._dp)*kap*Conjg(dZN(gt2,5))*Conjg(ZN(gt1,5))*ZH(gt3,3))
resL = resL+(lam*Conjg(dZN(gt1,4))*Conjg(ZN(gt2,3))*ZH(gt3,3))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3))*ZH(gt3,3))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt1,3))*Conjg(ZN(gt2,4))*ZH(gt3,3))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4))*ZH(gt3,3))/sqrt(2._dp)
resL = resL-(sqrt(2._dp)*kap*Conjg(dZN(gt1,5))*Conjg(ZN(gt2,5))*ZH(gt3,3))
resL = resL-(sqrt(2._dp)*dkap*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,5))*ZH(gt3,3))
resR = 0._dp 
resR = resR+(g1*dZN(gt2,3)*ZH(gt3,1)*ZN(gt1,1))/2._dp
resR = resR-(g1*dZN(gt2,4)*ZH(gt3,2)*ZN(gt1,1))/2._dp
resR = resR-(g2*dZN(gt2,3)*ZH(gt3,1)*ZN(gt1,2))/2._dp
resR = resR+(g2*dZN(gt2,4)*ZH(gt3,2)*ZN(gt1,2))/2._dp
resR = resR+(g1*dZN(gt2,1)*ZH(gt3,1)*ZN(gt1,3))/2._dp
resR = resR-(g2*dZN(gt2,2)*ZH(gt3,1)*ZN(gt1,3))/2._dp
resR = resR+(Conjg(lam)*dZN(gt2,5)*ZH(gt3,2)*ZN(gt1,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,4)*ZH(gt3,3)*ZN(gt1,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,5)*ZH(gt3,1)*ZN(gt1,4))/sqrt(2._dp)
resR = resR-(g1*dZN(gt2,1)*ZH(gt3,2)*ZN(gt1,4))/2._dp
resR = resR+(g2*dZN(gt2,2)*ZH(gt3,2)*ZN(gt1,4))/2._dp
resR = resR+(Conjg(lam)*dZN(gt2,3)*ZH(gt3,3)*ZN(gt1,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,4)*ZH(gt3,1)*ZN(gt1,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt2,3)*ZH(gt3,2)*ZN(gt1,5))/sqrt(2._dp)
resR = resR-(sqrt(2._dp)*Conjg(kap)*dZN(gt2,5)*ZH(gt3,3)*ZN(gt1,5))
resR = resR+(g1*dZN(gt1,3)*ZH(gt3,1)*ZN(gt2,1))/2._dp
resR = resR-(g1*dZN(gt1,4)*ZH(gt3,2)*ZN(gt2,1))/2._dp
resR = resR+(g1*dZH(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR+(dg1*ZH(gt3,1)*ZN(gt1,3)*ZN(gt2,1))/2._dp
resR = resR-(g1*dZH(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR-(dg1*ZH(gt3,2)*ZN(gt1,4)*ZN(gt2,1))/2._dp
resR = resR-(g2*dZN(gt1,3)*ZH(gt3,1)*ZN(gt2,2))/2._dp
resR = resR+(g2*dZN(gt1,4)*ZH(gt3,2)*ZN(gt2,2))/2._dp
resR = resR-(g2*dZH(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR-(dg2*ZH(gt3,1)*ZN(gt1,3)*ZN(gt2,2))/2._dp
resR = resR+(g2*dZH(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR+(dg2*ZH(gt3,2)*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR+(g1*dZN(gt1,1)*ZH(gt3,1)*ZN(gt2,3))/2._dp
resR = resR-(g2*dZN(gt1,2)*ZH(gt3,1)*ZN(gt2,3))/2._dp
resR = resR+(Conjg(lam)*dZN(gt1,5)*ZH(gt3,2)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,4)*ZH(gt3,3)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(g1*dZH(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR+(dg1*ZH(gt3,1)*ZN(gt1,1)*ZN(gt2,3))/2._dp
resR = resR-(g2*dZH(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR-(dg2*ZH(gt3,1)*ZN(gt1,2)*ZN(gt2,3))/2._dp
resR = resR+(Conjg(lam)*dZH(gt3,3)*ZN(gt1,4)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZH(gt3,3)*ZN(gt1,4)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZH(gt3,2)*ZN(gt1,5)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZH(gt3,2)*ZN(gt1,5)*ZN(gt2,3))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,5)*ZH(gt3,1)*ZN(gt2,4))/sqrt(2._dp)
resR = resR-(g1*dZN(gt1,1)*ZH(gt3,2)*ZN(gt2,4))/2._dp
resR = resR+(g2*dZN(gt1,2)*ZH(gt3,2)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*dZN(gt1,3)*ZH(gt3,3)*ZN(gt2,4))/sqrt(2._dp)
resR = resR-(g1*dZH(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR-(dg1*ZH(gt3,2)*ZN(gt1,1)*ZN(gt2,4))/2._dp
resR = resR+(g2*dZH(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(dg2*ZH(gt3,2)*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*dZH(gt3,3)*ZN(gt1,3)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZH(gt3,3)*ZN(gt1,3)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZH(gt3,1)*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZH(gt3,1)*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,4)*ZH(gt3,1)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZN(gt1,3)*ZH(gt3,2)*ZN(gt2,5))/sqrt(2._dp)
resR = resR-(sqrt(2._dp)*Conjg(kap)*dZN(gt1,5)*ZH(gt3,3)*ZN(gt2,5))
resR = resR+(Conjg(lam)*dZH(gt3,2)*ZN(gt1,3)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZH(gt3,2)*ZN(gt1,3)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*dZH(gt3,1)*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*ZH(gt3,1)*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR-(sqrt(2._dp)*Conjg(kap)*dZH(gt3,3)*ZN(gt1,5)*ZN(gt2,5))
resR = resR-(sqrt(2._dp)*Conjg(dkap)*ZH(gt3,3)*ZN(gt1,5)*ZN(gt2,5))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChihh  
 
 
Subroutine CT_CouplingChiFdcSd(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,dg1,dg2,            & 
& dYd,dZD,dZN,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: Yd(3,3),ZD(6,6),ZN(5,5),ZDL(3,3),ZDR(3,3),dYd(3,3),dZD(6,6),dZN(5,5),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*dZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,2))*dZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,2))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,2))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZN(gt1,3))*dZD(gt3,3 + j1)*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZN(gt1,3))*dYd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,3))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZDL(gt2,j2))*Conjg(ZN(gt1,3))*Yd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZN(gt1,1)*ZD(gt3,3 + j1)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZDR(gt2,j1)*ZD(gt3,3 + j1)*ZN(gt1,1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg1*ZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZN(gt1,3)*ZD(gt3,j2)*ZDR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZD(gt3,j2)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZD(gt3,j2)*ZDR(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYd(j1,j2))*ZD(gt3,j2)*ZDR(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFdcSd  
 
 
Subroutine CT_CouplingChiFecSe(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,dg1,dg2,            & 
& dYe,dZE,dZN,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: Ye(3,3),ZE(6,6),ZN(5,5),ZEL(3,3),ZER(3,3),dYe(3,3),dZE(6,6),dZN(5,5),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,2))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZN(gt1,2))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,2))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,2))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(ZN(gt1,3))*dZE(gt3,3 + j1)*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(ZN(gt1,3))*dYe(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,3))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZEL(gt2,j2))*Conjg(ZN(gt1,3))*Ye(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZN(gt1,1)*ZE(gt3,3 + j1)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZER(gt2,j1)*ZE(gt3,3 + j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg1*ZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZN(gt1,3)*ZE(gt3,j2)*ZER(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZE(gt3,j2)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZE(gt3,j2)*ZER(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYe(j1,j2))*ZE(gt3,j2)*ZER(gt2,j1)*ZN(gt1,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFecSe  
 
 
Subroutine CT_CouplingChiFucSu(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,dg1,dg2,            & 
& dYu,dZU,dZN,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: Yu(3,3),ZU(6,6),ZN(5,5),ZUL(3,3),ZUR(3,3),dYu(3,3),dZU(6,6),dZN(5,5),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZN(gt1,2))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,2))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZN(gt1,2))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZN(gt1,2))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,4))*Conjg(ZUL(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,4))*Conjg(ZUL(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZUL(gt2,j2))*Conjg(ZN(gt1,4))*Yu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,4))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZUR(gt2,j1)*ZN(gt1,1)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZU(gt3,3 + j1)*ZN(gt1,1)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*dg1*ZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZN(gt1,4)*ZU(gt3,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZU(gt3,j2)*ZN(gt1,4)*ZUR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZN(gt1,4)*ZU(gt3,j2)*ZUR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYu(j1,j2))*ZN(gt1,4)*ZU(gt3,j2)*ZUR(gt2,j1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFucSu  
 
 
Subroutine CT_CouplingChiFvSvIm(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,dg1,              & 
& dg2,dlamN,dYv,dZVI,dZN,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: lamN(3,3),Yv(3,3),ZVI(9,9),ZN(5,5),UV(9,9),dlamN(3,3),dYv(3,3),dZVI(9,9),             & 
& dZN(5,5),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFvSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZVI(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZVI(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(UV(gt2,j1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(UV(gt2,j1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVI(gt3,j1)))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,6 + j2))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,3 + j1))*dlamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,6 + j2))*dlamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,j2))*dYv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVI(gt3,j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVI(gt3,3 + j1))*Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,4))*Conjg(UV(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZN(gt1,4))*Conjg(UV(gt2,3 + j1))*Conjg(ZVI(gt3,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVI(gt3,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVI(gt3,6 + j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5))*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVI(gt3,3 + j1))*Conjg(UV(gt2,6 + j2))*Conjg(ZN(gt1,5))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,5))*Conjg(UV(gt2,6 + j2))*Conjg(ZVI(gt3,3 + j1))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,6 + j2))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,3 + j1))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZN(gt1,5))*Conjg(UV(gt2,3 + j1))*Conjg(ZVI(gt3,6 + j2))*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVI(gt3,6 + j2))*lamN(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZVI(gt3,j1))*dZN(gt1,1)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dZN(gt1,2)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZVI(gt3,j1))*dUV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZVI(gt3,j1))*dUV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZVI(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*dZN(gt1,4)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j1,j2))*dZN(gt1,5)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dZN(gt1,4)*UV(gt2,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(ZVI(gt3,3 + j1))*Conjg(lamN(j1,j2))*dZN(gt1,5)*UV(gt2,6 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,j2))*dUV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*dUV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVI(gt3,j2))*Conjg(Yv(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVI(gt3,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVI(gt3,3 + j1))*Conjg(Yv(j1,j2))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYv(j1,j2))*Conjg(ZVI(gt3,3 + j1))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(ZVI(gt3,6 + j2))*Conjg(lamN(j1,j2))*dUV(gt2,3 + j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(ZVI(gt3,3 + j1))*Conjg(lamN(j1,j2))*dUV(gt2,6 + j2)*ZN(gt1,5))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dlamN(j1,j2))*Conjg(ZVI(gt3,6 + j2))*UV(gt2,3 + j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVI(gt3,6 + j2))*Conjg(lamN(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dlamN(j1,j2))*Conjg(ZVI(gt3,3 + j1))*UV(gt2,6 + j2)*ZN(gt1,5))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVI(gt3,3 + j1))*Conjg(lamN(j1,j2))*UV(gt2,6 + j2)*ZN(gt1,5))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFvSvIm  
 
 
Subroutine CT_CouplingChiFvSvRe(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,dg1,              & 
& dg2,dlamN,dYv,dZVR,dZN,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: lamN(3,3),Yv(3,3),ZVR(9,9),ZN(5,5),UV(9,9),dlamN(3,3),dYv(3,3),dZVR(9,9),             & 
& dZN(5,5),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFvSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZVR(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZVR(gt3,j1))*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,1))*Conjg(UV(gt2,j1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZN(gt1,2))*Conjg(UV(gt2,j1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,1))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UV(gt2,j1))*Conjg(ZN(gt1,2))*Conjg(ZVR(gt3,j1)))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,6 + j2))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,3 + j1))*dlamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,6 + j2))*dlamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,j2))*dYv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,3 + j1))*Conjg(UV(gt2,j2))*Conjg(ZN(gt1,4))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,4))*Conjg(UV(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,j2))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,4))*Conjg(UV(gt2,3 + j1))*Conjg(ZVR(gt3,j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,4))*Conjg(ZVR(gt3,j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,6 + j2))*Conjg(UV(gt2,3 + j1))*Conjg(ZN(gt1,5))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt3,3 + j1))*Conjg(UV(gt2,6 + j2))*Conjg(ZN(gt1,5))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,5))*Conjg(UV(gt2,6 + j2))*Conjg(ZVR(gt3,3 + j1))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,6 + j2))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,3 + j1))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZN(gt1,5))*Conjg(UV(gt2,3 + j1))*Conjg(ZVR(gt3,6 + j2))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(ZN(gt1,5))*Conjg(ZVR(gt3,6 + j2))*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZVR(gt3,j1))*dZN(gt1,1)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZVR(gt3,j1))*dZN(gt1,2)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZVR(gt3,j1))*dUV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZVR(gt3,j1))*dUV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZVR(gt3,j1))*UV(gt2,j1)*ZN(gt1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*dZN(gt1,4)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j2))*dZN(gt1,5)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dZN(gt1,4)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(ZVR(gt3,3 + j1))*Conjg(lamN(j1,j2))*dZN(gt1,5)*UV(gt2,6 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,j2))*dUV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*dUV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,j2))*Conjg(Yv(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVR(gt3,j2))*UV(gt2,3 + j1)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,3 + j1))*Conjg(Yv(j1,j2))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZVR(gt3,3 + j1))*UV(gt2,j2)*ZN(gt1,4))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(ZVR(gt3,6 + j2))*Conjg(lamN(j1,j2))*dUV(gt2,3 + j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(ZVR(gt3,3 + j1))*Conjg(lamN(j1,j2))*dUV(gt2,6 + j2)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dlamN(j1,j2))*Conjg(ZVR(gt3,6 + j2))*UV(gt2,3 + j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,6 + j2))*Conjg(lamN(j1,j2))*UV(gt2,3 + j1)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dlamN(j1,j2))*Conjg(ZVR(gt3,3 + j1))*UV(gt2,6 + j2)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZVR(gt3,3 + j1))*Conjg(lamN(j1,j2))*UV(gt2,6 + j2)*ZN(gt1,5))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFvSvRe  
 
 
Subroutine CT_CouplingcChaChiHpm(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,dg1,               & 
& dg2,dlam,dZP,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,ZP(2,2),dg1,dg2,dZP(2,2)

Complex(dp), Intent(in) :: lam,ZN(5,5),UM(2,2),UP(2,2),dlam,dZN(5,5),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChiHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(lam*Conjg(UP(gt1,2))*Conjg(ZN(gt2,5))*dZP(gt3,1))
resL = resL-((g1*Conjg(UP(gt1,2))*Conjg(ZN(gt2,1))*dZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(UP(gt1,2))*Conjg(ZN(gt2,2))*dZP(gt3,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(UP(gt1,1))*Conjg(ZN(gt2,4))*dZP(gt3,2))
resL = resL-(lam*Conjg(dZN(gt2,5))*Conjg(UP(gt1,2))*ZP(gt3,1))
resL = resL-(lam*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,5))*ZP(gt3,1))
resL = resL-(dlam*Conjg(UP(gt1,2))*Conjg(ZN(gt2,5))*ZP(gt3,1))
resL = resL-(g2*Conjg(dZN(gt2,4))*Conjg(UP(gt1,1))*ZP(gt3,2))
resL = resL-((g1*Conjg(dZN(gt2,1))*Conjg(UP(gt1,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dZN(gt2,2))*Conjg(UP(gt1,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g1*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,1))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((dg1*Conjg(UP(gt1,2))*Conjg(ZN(gt2,1))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UP(gt1,2))*Conjg(ZN(gt2,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(dUP(gt1,1))*Conjg(ZN(gt2,4))*ZP(gt3,2))
resL = resL-(dg2*Conjg(UP(gt1,1))*Conjg(ZN(gt2,4))*ZP(gt3,2))
resR = 0._dp 
resR = resR+(g1*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,1))/sqrt(2._dp)
resR = resR+(g2*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,2))/sqrt(2._dp)
resR = resR-(g2*dZP(gt3,1)*UM(gt1,1)*ZN(gt2,3))
resR = resR-(Conjg(lam)*dZP(gt3,2)*UM(gt1,2)*ZN(gt2,5))
resR = resR-(g2*dZN(gt2,3)*UM(gt1,1)*ZP(gt3,1))
resR = resR+(g1*dZN(gt2,1)*UM(gt1,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dZN(gt2,2)*UM(gt1,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g1*dUM(gt1,2)*ZN(gt2,1)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(dg1*UM(gt1,2)*ZN(gt2,1)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dUM(gt1,2)*ZN(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(dg2*UM(gt1,2)*ZN(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR-(g2*dUM(gt1,1)*ZN(gt2,3)*ZP(gt3,1))
resR = resR-(dg2*UM(gt1,1)*ZN(gt2,3)*ZP(gt3,1))
resR = resR-(Conjg(lam)*dZN(gt2,5)*UM(gt1,2)*ZP(gt3,2))
resR = resR-(Conjg(lam)*dUM(gt1,2)*ZN(gt2,5)*ZP(gt3,2))
resR = resR-(Conjg(dlam)*UM(gt1,2)*ZN(gt2,5)*ZP(gt3,2))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChiHpm  
 
 
Subroutine CT_CouplingcFdChiSd(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,dg1,dg2,            & 
& dYd,dZD,dZN,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: Yd(3,3),ZD(6,6),ZN(5,5),ZDL(3,3),ZDR(3,3),dYd(3,3),dZD(6,6),dZN(5,5),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdChiSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZN(gt2,1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZN(gt2,1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg1*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,3))*dYd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,3))*Conjg(ZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,j2))*Conjg(ZN(gt2,3))*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,3))*Yd(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZD(gt3,j1))*dZN(gt2,1)*ZDL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZD(gt3,j1))*dZN(gt2,2)*ZDL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZN(gt2,3)*ZDL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZDL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZD(gt3,3 + j1))*Conjg(Yd(j1,j2))*ZDL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYd(j1,j2))*Conjg(ZD(gt3,3 + j1))*ZDL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdChiSd  
 
 
Subroutine CT_CouplingcFeChiSe(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,dg1,dg2,            & 
& dYe,dZE,dZN,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: Ye(3,3),ZE(6,6),ZN(5,5),ZEL(3,3),ZER(3,3),dYe(3,3),dZE(6,6),dZN(5,5),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChiSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZN(gt2,1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg1*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZE(gt3,j2))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,3))*dYe(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,3))*Conjg(ZE(gt3,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,j2))*Conjg(ZN(gt2,3))*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZE(gt3,j2))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,3))*Ye(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZE(gt3,j1))*dZN(gt2,1)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZE(gt3,j1))*dZN(gt2,2)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dZN(gt2,3)*ZEL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dZEL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZE(gt3,3 + j1))*Conjg(Ye(j1,j2))*ZEL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYe(j1,j2))*Conjg(ZE(gt3,3 + j1))*ZEL(gt1,j2)*ZN(gt2,3))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChiSe  
 
 
Subroutine CT_CouplingcFuChiSu(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,dg1,dg2,            & 
& dYu,dZU,dZN,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,dg1,dg2

Complex(dp), Intent(in) :: Yu(3,3),ZU(6,6),ZN(5,5),ZUL(3,3),ZUR(3,3),dYu(3,3),dZU(6,6),dZN(5,5),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuChiSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZU(gt3,3 + j1))*Conjg(ZN(gt2,1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*dg1*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt2,4))*Conjg(ZU(gt3,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,4))*Conjg(ZU(gt3,j2))*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZU(gt3,j2))*Conjg(ZN(gt2,4))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,4))*Conjg(ZU(gt3,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZU(gt3,j1))*dZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZU(gt3,j1))*dZN(gt2,2)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(dZU(gt3,j1))*ZN(gt2,2)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((dg2*Conjg(ZU(gt3,j1))*ZN(gt2,2)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZUL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZN(gt2,4)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZU(gt3,3 + j1))*Conjg(Yu(j1,j2))*ZN(gt2,4)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYu(j1,j2))*Conjg(ZU(gt3,3 + j1))*ZN(gt2,4)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuChiSu  
 
 
Subroutine CT_CouplingGluFdcSd(gt2,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,             & 
& dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZD(6,6),ZDL(3,3),ZDR(3,3),dpG,dZD(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluFdcSd' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(ZDL(gt2,j1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(dZDL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dpG*g3*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg3*pG*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZDR(gt2,j1)*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(dpG)*ZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*dg3*Conjg(pG)*ZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluFdcSd  
 
 
Subroutine CT_CouplingcFdFdhh(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,dYd,dZH,dZDL,dZDR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(3,3),dZH(3,3)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dZH(gt3,1)*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dYd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZH(gt3,1)*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYd(j1,j2))*ZDL(gt1,j2)*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdhh  
 
 
Subroutine CT_CouplingcChaFdcSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,            & 
& dYd,dYu,dZU,dUM,dUP,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZU(6,6),UM(2,2),UP(2,2),ZDL(3,3),ZDR(3,3),dYd(3,3),dYu(3,3),          & 
& dZU(6,6),dUM(2,2),dUP(2,2),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFdcSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UP(gt1,1))*Conjg(ZDL(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZDL(gt2,j1))*Conjg(UP(gt1,1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUP(gt1,1))*Conjg(ZDL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UP(gt1,1))*Conjg(ZDL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZDL(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZDL(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(UP(gt1,2))*Yu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZU(gt3,j2)*UM(gt1,2)*ZDR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZDR(gt2,j1)*UM(gt1,2)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dUM(gt1,2)*ZDR(gt2,j1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*UM(gt1,2)*ZDR(gt2,j1)*ZU(gt3,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFdcSu  
 
 
Subroutine CT_CouplingcFuFdcHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,             & 
& dYu,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),dZDL(3,3),      & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*dZP(gt3,2)*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZUL(gt1,j2)*ZDR(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZP(gt3,1)*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZP(gt3,1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*ZDR(gt2,j1)*ZP(gt3,1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdcHpm  
 
 
Subroutine CT_CouplingFvFecHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,               & 
& dZP,dUV,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),UV(9,9),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),dUV(9,9),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFecHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dZP(gt3,2)*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dYv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZEL(gt2,j2))*Conjg(UV(gt1,3 + j1))*Yv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*Yv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZP(gt3,1)*UV(gt1,j2)*ZER(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZER(gt2,j1)*UV(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dUV(gt1,j2)*ZER(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*UV(gt1,j2)*ZER(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFecHpm  
 
 
Subroutine CT_CouplingcFeFehh(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,dYe,dZH,dZEL,dZER,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(3,3),dZH(3,3)

Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3),dYe(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dZH(gt3,1)*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dYe(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZH(gt3,1)*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZEL(gt1,j2)*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYe(j1,j2))*ZEL(gt1,j2)*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFehh  
 
 
Subroutine CT_CouplingcChaFeSvIm(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVI,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVI(9,9),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVI(9,9),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFeSvIm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZVI(gt3,j1))*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*Conjg(UP(gt1,1))*Conjg(ZVI(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVI(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVI(gt3,j1)))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVI(gt3,3 + j1))*Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(UP(gt1,2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVI(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVI(gt3,j2))*dZER(gt2,j1)*UM(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVI(gt3,j2))*dUM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVI(gt3,j2))*Conjg(Ye(j1,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYe(j1,j2))*Conjg(ZVI(gt3,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFeSvIm  
 
 
Subroutine CT_CouplingcChaFeSvRe(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,              & 
& dg2,dYe,dYv,dZVR,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVR(9,9),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),         & 
& dZVR(9,9),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFeSvRe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZVR(gt3,j1))*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*Conjg(UP(gt1,1))*Conjg(ZVR(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVR(gt3,j1)))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZVR(gt3,j1)))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*dYv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVR(gt3,3 + j1))*Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(UP(gt1,2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUP(gt1,2))*Conjg(ZEL(gt2,j2))*Conjg(ZVR(gt3,3 + j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVR(gt3,j2))*dZER(gt2,j1)*UM(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*Conjg(ZVR(gt3,j2))*dUM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dZVR(gt3,j2))*Conjg(Ye(j1,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYe(j1,j2))*Conjg(ZVR(gt3,j2))*UM(gt1,2)*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFeSvRe  
 
 
Subroutine CT_CouplingGluFucSu(gt2,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,             & 
& dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZU(6,6),ZUL(3,3),ZUR(3,3),dpG,dZU(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluFucSu' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(dZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dpG*g3*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg3*pG*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZUR(gt2,j1)*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(dpG)*ZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*dg3*Conjg(pG)*ZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluFucSu  
 
 
Subroutine CT_CouplingcFuFuhh(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,dYu,dZH,dZUL,dZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(3,3),dZH(3,3)

Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3),dYu(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dZH(gt3,2)*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZH(gt3,2)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUL(gt1,j2)*ZH(gt3,2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZH(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*ZH(gt3,2)*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuhh  
 
 
Subroutine CT_CouplingcFdFuHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,              & 
& dYu,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),dZDL(3,3),      & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFuHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dZP(gt3,1)*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dYd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZP(gt3,2)*ZDL(gt1,j2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZDL(gt1,j2)*ZP(gt3,2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*ZDL(gt1,j2)*ZP(gt3,2)*ZUR(gt2,j1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFuHpm  
 
 
Subroutine CT_CouplingFvFvhh(gt1,gt2,gt3,lamN,Yv,ZH,UV,dlamN,dYv,dZH,dUV,             & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(3,3),dZH(3,3)

Complex(dp), Intent(in) :: lamN(3,3),Yv(3,3),UV(9,9),dlamN(3,3),dYv(3,3),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dZH(gt3,2)*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dZH(gt3,2)*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,3 + j1))*dYv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,j2))*dYv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,j2))*Conjg(UV(gt1,3 + j1))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,j2))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,j2))*Conjg(UV(gt2,3 + j1))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,j2))*Yv(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dlamN(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dlamN(j1,j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dZH(gt3,3)*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dZH(gt3,3)*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,6 + j2))*Conjg(UV(gt1,3 + j1))*ZH(gt3,3)*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,6 + j2))*ZH(gt3,3)*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*ZH(gt3,3)*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*ZH(gt3,3)*lamN(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZH(gt3,2)*UV(gt1,j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dZH(gt3,3)*UV(gt1,6 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dZH(gt3,2)*UV(gt1,3 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dZH(gt3,3)*UV(gt1,3 + j1)*UV(gt2,6 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,j2)*UV(gt1,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*UV(gt1,3 + j1)*UV(gt2,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt2,6 + j2)*UV(gt1,3 + j1)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,6 + j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt1,6 + j2)*UV(gt2,3 + j1)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dlamN(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(lamN(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,6 + j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dlamN(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZH(gt3,3))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvhh  
 
 
Subroutine CT_CouplingcFeFvHpm(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,dYe,dYv,               & 
& dZP,dUV,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),UV(9,9),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),dUV(9,9),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt2,j2))*Conjg(ZER(gt1,j1))*dZP(gt3,1)*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt2,j2))*Conjg(ZER(gt1,j1))*dYe(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZP(gt3,1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZP(gt3,2)*UV(gt2,3 + j1)*ZEL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZEL(gt1,j2)*UV(gt2,3 + j1)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dUV(gt2,3 + j1)*ZEL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYv(j1,j2))*UV(gt2,3 + j1)*ZEL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvHpm  
 
 
Subroutine CT_CouplingcChaFvSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,dg2,dYe,              & 
& dYv,dZE,dUV,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZE(6,6),UV(9,9),UM(2,2),UP(2,2),dYe(3,3),dYv(3,3),dZE(6,6),           & 
& dUV(9,9),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFvSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(UV(gt2,3 + j1))*Conjg(ZE(gt3,j2))*dYv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZE(gt3,j2))*Conjg(UP(gt1,2))*Conjg(UV(gt2,3 + j1))*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt2,3 + j1))*Conjg(UP(gt1,2))*Conjg(ZE(gt3,j2))*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(UV(gt2,3 + j1))*Conjg(ZE(gt3,j2))*Yv(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZE(gt3,j1))*dUV(gt2,j1)*UM(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZE(gt3,j1))*dUM(gt1,1)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZE(gt3,j1))*UM(gt1,1)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZE(gt3,j1))*UM(gt1,1)*UV(gt2,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dUV(gt2,j2)*UM(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dUM(gt1,2)*UV(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZE(gt3,3 + j1))*Conjg(Ye(j1,j2))*UM(gt1,2)*UV(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*Conjg(ZE(gt3,3 + j1))*UM(gt1,2)*UV(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFvSe  
 
 
Subroutine CT_CouplingcFdGluSd(gt1,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,             & 
& dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZD(6,6),ZDL(3,3),ZDR(3,3),dpG,dZD(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdGluSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dpG*g3*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dg3*pG*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(ZD(gt3,j1))*dZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(dZD(gt3,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(dpG)*Conjg(ZD(gt3,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg3*Conjg(pG)*Conjg(ZD(gt3,j1))*ZDL(gt1,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdGluSd  
 
 
Subroutine CT_CouplingcFuGluSu(gt1,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,             & 
& dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZU(6,6),ZUL(3,3),ZUR(3,3),dpG,dZU(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuGluSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZUR(gt1,j1))*Conjg(ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dpG*g3*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dg3*pG*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(ZU(gt3,j1))*dZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(dZU(gt3,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(dpG)*Conjg(ZU(gt3,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg3*Conjg(pG)*Conjg(ZU(gt3,j1))*ZUL(gt1,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuGluSu  
 
 
Subroutine CT_CouplingcChacFuSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,            & 
& dYd,dYu,dZD,dUM,dUP,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZD(6,6),UM(2,2),UP(2,2),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),          & 
& dZD(6,6),dUM(2,2),dUP(2,2),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChacFuSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZD(gt3,j2))*Conjg(ZUR(gt2,j1))*dYu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt2,j1))*Conjg(UP(gt1,2))*Conjg(ZD(gt3,j2))*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZD(gt3,j2))*Conjg(UP(gt1,2))*Conjg(ZUR(gt2,j1))*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZD(gt3,j2))*Conjg(ZUR(gt2,j1))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZD(gt3,j1))*dZUL(gt2,j1)*UM(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZD(gt3,j1))*dUM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZD(gt3,j1))*UM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZD(gt3,j1))*UM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZUL(gt2,j2)*UM(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dUM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZD(gt3,3 + j1))*Conjg(Yd(j1,j2))*UM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*Conjg(ZD(gt3,3 + j1))*UM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChacFuSd  
 
 
Subroutine CT_CouplingChiChacVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZN(5,5),UM(2,2),UP(2,2),dZN(5,5),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChacVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(UM(gt2,1))*dZN(gt1,2))
resL = resL-((g2*Conjg(UM(gt2,2))*dZN(gt1,3))/sqrt(2._dp))
resL = resL-(g2*Conjg(dUM(gt2,1))*ZN(gt1,2))
resL = resL-(dg2*Conjg(UM(gt2,1))*ZN(gt1,2))
resL = resL-((g2*Conjg(dUM(gt2,2))*ZN(gt1,3))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*ZN(gt1,3))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(g2*Conjg(ZN(gt1,2))*dUP(gt2,1))
resR = resR+(g2*Conjg(ZN(gt1,4))*dUP(gt2,2))/sqrt(2._dp)
resR = resR-(g2*Conjg(dZN(gt1,2))*UP(gt2,1))
resR = resR-(dg2*Conjg(ZN(gt1,2))*UP(gt2,1))
resR = resR+(g2*Conjg(dZN(gt1,4))*UP(gt2,2))/sqrt(2._dp)
resR = resR+(dg2*Conjg(ZN(gt1,4))*UP(gt2,2))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChacVWm  
 
 
Subroutine CT_CouplingcChaChaVP(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,               & 
& dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(UM(gt2,2))*Cos(TW)*dUM(gt1,2))/2._dp
resL = resL+g2*Conjg(UM(gt2,1))*dUM(gt1,1)*Sin(TW)
resL = resL+(g2*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TW))/2._dp
resL = resL+dSinTW*g2*Conjg(UM(gt2,1))*UM(gt1,1)
resL = resL+g2*Conjg(dUM(gt2,1))*Sin(TW)*UM(gt1,1)
resL = resL+dg2*Conjg(UM(gt2,1))*Sin(TW)*UM(gt1,1)
resL = resL+(dCosTW*g1*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(dSinTW*g2*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(g1*Conjg(dUM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(dg1*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(g2*Conjg(dUM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL+(dg2*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resR = 0._dp 
resR = resR+(g1*Conjg(UP(gt1,2))*Cos(TW)*dUP(gt2,2))/2._dp
resR = resR+g2*Conjg(UP(gt1,1))*dUP(gt2,1)*Sin(TW)
resR = resR+(g2*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TW))/2._dp
resR = resR+dSinTW*g2*Conjg(UP(gt1,1))*UP(gt2,1)
resR = resR+g2*Conjg(dUP(gt1,1))*Sin(TW)*UP(gt2,1)
resR = resR+dg2*Conjg(UP(gt1,1))*Sin(TW)*UP(gt2,1)
resR = resR+(dCosTW*g1*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(dSinTW*g2*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(g1*Conjg(dUP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(dg1*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(g2*Conjg(dUP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR+(dg2*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVP  
 
 
Subroutine CT_CouplingcChaChaVZ(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,               & 
& dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+g2*Conjg(UM(gt2,1))*Cos(TW)*dUM(gt1,1)
resL = resL+(g2*Conjg(UM(gt2,2))*Cos(TW)*dUM(gt1,2))/2._dp
resL = resL-(g1*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TW))/2._dp
resL = resL+dCosTW*g2*Conjg(UM(gt2,1))*UM(gt1,1)
resL = resL+g2*Conjg(dUM(gt2,1))*Cos(TW)*UM(gt1,1)
resL = resL+dg2*Conjg(UM(gt2,1))*Cos(TW)*UM(gt1,1)
resL = resL-(dSinTW*g1*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(dCosTW*g2*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(g2*Conjg(dUM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(dg2*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL-(g1*Conjg(dUM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL-(dg1*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resR = 0._dp 
resR = resR+g2*Conjg(UP(gt1,1))*Cos(TW)*dUP(gt2,1)
resR = resR+(g2*Conjg(UP(gt1,2))*Cos(TW)*dUP(gt2,2))/2._dp
resR = resR-(g1*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TW))/2._dp
resR = resR+dCosTW*g2*Conjg(UP(gt1,1))*UP(gt2,1)
resR = resR+g2*Conjg(dUP(gt1,1))*Cos(TW)*UP(gt2,1)
resR = resR+dg2*Conjg(UP(gt1,1))*Cos(TW)*UP(gt2,1)
resR = resR-(dSinTW*g1*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(dCosTW*g2*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(g2*Conjg(dUP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(dg2*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR-(g1*Conjg(dUP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR-(dg1*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVZ  
 
 
Subroutine CT_CouplingChiChiVZ(gt1,gt2,g1,g2,ZN,TW,dg1,dg2,dZN,dSinTW,dCosTW,         & 
& dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZN(5,5),dZN(5,5)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(ZN(gt2,3))*Cos(TW)*dZN(gt1,3))/2._dp
resL = resL+(g2*Conjg(ZN(gt2,4))*Cos(TW)*dZN(gt1,4))/2._dp
resL = resL-(g1*Conjg(ZN(gt2,3))*dZN(gt1,3)*Sin(TW))/2._dp
resL = resL+(g1*Conjg(ZN(gt2,4))*dZN(gt1,4)*Sin(TW))/2._dp
resL = resL-(dSinTW*g1*Conjg(ZN(gt2,3))*ZN(gt1,3))/2._dp
resL = resL-(dCosTW*g2*Conjg(ZN(gt2,3))*ZN(gt1,3))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Cos(TW)*ZN(gt1,3))/2._dp
resL = resL-(dg2*Conjg(ZN(gt2,3))*Cos(TW)*ZN(gt1,3))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,3))*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL-(dg1*Conjg(ZN(gt2,3))*Sin(TW)*ZN(gt1,3))/2._dp
resL = resL+(dSinTW*g1*Conjg(ZN(gt2,4))*ZN(gt1,4))/2._dp
resL = resL+(dCosTW*g2*Conjg(ZN(gt2,4))*ZN(gt1,4))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL+(dg2*Conjg(ZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL+(dg1*Conjg(ZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resR = 0._dp 
resR = resR+(g2*Conjg(ZN(gt1,3))*Cos(TW)*dZN(gt2,3))/2._dp
resR = resR-(g2*Conjg(ZN(gt1,4))*Cos(TW)*dZN(gt2,4))/2._dp
resR = resR+(g1*Conjg(ZN(gt1,3))*dZN(gt2,3)*Sin(TW))/2._dp
resR = resR-(g1*Conjg(ZN(gt1,4))*dZN(gt2,4)*Sin(TW))/2._dp
resR = resR+(dSinTW*g1*Conjg(ZN(gt1,3))*ZN(gt2,3))/2._dp
resR = resR+(dCosTW*g2*Conjg(ZN(gt1,3))*ZN(gt2,3))/2._dp
resR = resR+(g2*Conjg(dZN(gt1,3))*Cos(TW)*ZN(gt2,3))/2._dp
resR = resR+(dg2*Conjg(ZN(gt1,3))*Cos(TW)*ZN(gt2,3))/2._dp
resR = resR+(g1*Conjg(dZN(gt1,3))*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR+(dg1*Conjg(ZN(gt1,3))*Sin(TW)*ZN(gt2,3))/2._dp
resR = resR-(dSinTW*g1*Conjg(ZN(gt1,4))*ZN(gt2,4))/2._dp
resR = resR-(dCosTW*g2*Conjg(ZN(gt1,4))*ZN(gt2,4))/2._dp
resR = resR-(g2*Conjg(dZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR-(dg2*Conjg(ZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR-(g1*Conjg(dZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR-(dg1*Conjg(ZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiVZ  
 
 
Subroutine CT_CouplingcChaChiVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZN(5,5),UM(2,2),UP(2,2),dZN(5,5),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChiVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.5)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(ZN(gt2,2))*dUM(gt1,1))
resL = resL-((g2*Conjg(ZN(gt2,3))*dUM(gt1,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(dZN(gt2,2))*UM(gt1,1))
resL = resL-(dg2*Conjg(ZN(gt2,2))*UM(gt1,1))
resL = resL-((g2*Conjg(dZN(gt2,3))*UM(gt1,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(ZN(gt2,3))*UM(gt1,2))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(g2*Conjg(UP(gt1,1))*dZN(gt2,2))
resR = resR+(g2*Conjg(UP(gt1,2))*dZN(gt2,4))/sqrt(2._dp)
resR = resR-(g2*Conjg(dUP(gt1,1))*ZN(gt2,2))
resR = resR-(dg2*Conjg(UP(gt1,1))*ZN(gt2,2))
resR = resR+(g2*Conjg(dUP(gt1,2))*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(dg2*Conjg(UP(gt1,2))*ZN(gt2,4))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChiVWm  
 
 
Subroutine CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVG  
 
 
Subroutine CT_CouplingcFdFdVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVP  
 
 
Subroutine CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZ  
 
 
Subroutine CT_CouplingcFuFdcVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*dZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdcVWm  
 
 
Subroutine CT_CouplingFvFecVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: UV(9,9),ZEL(3,3),dUV(9,9),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*dUV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFecVWm  
 
 
Subroutine CT_CouplingcFeFeVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTW*g1
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dg1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVP  
 
 
Subroutine CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZ  
 
 
Subroutine CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVG  
 
 
Subroutine CT_CouplingcFuFuVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dg1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVP  
 
 
Subroutine CT_CouplingcFdFuVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*dZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFuVWm  
 
 
Subroutine CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dSinTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dg1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZ  
 
 
Subroutine CT_CouplingFvFvVZ(gt1,gt2,g1,g2,UV,TW,dg1,dg2,dUV,dSinTW,dCosTW,           & 
& dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: UV(9,9),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UV(gt2,j1))*Cos(TW)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dSinTW*g1*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dCosTW*g2*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dUV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Cos(TW)*dUV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*g1*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTW*g2*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dUV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dUV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVZ  
 
 
Subroutine CT_CouplingcFeFvVWm(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: UV(9,9),ZEL(3,3),dUV(9,9),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(UV(gt2,j1))*dZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvVWm  
 
 
Subroutine CT_CouplingGluGluVG(g3,pG,dg3,dpG,resL,resR)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,dpG

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluGluVG' 
 
resL = 0._dp 
resL = resL-(g3*pG*Conjg(dpG))
resL = resL-(dpG*g3*Conjg(pG))
resL = resL-(dg3*pG*Conjg(pG))
resR = 0._dp 
resR = resR-(g3*pG*Conjg(dpG))
resR = resR-(dpG*g3*Conjg(pG))
resR = resR-(dg3*pG*Conjg(pG))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluGluVG  
 
 
End Module CouplingsCT_NInvSeesaw 
