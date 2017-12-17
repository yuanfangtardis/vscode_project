! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:46 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecays_seesaw1nmssm 
Use Couplings_seesaw1nmssm 
Use CouplingsCT_seesaw1nmssm 
Use Model_Data_seesaw1nmssm 
Use LoopCouplings_seesaw1nmssm 
Use LoopMasses_seesaw1nmssm 
Use RGEs_seesaw1nmssm 
Use Tadpoles_seesaw1nmssm 
Use Kinematics 
Use CouplingsForDecays_seesaw1nmssm 
 
Use Wrapper_OneLoopDecay_SvRe_seesaw1nmssm 
Use Wrapper_OneLoopDecay_SvIm_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Hpm_seesaw1nmssm 
Use Wrapper_OneLoopDecay_hh_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Ah_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Su_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Sd_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Se_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Glu_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Cha_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Chi_seesaw1nmssm 
Use Wrapper_OneLoopDecay_Fv_seesaw1nmssm 

 
Contains 
 
Subroutine getZCouplings(lam,Tlam,kap,Tk,vd,vu,vS,ZA,g1,g2,ZH,ZP,Yd,Td,               & 
& ZD,Ye,Te,ZE,Yu,Tu,ZU,lamN,TLN,Yv,Tv,ZVI,ZVR,g3,TW,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,            & 
& ZUL,ZUR,UV,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,      & 
& cplAhAhAhAh,cplAhAhAhhh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,          & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhhhhh,              & 
& cplAhhhHpmcHpm,cplAhhhSdcSd,cplAhhhSecSe,cplAhhhSucSu,cplAhhhSvImSvIm,cplAhhhSvImSvRe, & 
& cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,          & 
& cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,               & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,             & 
& cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,          & 
& cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,     & 
& cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,  & 
& cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,       & 
& cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,            & 
& cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,     & 
& cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,          & 
& cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,           & 
& cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcSdVG,cplSdcSdVP,             & 
& cplSdcSdVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,             & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSvImSvReVZ,cplSvImcSeVWm,              & 
& cplSvRecSeVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplcHpmVPVWm,           & 
& cplcHpmVWmVZ,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHpmcVWmVP,cplAhHpmcVWmVZ,cplAhcHpmVPVWm,  & 
& cplAhcHpmVWmVZ,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhHpmcVWmVP,cplhhHpmcVWmVZ,               & 
& cplhhcHpmVPVWm,cplhhcHpmVWmVZ,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,cplHpmcHpmcVWmVWm,         & 
& cplHpmcHpmVZVZ,cplSdcSdVGVG,cplSdcSdVGVP,cplSdcSdVGVZ,cplSdcSucVWmVG,cplSdcSdVPVP,     & 
& cplSdcSdVPVZ,cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSucVWmVZ,               & 
& cplSeSvImcVWmVP,cplSeSvImcVWmVZ,cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSecSeVPVP,          & 
& cplSecSeVPVZ,cplSecSecVWmVWm,cplSecSeVZVZ,cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,     & 
& cplSucSuVGVZ,cplSucSuVPVP,cplSucSdVPVWm,cplSucSuVPVZ,cplSucSdVWmVZ,cplSucSucVWmVWm,    & 
& cplSucSuVZVZ,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImcSeVPVWm,cplSvImcSeVWmVZ,       & 
& cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplVGVGVG,          & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,             & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,               & 
& cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,         & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,       & 
& cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpCVP,   & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgWmAh,   & 
& cplcgWpCgWpCAh,cplcgZgAhh,cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,ZRUZD,             & 
& ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,            & 
& ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,ZcplAhAhAh,ZcplAhAhhh,ZcplAhhhhh,ZcplAhHpmcHpm,     & 
& ZcplAhSdcSd,ZcplAhSecSe,ZcplAhSucSu,ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplAhSvReSvRe,      & 
& Zcplhhhhhh,ZcplhhHpmcHpm,ZcplhhSdcSd,ZcplhhSecSe,ZcplhhSucSu,ZcplhhSvImSvIm,           & 
& ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplHpmSucSd,ZcplHpmSvImcSe,ZcplHpmSvRecSe,              & 
& ZcplSdcHpmcSu,ZcplSeSvImcHpm,ZcplSeSvRecHpm,ZcplAhAhAhAh,ZcplAhAhAhhh,ZcplAhAhhhhh,    & 
& ZcplAhAhHpmcHpm,ZcplAhAhSdcSd,ZcplAhAhSecSe,ZcplAhAhSucSu,ZcplAhAhSvImSvIm,            & 
& ZcplAhAhSvImSvRe,ZcplAhAhSvReSvRe,ZcplAhhhhhhh,ZcplAhhhHpmcHpm,ZcplAhhhSdcSd,          & 
& ZcplAhhhSecSe,ZcplAhhhSucSu,ZcplAhhhSvImSvIm,ZcplAhhhSvImSvRe,ZcplAhhhSvReSvRe,        & 
& ZcplAhHpmSucSd,ZcplAhHpmSvImcSe,ZcplAhHpmSvRecSe,ZcplAhSdcHpmcSu,ZcplAhSeSvImcHpm,     & 
& ZcplAhSeSvRecHpm,Zcplhhhhhhhh,ZcplhhhhHpmcHpm,ZcplhhhhSdcSd,ZcplhhhhSecSe,             & 
& ZcplhhhhSucSu,ZcplhhhhSvImSvIm,ZcplhhhhSvImSvRe,ZcplhhhhSvReSvRe,ZcplhhHpmSucSd,       & 
& ZcplhhHpmSvImcSe,ZcplhhHpmSvRecSe,ZcplhhSdcHpmcSu,ZcplhhSeSvImcHpm,ZcplhhSeSvRecHpm,   & 
& ZcplHpmHpmcHpmcHpm,ZcplHpmSdcHpmcSd,ZcplHpmSecHpmcSe,ZcplHpmSucHpmcSu,ZcplHpmSvImSvImcHpm,& 
& ZcplHpmSvImSvRecHpm,ZcplHpmSvReSvRecHpm,ZcplSdSdcSdcSd,ZcplSdSecSdcSe,ZcplSdSucSdcSu,  & 
& ZcplSdSvImSvImcSd,ZcplSdSvImcSecSu,ZcplSdSvReSvRecSd,ZcplSdSvRecSecSu,ZcplSeSecSecSe,  & 
& ZcplSeSuSvImcSd,ZcplSeSuSvRecSd,ZcplSeSucSecSu,ZcplSeSvImSvImcSe,ZcplSeSvImSvRecSe,    & 
& ZcplSeSvReSvRecSe,ZcplSuSucSucSu,ZcplSuSvImSvImcSu,ZcplSuSvImSvRecSu,ZcplSuSvReSvRecSu,& 
& ZcplSvImSvImSvImSvIm,ZcplSvImSvImSvImSvRe,ZcplSvImSvImSvReSvRe,ZcplSvImSvReSvReSvRe,   & 
& ZcplSvReSvReSvReSvRe,ZcplAhhhVZ,ZcplAhHpmcVWm,ZcplAhcHpmVWm,ZcplhhHpmcVWm,             & 
& ZcplhhcHpmVWm,ZcplHpmcHpmVP,ZcplHpmcHpmVZ,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSdcSdVZ,         & 
& ZcplSdcSucVWm,ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSecSeVP,ZcplSecSeVZ,ZcplSucSuVG,       & 
& ZcplSucSuVP,ZcplSucSdVWm,ZcplSucSuVZ,ZcplSvImSvReVZ,ZcplSvImcSeVWm,ZcplSvRecSeVWm,     & 
& ZcplhhcVWmVWm,ZcplhhVZVZ,ZcplHpmcVWmVP,ZcplHpmcVWmVZ,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,      & 
& ZcplAhAhcVWmVWm,ZcplAhAhVZVZ,ZcplAhHpmcVWmVP,ZcplAhHpmcVWmVZ,ZcplAhcHpmVPVWm,          & 
& ZcplAhcHpmVWmVZ,ZcplhhhhcVWmVWm,ZcplhhhhVZVZ,ZcplhhHpmcVWmVP,ZcplhhHpmcVWmVZ,          & 
& ZcplhhcHpmVPVWm,ZcplhhcHpmVWmVZ,ZcplHpmcHpmVPVP,ZcplHpmcHpmVPVZ,ZcplHpmcHpmcVWmVWm,    & 
& ZcplHpmcHpmVZVZ,ZcplSdcSdVGVG,ZcplSdcSdVGVP,ZcplSdcSdVGVZ,ZcplSdcSucVWmVG,             & 
& ZcplSdcSdVPVP,ZcplSdcSdVPVZ,ZcplSdcSucVWmVP,ZcplSdcSdcVWmVWm,ZcplSdcSdVZVZ,            & 
& ZcplSdcSucVWmVZ,ZcplSeSvImcVWmVP,ZcplSeSvImcVWmVZ,ZcplSeSvRecVWmVP,ZcplSeSvRecVWmVZ,   & 
& ZcplSecSeVPVP,ZcplSecSeVPVZ,ZcplSecSecVWmVWm,ZcplSecSeVZVZ,ZcplSucSuVGVG,              & 
& ZcplSucSuVGVP,ZcplSucSdVGVWm,ZcplSucSuVGVZ,ZcplSucSuVPVP,ZcplSucSdVPVWm,               & 
& ZcplSucSuVPVZ,ZcplSucSdVWmVZ,ZcplSucSucVWmVWm,ZcplSucSuVZVZ,ZcplSvImSvImcVWmVWm,       & 
& ZcplSvImSvImVZVZ,ZcplSvImcSeVPVWm,ZcplSvImcSeVWmVZ,ZcplSvReSvRecVWmVWm,ZcplSvReSvReVZVZ,& 
& ZcplSvRecSeVPVWm,ZcplSvRecSeVWmVZ,ZcplVGVGVG,ZcplcVWmVPVWm,ZcplcVWmVWmVZ,              & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,   & 
& ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplFvFvAhL,ZcplFvFvAhR,           & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplFvChacSeL,             & 
& ZcplFvChacSeR,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcFdChaSuL,ZcplcFdChaSuR,               & 
& ZcplcFeChaSvImL,ZcplcFeChaSvImR,ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplChiChihhL,         & 
& ZcplChiChihhR,ZcplChiFdcSdL,ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,   & 
& ZcplChiFucSuR,ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,             & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFeChiSeL,             & 
& ZcplcFeChiSeR,ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,              & 
& ZcplFvFecHpmL,ZcplFvFecHpmR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR, & 
& ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplGluFucSuL,ZcplGluFucSuR,ZcplcFuFuhhL,              & 
& ZcplcFuFuhhR,ZcplcFdFuHpmL,ZcplcFdFuHpmR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplcFeFvHpmL,        & 
& ZcplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuGluSuL,   & 
& ZcplcFuGluSuR,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplChiChacVWmL,ZcplChiChacVWmR,           & 
& ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplChiChiVZL,             & 
& ZcplChiChiVZR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVGL,ZcplcFdFdVGR,               & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR,     & 
& ZcplFvFecVWmL,ZcplFvFecVWmR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,       & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFdFuVWmL,ZcplcFdFuVWmR,       & 
& ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplFvFvVZL,ZcplFvFvVZR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,         & 
& ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,& 
& ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,  & 
& ZcplcVWmcVWmVWmVWm1,ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,          & 
& ZcplcVWmVWmVZVZ2,ZcplcVWmVWmVZVZ3,ZcplcgGgGVG,ZcplcgWmgAVWm,ZcplcgWpCgAcVWm,           & 
& ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgAgWmcVWm,ZcplcgZgWmcVWm,ZcplcgWpCgWpCVP,             & 
& ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,ZcplcgWpCgWpCVZ,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,           & 
& ZcplcgWmgWmAh,ZcplcgWpCgWpCAh,ZcplcgZgAhh,ZcplcgWmgAHpm,ZcplcgWpCgAcHpm,               & 
& ZcplcgWmgWmhh,ZcplcgZgWmcHpm,ZcplcgWpCgWpChh,ZcplcgZgWpCHpm,ZcplcgZgZhh,               & 
& ZcplcgWmgZHpm,ZcplcgWpCgZcHpm)

Implicit None

Real(dp), Intent(in) :: vd,vu,vS,ZA(3,3),g1,g2,ZH(3,3),ZP(2,2),g3,TW

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,Yd(3,3),Td(3,3),ZD(6,6),Ye(3,3),Te(3,3),ZE(6,6),Yu(3,3),              & 
& Tu(3,3),ZU(6,6),lamN(3,3),TLN(3,3),Yv(3,3),Tv(3,3),ZVI(6,6),ZVR(6,6),UM(2,2),          & 
& UP(2,2),ZN(5,5),ZDL(3,3),ZDR(3,3),ZEL(3,3),ZER(3,3),ZUL(3,3),ZUR(3,3),UV(6,6),pG

Complex(dp), Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),            & 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),     & 
& cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),    & 
& cplAhAhAhAh(3,3,3,3),cplAhAhAhhh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),& 
& cplAhAhSdcSd(3,3,6,6),cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,6,6),& 
& cplAhAhSvImSvRe(3,3,6,6),cplAhAhSvReSvRe(3,3,6,6),cplAhhhhhhh(3,3,3,3),cplAhhhHpmcHpm(3,3,2,2),& 
& cplAhhhSdcSd(3,3,6,6),cplAhhhSecSe(3,3,6,6),cplAhhhSucSu(3,3,6,6),cplAhhhSvImSvIm(3,3,6,6),& 
& cplAhhhSvImSvRe(3,3,6,6),cplAhhhSvReSvRe(3,3,6,6),cplAhHpmSucSd(3,2,6,6),              & 
& cplAhHpmSvImcSe(3,2,6,6),cplAhHpmSvRecSe(3,2,6,6),cplAhSdcHpmcSu(3,6,2,6),             & 
& cplAhSeSvImcHpm(3,6,6,2),cplAhSeSvRecHpm(3,6,6,2),cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),& 
& cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,6,6),& 
& cplhhhhSvImSvRe(3,3,6,6),cplhhhhSvReSvRe(3,3,6,6),cplhhHpmSucSd(3,2,6,6),              & 
& cplhhHpmSvImcSe(3,2,6,6),cplhhHpmSvRecSe(3,2,6,6),cplhhSdcHpmcSu(3,6,2,6),             & 
& cplhhSeSvImcHpm(3,6,6,2),cplhhSeSvRecHpm(3,6,6,2),cplHpmHpmcHpmcHpm(2,2,2,2),          & 
& cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),            & 
& cplHpmSvImSvImcHpm(2,6,6,2),cplHpmSvImSvRecHpm(2,6,6,2),cplHpmSvReSvRecHpm(2,6,6,2),   & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSdSvImSvImcSd(6,6,6,6),& 
& cplSdSvImcSecSu(6,6,6,6),cplSdSvReSvRecSd(6,6,6,6),cplSdSvRecSecSu(6,6,6,6),           & 
& cplSeSecSecSe(6,6,6,6),cplSeSuSvImcSd(6,6,6,6),cplSeSuSvRecSd(6,6,6,6),cplSeSucSecSu(6,6,6,6),& 
& cplSeSvImSvImcSe(6,6,6,6),cplSeSvImSvRecSe(6,6,6,6),cplSeSvReSvRecSe(6,6,6,6),         & 
& cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),cplSuSvImSvRecSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvImSvRe(6,6,6,6),   & 
& cplSvImSvImSvReSvRe(6,6,6,6),cplSvImSvReSvReSvRe(6,6,6,6),cplSvReSvReSvReSvRe(6,6,6,6),& 
& cplAhhhVZ(3,3),cplAhHpmcVWm(3,2),cplAhcHpmVWm(3,2),cplhhHpmcVWm(3,2),cplhhcHpmVWm(3,2),& 
& cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),   & 
& cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),               & 
& cplSecSeVZ(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),      & 
& cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplhhcVWmVWm(3),              & 
& cplhhVZVZ(3),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),          & 
& cplAhAhcVWmVWm(3,3),cplAhAhVZVZ(3,3),cplAhHpmcVWmVP(3,2),cplAhHpmcVWmVZ(3,2),          & 
& cplAhcHpmVPVWm(3,2),cplAhcHpmVWmVZ(3,2),cplhhhhcVWmVWm(3,3),cplhhhhVZVZ(3,3),          & 
& cplhhHpmcVWmVP(3,2),cplhhHpmcVWmVZ(3,2),cplhhcHpmVPVWm(3,2),cplhhcHpmVWmVZ(3,2),       & 
& cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVZVZ(2,2),    & 
& cplSdcSdVGVG(6,6),cplSdcSdVGVP(6,6),cplSdcSdVGVZ(6,6),cplSdcSucVWmVG(6,6)

Complex(dp), Intent(in) :: cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6),cplSdcSucVWmVP(6,6),cplSdcSdcVWmVWm(6,6),          & 
& cplSdcSdVZVZ(6,6),cplSdcSucVWmVZ(6,6),cplSeSvImcVWmVP(6,6),cplSeSvImcVWmVZ(6,6),       & 
& cplSeSvRecVWmVP(6,6),cplSeSvRecVWmVZ(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),         & 
& cplSecSecVWmVWm(6,6),cplSecSeVZVZ(6,6),cplSucSuVGVG(6,6),cplSucSuVGVP(6,6),            & 
& cplSucSdVGVWm(6,6),cplSucSuVGVZ(6,6),cplSucSuVPVP(6,6),cplSucSdVPVWm(6,6),             & 
& cplSucSuVPVZ(6,6),cplSucSdVWmVZ(6,6),cplSucSucVWmVWm(6,6),cplSucSuVZVZ(6,6),           & 
& cplSvImSvImcVWmVWm(6,6),cplSvImSvImVZVZ(6,6),cplSvImcSeVPVWm(6,6),cplSvImcSeVWmVZ(6,6),& 
& cplSvReSvRecVWmVWm(6,6),cplSvReSvReVZVZ(6,6),cplSvRecSeVPVWm(6,6),cplSvRecSeVWmVZ(6,6),& 
& cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),         & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),           & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),              & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3), & 
& cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),   & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1

Complex(dp), Intent(in) :: cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,         & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm, & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplcgZgAhh(3),cplcgWmgAHpm(2),cplcgWpCgAcHpm(2),     & 
& cplcgWmgWmhh(3),cplcgZgWmcHpm(2),cplcgWpCgWpChh(3),cplcgZgWpCHpm(2),cplcgZgZhh(3),     & 
& cplcgWmgZHpm(2),cplcgWpCgZcHpm(2)

Complex(dp), Intent(in) :: ZRUZD(6,6),ZRUZVI(6,6),ZRUZVR(6,6),ZRUZU(6,6),ZRUZE(6,6),ZRUZH(3,3),ZRUZA(3,3),       & 
& ZRUZP(2,2),ZRUZN(5,5),ZRUUV(6,6),ZRUUM(2,2),ZRUUP(2,2),ZRUZEL(3,3),ZRUZER(3,3),        & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Integer :: gt1, gt2
Complex(dp) :: TempcplAhAhAh(3,3,3),TempcplAhAhhh(3,3,3),TempcplAhhhhh(3,3,3),TempcplAhHpmcHpm(3,2,2),& 
& TempcplAhSdcSd(3,6,6),TempcplAhSecSe(3,6,6),TempcplAhSucSu(3,6,6),TempcplAhSvImSvIm(3,6,6),& 
& TempcplAhSvImSvRe(3,6,6),TempcplAhSvReSvRe(3,6,6),Tempcplhhhhhh(3,3,3),TempcplhhHpmcHpm(3,2,2),& 
& TempcplhhSdcSd(3,6,6),TempcplhhSecSe(3,6,6),TempcplhhSucSu(3,6,6),TempcplhhSvImSvIm(3,6,6),& 
& TempcplhhSvImSvRe(3,6,6),TempcplhhSvReSvRe(3,6,6),TempcplHpmSucSd(2,6,6),              & 
& TempcplHpmSvImcSe(2,6,6),TempcplHpmSvRecSe(2,6,6),TempcplSdcHpmcSu(6,2,6),             & 
& TempcplSeSvImcHpm(6,6,2),TempcplSeSvRecHpm(6,6,2),TempcplAhAhAhAh(3,3,3,3),            & 
& TempcplAhAhAhhh(3,3,3,3),TempcplAhAhhhhh(3,3,3,3),TempcplAhAhHpmcHpm(3,3,2,2),         & 
& TempcplAhAhSdcSd(3,3,6,6),TempcplAhAhSecSe(3,3,6,6),TempcplAhAhSucSu(3,3,6,6),         & 
& TempcplAhAhSvImSvIm(3,3,6,6),TempcplAhAhSvImSvRe(3,3,6,6),TempcplAhAhSvReSvRe(3,3,6,6),& 
& TempcplAhhhhhhh(3,3,3,3),TempcplAhhhHpmcHpm(3,3,2,2),TempcplAhhhSdcSd(3,3,6,6),        & 
& TempcplAhhhSecSe(3,3,6,6),TempcplAhhhSucSu(3,3,6,6),TempcplAhhhSvImSvIm(3,3,6,6),      & 
& TempcplAhhhSvImSvRe(3,3,6,6),TempcplAhhhSvReSvRe(3,3,6,6),TempcplAhHpmSucSd(3,2,6,6),  & 
& TempcplAhHpmSvImcSe(3,2,6,6),TempcplAhHpmSvRecSe(3,2,6,6),TempcplAhSdcHpmcSu(3,6,2,6), & 
& TempcplAhSeSvImcHpm(3,6,6,2),TempcplAhSeSvRecHpm(3,6,6,2),Tempcplhhhhhhhh(3,3,3,3),    & 
& TempcplhhhhHpmcHpm(3,3,2,2),TempcplhhhhSdcSd(3,3,6,6),TempcplhhhhSecSe(3,3,6,6),       & 
& TempcplhhhhSucSu(3,3,6,6),TempcplhhhhSvImSvIm(3,3,6,6),TempcplhhhhSvImSvRe(3,3,6,6),   & 
& TempcplhhhhSvReSvRe(3,3,6,6),TempcplhhHpmSucSd(3,2,6,6),TempcplhhHpmSvImcSe(3,2,6,6),  & 
& TempcplhhHpmSvRecSe(3,2,6,6),TempcplhhSdcHpmcSu(3,6,2,6),TempcplhhSeSvImcHpm(3,6,6,2), & 
& TempcplhhSeSvRecHpm(3,6,6,2),TempcplHpmHpmcHpmcHpm(2,2,2,2),TempcplHpmSdcHpmcSd(2,6,2,6),& 
& TempcplHpmSecHpmcSe(2,6,2,6),TempcplHpmSucHpmcSu(2,6,2,6),TempcplHpmSvImSvImcHpm(2,6,6,2),& 
& TempcplHpmSvImSvRecHpm(2,6,6,2),TempcplHpmSvReSvRecHpm(2,6,6,2),TempcplSdSdcSdcSd(6,6,6,6),& 
& TempcplSdSecSdcSe(6,6,6,6),TempcplSdSucSdcSu(6,6,6,6),TempcplSdSvImSvImcSd(6,6,6,6),   & 
& TempcplSdSvImcSecSu(6,6,6,6),TempcplSdSvReSvRecSd(6,6,6,6),TempcplSdSvRecSecSu(6,6,6,6),& 
& TempcplSeSecSecSe(6,6,6,6),TempcplSeSuSvImcSd(6,6,6,6),TempcplSeSuSvRecSd(6,6,6,6),    & 
& TempcplSeSucSecSu(6,6,6,6),TempcplSeSvImSvImcSe(6,6,6,6),TempcplSeSvImSvRecSe(6,6,6,6),& 
& TempcplSeSvReSvRecSe(6,6,6,6),TempcplSuSucSucSu(6,6,6,6),TempcplSuSvImSvImcSu(6,6,6,6),& 
& TempcplSuSvImSvRecSu(6,6,6,6),TempcplSuSvReSvRecSu(6,6,6,6),TempcplSvImSvImSvImSvIm(6,6,6,6),& 
& TempcplSvImSvImSvImSvRe(6,6,6,6),TempcplSvImSvImSvReSvRe(6,6,6,6),TempcplSvImSvReSvReSvRe(6,6,6,6),& 
& TempcplSvReSvReSvReSvRe(6,6,6,6),TempcplAhhhVZ(3,3),TempcplAhHpmcVWm(3,2),             & 
& TempcplAhcHpmVWm(3,2),TempcplhhHpmcVWm(3,2),TempcplhhcHpmVWm(3,2),TempcplHpmcHpmVP(2,2),& 
& TempcplHpmcHpmVZ(2,2),TempcplSdcSdVG(6,6),TempcplSdcSdVP(6,6),TempcplSdcSdVZ(6,6),     & 
& TempcplSdcSucVWm(6,6),TempcplSeSvImcVWm(6,6),TempcplSeSvRecVWm(6,6),TempcplSecSeVP(6,6),& 
& TempcplSecSeVZ(6,6),TempcplSucSuVG(6,6),TempcplSucSuVP(6,6),TempcplSucSdVWm(6,6),      & 
& TempcplSucSuVZ(6,6),TempcplSvImSvReVZ(6,6),TempcplSvImcSeVWm(6,6),TempcplSvRecSeVWm(6,6),& 
& TempcplhhcVWmVWm(3),TempcplhhVZVZ(3),TempcplHpmcVWmVP(2),TempcplHpmcVWmVZ(2),          & 
& TempcplcHpmVPVWm(2),TempcplcHpmVWmVZ(2),TempcplAhAhcVWmVWm(3,3),TempcplAhAhVZVZ(3,3)

Complex(dp) :: TempcplAhHpmcVWmVP(3,2),TempcplAhHpmcVWmVZ(3,2),TempcplAhcHpmVPVWm(3,2),               & 
& TempcplAhcHpmVWmVZ(3,2),TempcplhhhhcVWmVWm(3,3),TempcplhhhhVZVZ(3,3),TempcplhhHpmcVWmVP(3,2),& 
& TempcplhhHpmcVWmVZ(3,2),TempcplhhcHpmVPVWm(3,2),TempcplhhcHpmVWmVZ(3,2),               & 
& TempcplHpmcHpmVPVP(2,2),TempcplHpmcHpmVPVZ(2,2),TempcplHpmcHpmcVWmVWm(2,2),            & 
& TempcplHpmcHpmVZVZ(2,2),TempcplSdcSdVGVG(6,6),TempcplSdcSdVGVP(6,6),TempcplSdcSdVGVZ(6,6),& 
& TempcplSdcSucVWmVG(6,6),TempcplSdcSdVPVP(6,6),TempcplSdcSdVPVZ(6,6),TempcplSdcSucVWmVP(6,6),& 
& TempcplSdcSdcVWmVWm(6,6),TempcplSdcSdVZVZ(6,6),TempcplSdcSucVWmVZ(6,6),TempcplSeSvImcVWmVP(6,6),& 
& TempcplSeSvImcVWmVZ(6,6),TempcplSeSvRecVWmVP(6,6),TempcplSeSvRecVWmVZ(6,6),            & 
& TempcplSecSeVPVP(6,6),TempcplSecSeVPVZ(6,6),TempcplSecSecVWmVWm(6,6),TempcplSecSeVZVZ(6,6),& 
& TempcplSucSuVGVG(6,6),TempcplSucSuVGVP(6,6),TempcplSucSdVGVWm(6,6),TempcplSucSuVGVZ(6,6),& 
& TempcplSucSuVPVP(6,6),TempcplSucSdVPVWm(6,6),TempcplSucSuVPVZ(6,6),TempcplSucSdVWmVZ(6,6),& 
& TempcplSucSucVWmVWm(6,6),TempcplSucSuVZVZ(6,6),TempcplSvImSvImcVWmVWm(6,6),            & 
& TempcplSvImSvImVZVZ(6,6),TempcplSvImcSeVPVWm(6,6),TempcplSvImcSeVWmVZ(6,6),            & 
& TempcplSvReSvRecVWmVWm(6,6),TempcplSvReSvReVZVZ(6,6),TempcplSvRecSeVPVWm(6,6),         & 
& TempcplSvRecSeVWmVZ(6,6),TempcplVGVGVG,TempcplcVWmVPVWm,TempcplcVWmVWmVZ,              & 
& TempcplcChaChaAhL(2,2,3),TempcplcChaChaAhR(2,2,3),TempcplChiChiAhL(5,5,3),             & 
& TempcplChiChiAhR(5,5,3),TempcplcFdFdAhL(3,3,3),TempcplcFdFdAhR(3,3,3),TempcplcFeFeAhL(3,3,3),& 
& TempcplcFeFeAhR(3,3,3),TempcplcFuFuAhL(3,3,3),TempcplcFuFuAhR(3,3,3),TempcplFvFvAhL(6,6,3),& 
& TempcplFvFvAhR(6,6,3),TempcplChiChacHpmL(5,2,2),TempcplChiChacHpmR(5,2,2),             & 
& TempcplChaFucSdL(2,3,6),TempcplChaFucSdR(2,3,6),TempcplFvChacSeL(6,2,6),               & 
& TempcplFvChacSeR(6,2,6),TempcplcChaChahhL(2,2,3),TempcplcChaChahhR(2,2,3),             & 
& TempcplcFdChaSuL(3,2,6),TempcplcFdChaSuR(3,2,6),TempcplcFeChaSvImL(3,2,6),             & 
& TempcplcFeChaSvImR(3,2,6),TempcplcFeChaSvReL(3,2,6),TempcplcFeChaSvReR(3,2,6),         & 
& TempcplChiChihhL(5,5,3),TempcplChiChihhR(5,5,3),TempcplChiFdcSdL(5,3,6),               & 
& TempcplChiFdcSdR(5,3,6),TempcplChiFecSeL(5,3,6),TempcplChiFecSeR(5,3,6),               & 
& TempcplChiFucSuL(5,3,6),TempcplChiFucSuR(5,3,6),TempcplChiFvSvImL(5,6,6),              & 
& TempcplChiFvSvImR(5,6,6),TempcplChiFvSvReL(5,6,6),TempcplChiFvSvReR(5,6,6),            & 
& TempcplcChaChiHpmL(2,5,2),TempcplcChaChiHpmR(2,5,2),TempcplcFdChiSdL(3,5,6),           & 
& TempcplcFdChiSdR(3,5,6),TempcplcFeChiSeL(3,5,6),TempcplcFeChiSeR(3,5,6),               & 
& TempcplcFuChiSuL(3,5,6),TempcplcFuChiSuR(3,5,6),TempcplGluFdcSdL(3,6),TempcplGluFdcSdR(3,6),& 
& TempcplcFdFdhhL(3,3,3),TempcplcFdFdhhR(3,3,3),TempcplcChaFdcSuL(2,3,6),TempcplcChaFdcSuR(2,3,6),& 
& TempcplcFuFdcHpmL(3,3,2),TempcplcFuFdcHpmR(3,3,2),TempcplFvFecHpmL(6,3,2),             & 
& TempcplFvFecHpmR(6,3,2),TempcplcFeFehhL(3,3,3),TempcplcFeFehhR(3,3,3),TempcplcChaFeSvImL(2,3,6),& 
& TempcplcChaFeSvImR(2,3,6),TempcplcChaFeSvReL(2,3,6),TempcplcChaFeSvReR(2,3,6),         & 
& TempcplGluFucSuL(3,6),TempcplGluFucSuR(3,6),TempcplcFuFuhhL(3,3,3),TempcplcFuFuhhR(3,3,3),& 
& TempcplcFdFuHpmL(3,3,2),TempcplcFdFuHpmR(3,3,2),TempcplFvFvhhL(6,6,3),TempcplFvFvhhR(6,6,3),& 
& TempcplcFeFvHpmL(3,6,2),TempcplcFeFvHpmR(3,6,2),TempcplcChaFvSeL(2,6,6)

Complex(dp) :: TempcplcChaFvSeR(2,6,6),TempcplcFdGluSdL(3,6),TempcplcFdGluSdR(3,6),TempcplcFuGluSuL(3,6),& 
& TempcplcFuGluSuR(3,6),TempcplcChacFuSdL(2,3,6),TempcplcChacFuSdR(2,3,6),               & 
& TempcplChiChacVWmL(5,2),TempcplChiChacVWmR(5,2),TempcplcChaChaVPL(2,2),TempcplcChaChaVPR(2,2),& 
& TempcplcChaChaVZL(2,2),TempcplcChaChaVZR(2,2),TempcplChiChiVZL(5,5),TempcplChiChiVZR(5,5),& 
& TempcplcChaChiVWmL(2,5),TempcplcChaChiVWmR(2,5),TempcplcFdFdVGL(3,3),TempcplcFdFdVGR(3,3),& 
& TempcplcFdFdVPL(3,3),TempcplcFdFdVPR(3,3),TempcplcFdFdVZL(3,3),TempcplcFdFdVZR(3,3),   & 
& TempcplcFuFdcVWmL(3,3),TempcplcFuFdcVWmR(3,3),TempcplFvFecVWmL(6,3),TempcplFvFecVWmR(6,3),& 
& TempcplcFeFeVPL(3,3),TempcplcFeFeVPR(3,3),TempcplcFeFeVZL(3,3),TempcplcFeFeVZR(3,3),   & 
& TempcplcFuFuVGL(3,3),TempcplcFuFuVGR(3,3),TempcplcFuFuVPL(3,3),TempcplcFuFuVPR(3,3),   & 
& TempcplcFdFuVWmL(3,3),TempcplcFdFuVWmR(3,3),TempcplcFuFuVZL(3,3),TempcplcFuFuVZR(3,3), & 
& TempcplFvFvVZL(6,6),TempcplFvFvVZR(6,6),TempcplcFeFvVWmL(3,6),TempcplcFeFvVWmR(3,6),   & 
& TempcplGluGluVGL,TempcplGluGluVGR,TempcplVGVGVGVG1,TempcplVGVGVGVG2,TempcplVGVGVGVG3,  & 
& TempcplcVWmVPVPVWm1,TempcplcVWmVPVPVWm2,TempcplcVWmVPVPVWm3,TempcplcVWmVPVWmVZ1,       & 
& TempcplcVWmVPVWmVZ2,TempcplcVWmVPVWmVZ3,TempcplcVWmcVWmVWmVWm1,TempcplcVWmcVWmVWmVWm2, & 
& TempcplcVWmcVWmVWmVWm3,TempcplcVWmVWmVZVZ1,TempcplcVWmVWmVZVZ2,TempcplcVWmVWmVZVZ3,    & 
& TempcplcgGgGVG,TempcplcgWmgAVWm,TempcplcgWpCgAcVWm,TempcplcgWmgWmVP,TempcplcgWmgWmVZ,  & 
& TempcplcgAgWmcVWm,TempcplcgZgWmcVWm,TempcplcgWpCgWpCVP,TempcplcgAgWpCVWm,              & 
& TempcplcgZgWpCVWm,TempcplcgWpCgWpCVZ,TempcplcgWmgZVWm,TempcplcgWpCgZcVWm,              & 
& TempcplcgWmgWmAh(3),TempcplcgWpCgWpCAh(3),TempcplcgZgAhh(3),TempcplcgWmgAHpm(2),       & 
& TempcplcgWpCgAcHpm(2),TempcplcgWmgWmhh(3),TempcplcgZgWmcHpm(2),TempcplcgWpCgWpChh(3),  & 
& TempcplcgZgWpCHpm(2),TempcplcgZgZhh(3),TempcplcgWmgZHpm(2),TempcplcgWpCgZcHpm(2)

Complex(dp), Intent(out) :: ZcplAhAhAh(3,3,3),ZcplAhAhhh(3,3,3),ZcplAhhhhh(3,3,3),ZcplAhHpmcHpm(3,2,2),           & 
& ZcplAhSdcSd(3,6,6),ZcplAhSecSe(3,6,6),ZcplAhSucSu(3,6,6),ZcplAhSvImSvIm(3,6,6),        & 
& ZcplAhSvImSvRe(3,6,6),ZcplAhSvReSvRe(3,6,6),Zcplhhhhhh(3,3,3),ZcplhhHpmcHpm(3,2,2),    & 
& ZcplhhSdcSd(3,6,6),ZcplhhSecSe(3,6,6),ZcplhhSucSu(3,6,6),ZcplhhSvImSvIm(3,6,6),        & 
& ZcplhhSvImSvRe(3,6,6),ZcplhhSvReSvRe(3,6,6),ZcplHpmSucSd(2,6,6),ZcplHpmSvImcSe(2,6,6), & 
& ZcplHpmSvRecSe(2,6,6),ZcplSdcHpmcSu(6,2,6),ZcplSeSvImcHpm(6,6,2),ZcplSeSvRecHpm(6,6,2),& 
& ZcplAhAhAhAh(3,3,3,3),ZcplAhAhAhhh(3,3,3,3),ZcplAhAhhhhh(3,3,3,3),ZcplAhAhHpmcHpm(3,3,2,2),& 
& ZcplAhAhSdcSd(3,3,6,6),ZcplAhAhSecSe(3,3,6,6),ZcplAhAhSucSu(3,3,6,6),ZcplAhAhSvImSvIm(3,3,6,6),& 
& ZcplAhAhSvImSvRe(3,3,6,6),ZcplAhAhSvReSvRe(3,3,6,6),ZcplAhhhhhhh(3,3,3,3),             & 
& ZcplAhhhHpmcHpm(3,3,2,2),ZcplAhhhSdcSd(3,3,6,6),ZcplAhhhSecSe(3,3,6,6),ZcplAhhhSucSu(3,3,6,6),& 
& ZcplAhhhSvImSvIm(3,3,6,6),ZcplAhhhSvImSvRe(3,3,6,6),ZcplAhhhSvReSvRe(3,3,6,6),         & 
& ZcplAhHpmSucSd(3,2,6,6),ZcplAhHpmSvImcSe(3,2,6,6),ZcplAhHpmSvRecSe(3,2,6,6),           & 
& ZcplAhSdcHpmcSu(3,6,2,6),ZcplAhSeSvImcHpm(3,6,6,2),ZcplAhSeSvRecHpm(3,6,6,2),          & 
& Zcplhhhhhhhh(3,3,3,3),ZcplhhhhHpmcHpm(3,3,2,2),ZcplhhhhSdcSd(3,3,6,6),ZcplhhhhSecSe(3,3,6,6),& 
& ZcplhhhhSucSu(3,3,6,6),ZcplhhhhSvImSvIm(3,3,6,6),ZcplhhhhSvImSvRe(3,3,6,6),            & 
& ZcplhhhhSvReSvRe(3,3,6,6),ZcplhhHpmSucSd(3,2,6,6),ZcplhhHpmSvImcSe(3,2,6,6),           & 
& ZcplhhHpmSvRecSe(3,2,6,6),ZcplhhSdcHpmcSu(3,6,2,6),ZcplhhSeSvImcHpm(3,6,6,2),          & 
& ZcplhhSeSvRecHpm(3,6,6,2),ZcplHpmHpmcHpmcHpm(2,2,2,2),ZcplHpmSdcHpmcSd(2,6,2,6),       & 
& ZcplHpmSecHpmcSe(2,6,2,6),ZcplHpmSucHpmcSu(2,6,2,6),ZcplHpmSvImSvImcHpm(2,6,6,2),      & 
& ZcplHpmSvImSvRecHpm(2,6,6,2),ZcplHpmSvReSvRecHpm(2,6,6,2),ZcplSdSdcSdcSd(6,6,6,6),     & 
& ZcplSdSecSdcSe(6,6,6,6),ZcplSdSucSdcSu(6,6,6,6),ZcplSdSvImSvImcSd(6,6,6,6),            & 
& ZcplSdSvImcSecSu(6,6,6,6),ZcplSdSvReSvRecSd(6,6,6,6),ZcplSdSvRecSecSu(6,6,6,6),        & 
& ZcplSeSecSecSe(6,6,6,6),ZcplSeSuSvImcSd(6,6,6,6),ZcplSeSuSvRecSd(6,6,6,6),             & 
& ZcplSeSucSecSu(6,6,6,6),ZcplSeSvImSvImcSe(6,6,6,6),ZcplSeSvImSvRecSe(6,6,6,6),         & 
& ZcplSeSvReSvRecSe(6,6,6,6),ZcplSuSucSucSu(6,6,6,6),ZcplSuSvImSvImcSu(6,6,6,6),         & 
& ZcplSuSvImSvRecSu(6,6,6,6),ZcplSuSvReSvRecSu(6,6,6,6),ZcplSvImSvImSvImSvIm(6,6,6,6),   & 
& ZcplSvImSvImSvImSvRe(6,6,6,6),ZcplSvImSvImSvReSvRe(6,6,6,6),ZcplSvImSvReSvReSvRe(6,6,6,6),& 
& ZcplSvReSvReSvReSvRe(6,6,6,6),ZcplAhhhVZ(3,3),ZcplAhHpmcVWm(3,2),ZcplAhcHpmVWm(3,2),   & 
& ZcplhhHpmcVWm(3,2),ZcplhhcHpmVWm(3,2),ZcplHpmcHpmVP(2,2),ZcplHpmcHpmVZ(2,2),           & 
& ZcplSdcSdVG(6,6),ZcplSdcSdVP(6,6),ZcplSdcSdVZ(6,6),ZcplSdcSucVWm(6,6),ZcplSeSvImcVWm(6,6),& 
& ZcplSeSvRecVWm(6,6),ZcplSecSeVP(6,6),ZcplSecSeVZ(6,6),ZcplSucSuVG(6,6),ZcplSucSuVP(6,6),& 
& ZcplSucSdVWm(6,6),ZcplSucSuVZ(6,6),ZcplSvImSvReVZ(6,6),ZcplSvImcSeVWm(6,6),            & 
& ZcplSvRecSeVWm(6,6),ZcplhhcVWmVWm(3),ZcplhhVZVZ(3),ZcplHpmcVWmVP(2),ZcplHpmcVWmVZ(2),  & 
& ZcplcHpmVPVWm(2),ZcplcHpmVWmVZ(2),ZcplAhAhcVWmVWm(3,3),ZcplAhAhVZVZ(3,3),              & 
& ZcplAhHpmcVWmVP(3,2),ZcplAhHpmcVWmVZ(3,2),ZcplAhcHpmVPVWm(3,2),ZcplAhcHpmVWmVZ(3,2),   & 
& ZcplhhhhcVWmVWm(3,3),ZcplhhhhVZVZ(3,3),ZcplhhHpmcVWmVP(3,2),ZcplhhHpmcVWmVZ(3,2),      & 
& ZcplhhcHpmVPVWm(3,2),ZcplhhcHpmVWmVZ(3,2),ZcplHpmcHpmVPVP(2,2),ZcplHpmcHpmVPVZ(2,2)

Complex(dp), Intent(out) :: ZcplHpmcHpmcVWmVWm(2,2),ZcplHpmcHpmVZVZ(2,2),ZcplSdcSdVGVG(6,6),ZcplSdcSdVGVP(6,6),    & 
& ZcplSdcSdVGVZ(6,6),ZcplSdcSucVWmVG(6,6),ZcplSdcSdVPVP(6,6),ZcplSdcSdVPVZ(6,6),         & 
& ZcplSdcSucVWmVP(6,6),ZcplSdcSdcVWmVWm(6,6),ZcplSdcSdVZVZ(6,6),ZcplSdcSucVWmVZ(6,6),    & 
& ZcplSeSvImcVWmVP(6,6),ZcplSeSvImcVWmVZ(6,6),ZcplSeSvRecVWmVP(6,6),ZcplSeSvRecVWmVZ(6,6),& 
& ZcplSecSeVPVP(6,6),ZcplSecSeVPVZ(6,6),ZcplSecSecVWmVWm(6,6),ZcplSecSeVZVZ(6,6),        & 
& ZcplSucSuVGVG(6,6),ZcplSucSuVGVP(6,6),ZcplSucSdVGVWm(6,6),ZcplSucSuVGVZ(6,6),          & 
& ZcplSucSuVPVP(6,6),ZcplSucSdVPVWm(6,6),ZcplSucSuVPVZ(6,6),ZcplSucSdVWmVZ(6,6),         & 
& ZcplSucSucVWmVWm(6,6),ZcplSucSuVZVZ(6,6),ZcplSvImSvImcVWmVWm(6,6),ZcplSvImSvImVZVZ(6,6),& 
& ZcplSvImcSeVPVWm(6,6),ZcplSvImcSeVWmVZ(6,6),ZcplSvReSvRecVWmVWm(6,6),ZcplSvReSvReVZVZ(6,6),& 
& ZcplSvRecSeVPVWm(6,6),ZcplSvRecSeVWmVZ(6,6),ZcplVGVGVG,ZcplcVWmVPVWm,ZcplcVWmVWmVZ,    & 
& ZcplcChaChaAhL(2,2,3),ZcplcChaChaAhR(2,2,3),ZcplChiChiAhL(5,5,3),ZcplChiChiAhR(5,5,3), & 
& ZcplcFdFdAhL(3,3,3),ZcplcFdFdAhR(3,3,3),ZcplcFeFeAhL(3,3,3),ZcplcFeFeAhR(3,3,3),       & 
& ZcplcFuFuAhL(3,3,3),ZcplcFuFuAhR(3,3,3),ZcplFvFvAhL(6,6,3),ZcplFvFvAhR(6,6,3),         & 
& ZcplChiChacHpmL(5,2,2),ZcplChiChacHpmR(5,2,2),ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),& 
& ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),ZcplcChaChahhL(2,2,3),ZcplcChaChahhR(2,2,3), & 
& ZcplcFdChaSuL(3,2,6),ZcplcFdChaSuR(3,2,6),ZcplcFeChaSvImL(3,2,6),ZcplcFeChaSvImR(3,2,6),& 
& ZcplcFeChaSvReL(3,2,6),ZcplcFeChaSvReR(3,2,6),ZcplChiChihhL(5,5,3),ZcplChiChihhR(5,5,3),& 
& ZcplChiFdcSdL(5,3,6),ZcplChiFdcSdR(5,3,6),ZcplChiFecSeL(5,3,6),ZcplChiFecSeR(5,3,6),   & 
& ZcplChiFucSuL(5,3,6),ZcplChiFucSuR(5,3,6),ZcplChiFvSvImL(5,6,6),ZcplChiFvSvImR(5,6,6), & 
& ZcplChiFvSvReL(5,6,6),ZcplChiFvSvReR(5,6,6),ZcplcChaChiHpmL(2,5,2),ZcplcChaChiHpmR(2,5,2),& 
& ZcplcFdChiSdL(3,5,6),ZcplcFdChiSdR(3,5,6),ZcplcFeChiSeL(3,5,6),ZcplcFeChiSeR(3,5,6),   & 
& ZcplcFuChiSuL(3,5,6),ZcplcFuChiSuR(3,5,6),ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),       & 
& ZcplcFdFdhhL(3,3,3),ZcplcFdFdhhR(3,3,3),ZcplcChaFdcSuL(2,3,6),ZcplcChaFdcSuR(2,3,6),   & 
& ZcplcFuFdcHpmL(3,3,2),ZcplcFuFdcHpmR(3,3,2),ZcplFvFecHpmL(6,3,2),ZcplFvFecHpmR(6,3,2), & 
& ZcplcFeFehhL(3,3,3),ZcplcFeFehhR(3,3,3),ZcplcChaFeSvImL(2,3,6),ZcplcChaFeSvImR(2,3,6), & 
& ZcplcChaFeSvReL(2,3,6),ZcplcChaFeSvReR(2,3,6),ZcplGluFucSuL(3,6),ZcplGluFucSuR(3,6),   & 
& ZcplcFuFuhhL(3,3,3),ZcplcFuFuhhR(3,3,3),ZcplcFdFuHpmL(3,3,2),ZcplcFdFuHpmR(3,3,2),     & 
& ZcplFvFvhhL(6,6,3),ZcplFvFvhhR(6,6,3),ZcplcFeFvHpmL(3,6,2),ZcplcFeFvHpmR(3,6,2),       & 
& ZcplcChaFvSeL(2,6,6),ZcplcChaFvSeR(2,6,6),ZcplcFdGluSdL(3,6),ZcplcFdGluSdR(3,6),       & 
& ZcplcFuGluSuL(3,6),ZcplcFuGluSuR(3,6),ZcplcChacFuSdL(2,3,6),ZcplcChacFuSdR(2,3,6),     & 
& ZcplChiChacVWmL(5,2),ZcplChiChacVWmR(5,2),ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),     & 
& ZcplcChaChaVZL(2,2),ZcplcChaChaVZR(2,2),ZcplChiChiVZL(5,5),ZcplChiChiVZR(5,5),         & 
& ZcplcChaChiVWmL(2,5),ZcplcChaChiVWmR(2,5),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),         & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),               & 
& ZcplcFuFdcVWmL(3,3),ZcplcFuFdcVWmR(3,3),ZcplFvFecVWmL(6,3),ZcplFvFecVWmR(6,3),         & 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),               & 
& ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3)

Complex(dp), Intent(out) :: ZcplcFdFuVWmL(3,3),ZcplcFdFuVWmR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),             & 
& ZcplFvFvVZL(6,6),ZcplFvFvVZR(6,6),ZcplcFeFvVWmL(3,6),ZcplcFeFvVWmR(3,6),               & 
& ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,& 
& ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,  & 
& ZcplcVWmcVWmVWmVWm1,ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,          & 
& ZcplcVWmVWmVZVZ2,ZcplcVWmVWmVZVZ3,ZcplcgGgGVG,ZcplcgWmgAVWm,ZcplcgWpCgAcVWm,           & 
& ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgAgWmcVWm,ZcplcgZgWmcVWm,ZcplcgWpCgWpCVP,             & 
& ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,ZcplcgWpCgWpCVZ,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,           & 
& ZcplcgWmgWmAh(3),ZcplcgWpCgWpCAh(3),ZcplcgZgAhh(3),ZcplcgWmgAHpm(2),ZcplcgWpCgAcHpm(2),& 
& ZcplcgWmgWmhh(3),ZcplcgZgWmcHpm(2),ZcplcgWpCgWpChh(3),ZcplcgZgWpCHpm(2),               & 
& ZcplcgZgZhh(3),ZcplcgWmgZHpm(2),ZcplcgWpCgZcHpm(2)

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


 ! ## ZcplAhAhAh ## 
ZcplAhAhAh = 0._dp 
TempcplAhAhAh = cplAhAhAh 
Do gt1=1,3
  Do gt2=1,3
ZcplAhAhAh(gt2,:,:) = ZcplAhAhAh(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhAhAh(gt1,:,:) 
 End Do 
End Do 
TempcplAhAhAh = ZcplAhAhAh 
ZcplAhAhAh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhAhAh(:,gt2,:) = ZcplAhAhAh(:,gt2,:) + ZRUZA(gt2,gt1)*TempcplAhAhAh(:,gt1,:) 
 End Do 
End Do 
TempcplAhAhAh = ZcplAhAhAh 
ZcplAhAhAh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhAhAh(:,:,gt2) = ZcplAhAhAh(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplAhAhAh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhAhhh ## 
ZcplAhAhhh = 0._dp 
TempcplAhAhhh = cplAhAhhh 
Do gt1=1,3
  Do gt2=1,3
ZcplAhAhhh(gt2,:,:) = ZcplAhAhhh(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhAhhh(gt1,:,:) 
 End Do 
End Do 
TempcplAhAhhh = ZcplAhAhhh 
ZcplAhAhhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhAhhh(:,gt2,:) = ZcplAhAhhh(:,gt2,:) + ZRUZA(gt2,gt1)*TempcplAhAhhh(:,gt1,:) 
 End Do 
End Do 
TempcplAhAhhh = ZcplAhAhhh 
ZcplAhAhhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhAhhh(:,:,gt2) = ZcplAhAhhh(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplAhAhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhhhhh ## 
ZcplAhhhhh = 0._dp 
TempcplAhhhhh = cplAhhhhh 
Do gt1=1,3
  Do gt2=1,3
ZcplAhhhhh(gt2,:,:) = ZcplAhhhhh(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhhhhh(gt1,:,:) 
 End Do 
End Do 
TempcplAhhhhh = ZcplAhhhhh 
ZcplAhhhhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhhhhh(:,gt2,:) = ZcplAhhhhh(:,gt2,:) + ZRUZH(gt2,gt1)*TempcplAhhhhh(:,gt1,:) 
 End Do 
End Do 
TempcplAhhhhh = ZcplAhhhhh 
ZcplAhhhhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhhhhh(:,:,gt2) = ZcplAhhhhh(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplAhhhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhHpmcHpm ## 
ZcplAhHpmcHpm = 0._dp 
TempcplAhHpmcHpm = cplAhHpmcHpm 
Do gt1=1,3
  Do gt2=1,3
ZcplAhHpmcHpm(gt2,:,:) = ZcplAhHpmcHpm(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhHpmcHpm(gt1,:,:) 
 End Do 
End Do 
TempcplAhHpmcHpm = ZcplAhHpmcHpm 
ZcplAhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhHpmcHpm(:,gt2,:) = ZcplAhHpmcHpm(:,gt2,:) + ZRUZP(gt2,gt1)*TempcplAhHpmcHpm(:,gt1,:) 
 End Do 
End Do 
TempcplAhHpmcHpm = ZcplAhHpmcHpm 
ZcplAhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhHpmcHpm(:,:,gt2) = ZcplAhHpmcHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplAhHpmcHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSdcSd ## 
ZcplAhSdcSd = 0._dp 
TempcplAhSdcSd = cplAhSdcSd 
Do gt1=1,3
  Do gt2=1,3
ZcplAhSdcSd(gt2,:,:) = ZcplAhSdcSd(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSdcSd(gt1,:,:) 
 End Do 
End Do 
TempcplAhSdcSd = ZcplAhSdcSd 
ZcplAhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSdcSd(:,gt2,:) = ZcplAhSdcSd(:,gt2,:) + ZRUZD(gt2,gt1)*TempcplAhSdcSd(:,gt1,:) 
 End Do 
End Do 
TempcplAhSdcSd = ZcplAhSdcSd 
ZcplAhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSdcSd(:,:,gt2) = ZcplAhSdcSd(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplAhSdcSd(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSecSe ## 
ZcplAhSecSe = 0._dp 
TempcplAhSecSe = cplAhSecSe 
Do gt1=1,3
  Do gt2=1,3
ZcplAhSecSe(gt2,:,:) = ZcplAhSecSe(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSecSe(gt1,:,:) 
 End Do 
End Do 
TempcplAhSecSe = ZcplAhSecSe 
ZcplAhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSecSe(:,gt2,:) = ZcplAhSecSe(:,gt2,:) + ZRUZE(gt2,gt1)*TempcplAhSecSe(:,gt1,:) 
 End Do 
End Do 
TempcplAhSecSe = ZcplAhSecSe 
ZcplAhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSecSe(:,:,gt2) = ZcplAhSecSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplAhSecSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSucSu ## 
ZcplAhSucSu = 0._dp 
TempcplAhSucSu = cplAhSucSu 
Do gt1=1,3
  Do gt2=1,3
ZcplAhSucSu(gt2,:,:) = ZcplAhSucSu(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSucSu(gt1,:,:) 
 End Do 
End Do 
TempcplAhSucSu = ZcplAhSucSu 
ZcplAhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSucSu(:,gt2,:) = ZcplAhSucSu(:,gt2,:) + ZRUZU(gt2,gt1)*TempcplAhSucSu(:,gt1,:) 
 End Do 
End Do 
TempcplAhSucSu = ZcplAhSucSu 
ZcplAhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSucSu(:,:,gt2) = ZcplAhSucSu(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplAhSucSu(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSvImSvIm ## 
ZcplAhSvImSvIm = 0._dp 
TempcplAhSvImSvIm = cplAhSvImSvIm 
Do gt1=1,3
  Do gt2=1,3
ZcplAhSvImSvIm(gt2,:,:) = ZcplAhSvImSvIm(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSvImSvIm(gt1,:,:) 
 End Do 
End Do 
TempcplAhSvImSvIm = ZcplAhSvImSvIm 
ZcplAhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvIm(:,gt2,:) = ZcplAhSvImSvIm(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplAhSvImSvIm(:,gt1,:) 
 End Do 
End Do 
TempcplAhSvImSvIm = ZcplAhSvImSvIm 
ZcplAhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvIm(:,:,gt2) = ZcplAhSvImSvIm(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplAhSvImSvIm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSvImSvRe ## 
ZcplAhSvImSvRe = 0._dp 
TempcplAhSvImSvRe = cplAhSvImSvRe 
Do gt1=1,3
  Do gt2=1,3
ZcplAhSvImSvRe(gt2,:,:) = ZcplAhSvImSvRe(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSvImSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplAhSvImSvRe = ZcplAhSvImSvRe 
ZcplAhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvRe(:,gt2,:) = ZcplAhSvImSvRe(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplAhSvImSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplAhSvImSvRe = ZcplAhSvImSvRe 
ZcplAhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvImSvRe(:,:,gt2) = ZcplAhSvImSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplAhSvImSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhSvReSvRe ## 
ZcplAhSvReSvRe = 0._dp 
TempcplAhSvReSvRe = cplAhSvReSvRe 
Do gt1=1,3
  Do gt2=1,3
ZcplAhSvReSvRe(gt2,:,:) = ZcplAhSvReSvRe(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhSvReSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplAhSvReSvRe = ZcplAhSvReSvRe 
ZcplAhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvReSvRe(:,gt2,:) = ZcplAhSvReSvRe(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplAhSvReSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplAhSvReSvRe = ZcplAhSvReSvRe 
ZcplAhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplAhSvReSvRe(:,:,gt2) = ZcplAhSvReSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplAhSvReSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## Zcplhhhhhh ## 
Zcplhhhhhh = 0._dp 
Tempcplhhhhhh = cplhhhhhh 
Do gt1=1,3
  Do gt2=1,3
Zcplhhhhhh(gt2,:,:) = Zcplhhhhhh(gt2,:,:) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(gt1,:,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
Zcplhhhhhh(:,gt2,:) = Zcplhhhhhh(:,gt2,:) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(:,gt1,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
Zcplhhhhhh(:,:,gt2) = Zcplhhhhhh(:,:,gt2) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhHpmcHpm ## 
ZcplhhHpmcHpm = 0._dp 
TempcplhhHpmcHpm = cplhhHpmcHpm 
Do gt1=1,3
  Do gt2=1,3
ZcplhhHpmcHpm(gt2,:,:) = ZcplhhHpmcHpm(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhHpmcHpm(gt1,:,:) 
 End Do 
End Do 
TempcplhhHpmcHpm = ZcplhhHpmcHpm 
ZcplhhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpmcHpm(:,gt2,:) = ZcplhhHpmcHpm(:,gt2,:) + ZRUZP(gt2,gt1)*TempcplhhHpmcHpm(:,gt1,:) 
 End Do 
End Do 
TempcplhhHpmcHpm = ZcplhhHpmcHpm 
ZcplhhHpmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpmcHpm(:,:,gt2) = ZcplhhHpmcHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplhhHpmcHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSdcSd ## 
ZcplhhSdcSd = 0._dp 
TempcplhhSdcSd = cplhhSdcSd 
Do gt1=1,3
  Do gt2=1,3
ZcplhhSdcSd(gt2,:,:) = ZcplhhSdcSd(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSdcSd(gt1,:,:) 
 End Do 
End Do 
TempcplhhSdcSd = ZcplhhSdcSd 
ZcplhhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSdcSd(:,gt2,:) = ZcplhhSdcSd(:,gt2,:) + ZRUZD(gt2,gt1)*TempcplhhSdcSd(:,gt1,:) 
 End Do 
End Do 
TempcplhhSdcSd = ZcplhhSdcSd 
ZcplhhSdcSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSdcSd(:,:,gt2) = ZcplhhSdcSd(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplhhSdcSd(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSecSe ## 
ZcplhhSecSe = 0._dp 
TempcplhhSecSe = cplhhSecSe 
Do gt1=1,3
  Do gt2=1,3
ZcplhhSecSe(gt2,:,:) = ZcplhhSecSe(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSecSe(gt1,:,:) 
 End Do 
End Do 
TempcplhhSecSe = ZcplhhSecSe 
ZcplhhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSecSe(:,gt2,:) = ZcplhhSecSe(:,gt2,:) + ZRUZE(gt2,gt1)*TempcplhhSecSe(:,gt1,:) 
 End Do 
End Do 
TempcplhhSecSe = ZcplhhSecSe 
ZcplhhSecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSecSe(:,:,gt2) = ZcplhhSecSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplhhSecSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSucSu ## 
ZcplhhSucSu = 0._dp 
TempcplhhSucSu = cplhhSucSu 
Do gt1=1,3
  Do gt2=1,3
ZcplhhSucSu(gt2,:,:) = ZcplhhSucSu(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSucSu(gt1,:,:) 
 End Do 
End Do 
TempcplhhSucSu = ZcplhhSucSu 
ZcplhhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSucSu(:,gt2,:) = ZcplhhSucSu(:,gt2,:) + ZRUZU(gt2,gt1)*TempcplhhSucSu(:,gt1,:) 
 End Do 
End Do 
TempcplhhSucSu = ZcplhhSucSu 
ZcplhhSucSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSucSu(:,:,gt2) = ZcplhhSucSu(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplhhSucSu(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSvImSvIm ## 
ZcplhhSvImSvIm = 0._dp 
TempcplhhSvImSvIm = cplhhSvImSvIm 
Do gt1=1,3
  Do gt2=1,3
ZcplhhSvImSvIm(gt2,:,:) = ZcplhhSvImSvIm(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSvImSvIm(gt1,:,:) 
 End Do 
End Do 
TempcplhhSvImSvIm = ZcplhhSvImSvIm 
ZcplhhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvIm(:,gt2,:) = ZcplhhSvImSvIm(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplhhSvImSvIm(:,gt1,:) 
 End Do 
End Do 
TempcplhhSvImSvIm = ZcplhhSvImSvIm 
ZcplhhSvImSvIm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvIm(:,:,gt2) = ZcplhhSvImSvIm(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplhhSvImSvIm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSvImSvRe ## 
ZcplhhSvImSvRe = 0._dp 
TempcplhhSvImSvRe = cplhhSvImSvRe 
Do gt1=1,3
  Do gt2=1,3
ZcplhhSvImSvRe(gt2,:,:) = ZcplhhSvImSvRe(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSvImSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplhhSvImSvRe = ZcplhhSvImSvRe 
ZcplhhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvRe(:,gt2,:) = ZcplhhSvImSvRe(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplhhSvImSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplhhSvImSvRe = ZcplhhSvImSvRe 
ZcplhhSvImSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvImSvRe(:,:,gt2) = ZcplhhSvImSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplhhSvImSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhSvReSvRe ## 
ZcplhhSvReSvRe = 0._dp 
TempcplhhSvReSvRe = cplhhSvReSvRe 
Do gt1=1,3
  Do gt2=1,3
ZcplhhSvReSvRe(gt2,:,:) = ZcplhhSvReSvRe(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhSvReSvRe(gt1,:,:) 
 End Do 
End Do 
TempcplhhSvReSvRe = ZcplhhSvReSvRe 
ZcplhhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvReSvRe(:,gt2,:) = ZcplhhSvReSvRe(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplhhSvReSvRe(:,gt1,:) 
 End Do 
End Do 
TempcplhhSvReSvRe = ZcplhhSvReSvRe 
ZcplhhSvReSvRe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplhhSvReSvRe(:,:,gt2) = ZcplhhSvReSvRe(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplhhSvReSvRe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplHpmSucSd ## 
ZcplHpmSucSd = 0._dp 
TempcplHpmSucSd = cplHpmSucSd 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmSucSd(gt2,:,:) = ZcplHpmSucSd(gt2,:,:) + ZRUZP(gt2,gt1)*TempcplHpmSucSd(gt1,:,:) 
 End Do 
End Do 
TempcplHpmSucSd = ZcplHpmSucSd 
ZcplHpmSucSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSucSd(:,gt2,:) = ZcplHpmSucSd(:,gt2,:) + ZRUZU(gt2,gt1)*TempcplHpmSucSd(:,gt1,:) 
 End Do 
End Do 
TempcplHpmSucSd = ZcplHpmSucSd 
ZcplHpmSucSd = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSucSd(:,:,gt2) = ZcplHpmSucSd(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplHpmSucSd(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplHpmSvImcSe ## 
ZcplHpmSvImcSe = 0._dp 
TempcplHpmSvImcSe = cplHpmSvImcSe 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmSvImcSe(gt2,:,:) = ZcplHpmSvImcSe(gt2,:,:) + ZRUZP(gt2,gt1)*TempcplHpmSvImcSe(gt1,:,:) 
 End Do 
End Do 
TempcplHpmSvImcSe = ZcplHpmSvImcSe 
ZcplHpmSvImcSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvImcSe(:,gt2,:) = ZcplHpmSvImcSe(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplHpmSvImcSe(:,gt1,:) 
 End Do 
End Do 
TempcplHpmSvImcSe = ZcplHpmSvImcSe 
ZcplHpmSvImcSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvImcSe(:,:,gt2) = ZcplHpmSvImcSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplHpmSvImcSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplHpmSvRecSe ## 
ZcplHpmSvRecSe = 0._dp 
TempcplHpmSvRecSe = cplHpmSvRecSe 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmSvRecSe(gt2,:,:) = ZcplHpmSvRecSe(gt2,:,:) + ZRUZP(gt2,gt1)*TempcplHpmSvRecSe(gt1,:,:) 
 End Do 
End Do 
TempcplHpmSvRecSe = ZcplHpmSvRecSe 
ZcplHpmSvRecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvRecSe(:,gt2,:) = ZcplHpmSvRecSe(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplHpmSvRecSe(:,gt1,:) 
 End Do 
End Do 
TempcplHpmSvRecSe = ZcplHpmSvRecSe 
ZcplHpmSvRecSe = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplHpmSvRecSe(:,:,gt2) = ZcplHpmSvRecSe(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplHpmSvRecSe(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplSdcHpmcSu ## 
ZcplSdcHpmcSu = 0._dp 
TempcplSdcHpmcSu = cplSdcHpmcSu 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcHpmcSu(gt2,:,:) = ZcplSdcHpmcSu(gt2,:,:) + ZRUZD(gt2,gt1)*TempcplSdcHpmcSu(gt1,:,:) 
 End Do 
End Do 
TempcplSdcHpmcSu = ZcplSdcHpmcSu 
ZcplSdcHpmcSu = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplSdcHpmcSu(:,gt2,:) = ZcplSdcHpmcSu(:,gt2,:) + ZRUZP(gt2,gt1)*TempcplSdcHpmcSu(:,gt1,:) 
 End Do 
End Do 
TempcplSdcHpmcSu = ZcplSdcHpmcSu 
ZcplSdcHpmcSu = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcHpmcSu(:,:,gt2) = ZcplSdcHpmcSu(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplSdcHpmcSu(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplSeSvImcHpm ## 
ZcplSeSvImcHpm = 0._dp 
TempcplSeSvImcHpm = cplSeSvImcHpm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcHpm(gt2,:,:) = ZcplSeSvImcHpm(gt2,:,:) + ZRUZE(gt2,gt1)*TempcplSeSvImcHpm(gt1,:,:) 
 End Do 
End Do 
TempcplSeSvImcHpm = ZcplSeSvImcHpm 
ZcplSeSvImcHpm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcHpm(:,gt2,:) = ZcplSeSvImcHpm(:,gt2,:) + ZRUZVI(gt2,gt1)*TempcplSeSvImcHpm(:,gt1,:) 
 End Do 
End Do 
TempcplSeSvImcHpm = ZcplSeSvImcHpm 
ZcplSeSvImcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplSeSvImcHpm(:,:,gt2) = ZcplSeSvImcHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplSeSvImcHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplSeSvRecHpm ## 
ZcplSeSvRecHpm = 0._dp 
TempcplSeSvRecHpm = cplSeSvRecHpm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecHpm(gt2,:,:) = ZcplSeSvRecHpm(gt2,:,:) + ZRUZE(gt2,gt1)*TempcplSeSvRecHpm(gt1,:,:) 
 End Do 
End Do 
TempcplSeSvRecHpm = ZcplSeSvRecHpm 
ZcplSeSvRecHpm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecHpm(:,gt2,:) = ZcplSeSvRecHpm(:,gt2,:) + ZRUZVR(gt2,gt1)*TempcplSeSvRecHpm(:,gt1,:) 
 End Do 
End Do 
TempcplSeSvRecHpm = ZcplSeSvRecHpm 
ZcplSeSvRecHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplSeSvRecHpm(:,:,gt2) = ZcplSeSvRecHpm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplSeSvRecHpm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhAhAhAh ## 
ZcplAhAhAhAh = 0._dp 


 ! ## ZcplAhAhAhhh ## 
ZcplAhAhAhhh = 0._dp 


 ! ## ZcplAhAhhhhh ## 
ZcplAhAhhhhh = 0._dp 


 ! ## ZcplAhAhHpmcHpm ## 
ZcplAhAhHpmcHpm = 0._dp 


 ! ## ZcplAhAhSdcSd ## 
ZcplAhAhSdcSd = 0._dp 


 ! ## ZcplAhAhSecSe ## 
ZcplAhAhSecSe = 0._dp 


 ! ## ZcplAhAhSucSu ## 
ZcplAhAhSucSu = 0._dp 


 ! ## ZcplAhAhSvImSvIm ## 
ZcplAhAhSvImSvIm = 0._dp 


 ! ## ZcplAhAhSvImSvRe ## 
ZcplAhAhSvImSvRe = 0._dp 


 ! ## ZcplAhAhSvReSvRe ## 
ZcplAhAhSvReSvRe = 0._dp 


 ! ## ZcplAhhhhhhh ## 
ZcplAhhhhhhh = 0._dp 


 ! ## ZcplAhhhHpmcHpm ## 
ZcplAhhhHpmcHpm = 0._dp 


 ! ## ZcplAhhhSdcSd ## 
ZcplAhhhSdcSd = 0._dp 


 ! ## ZcplAhhhSecSe ## 
ZcplAhhhSecSe = 0._dp 


 ! ## ZcplAhhhSucSu ## 
ZcplAhhhSucSu = 0._dp 


 ! ## ZcplAhhhSvImSvIm ## 
ZcplAhhhSvImSvIm = 0._dp 


 ! ## ZcplAhhhSvImSvRe ## 
ZcplAhhhSvImSvRe = 0._dp 


 ! ## ZcplAhhhSvReSvRe ## 
ZcplAhhhSvReSvRe = 0._dp 


 ! ## ZcplAhHpmSucSd ## 
ZcplAhHpmSucSd = 0._dp 


 ! ## ZcplAhHpmSvImcSe ## 
ZcplAhHpmSvImcSe = 0._dp 


 ! ## ZcplAhHpmSvRecSe ## 
ZcplAhHpmSvRecSe = 0._dp 


 ! ## ZcplAhSdcHpmcSu ## 
ZcplAhSdcHpmcSu = 0._dp 


 ! ## ZcplAhSeSvImcHpm ## 
ZcplAhSeSvImcHpm = 0._dp 


 ! ## ZcplAhSeSvRecHpm ## 
ZcplAhSeSvRecHpm = 0._dp 


 ! ## Zcplhhhhhhhh ## 
Zcplhhhhhhhh = 0._dp 


 ! ## ZcplhhhhHpmcHpm ## 
ZcplhhhhHpmcHpm = 0._dp 


 ! ## ZcplhhhhSdcSd ## 
ZcplhhhhSdcSd = 0._dp 


 ! ## ZcplhhhhSecSe ## 
ZcplhhhhSecSe = 0._dp 


 ! ## ZcplhhhhSucSu ## 
ZcplhhhhSucSu = 0._dp 


 ! ## ZcplhhhhSvImSvIm ## 
ZcplhhhhSvImSvIm = 0._dp 


 ! ## ZcplhhhhSvImSvRe ## 
ZcplhhhhSvImSvRe = 0._dp 


 ! ## ZcplhhhhSvReSvRe ## 
ZcplhhhhSvReSvRe = 0._dp 


 ! ## ZcplhhHpmSucSd ## 
ZcplhhHpmSucSd = 0._dp 


 ! ## ZcplhhHpmSvImcSe ## 
ZcplhhHpmSvImcSe = 0._dp 


 ! ## ZcplhhHpmSvRecSe ## 
ZcplhhHpmSvRecSe = 0._dp 


 ! ## ZcplhhSdcHpmcSu ## 
ZcplhhSdcHpmcSu = 0._dp 


 ! ## ZcplhhSeSvImcHpm ## 
ZcplhhSeSvImcHpm = 0._dp 


 ! ## ZcplhhSeSvRecHpm ## 
ZcplhhSeSvRecHpm = 0._dp 


 ! ## ZcplHpmHpmcHpmcHpm ## 
ZcplHpmHpmcHpmcHpm = 0._dp 


 ! ## ZcplHpmSdcHpmcSd ## 
ZcplHpmSdcHpmcSd = 0._dp 


 ! ## ZcplHpmSecHpmcSe ## 
ZcplHpmSecHpmcSe = 0._dp 


 ! ## ZcplHpmSucHpmcSu ## 
ZcplHpmSucHpmcSu = 0._dp 


 ! ## ZcplHpmSvImSvImcHpm ## 
ZcplHpmSvImSvImcHpm = 0._dp 


 ! ## ZcplHpmSvImSvRecHpm ## 
ZcplHpmSvImSvRecHpm = 0._dp 


 ! ## ZcplHpmSvReSvRecHpm ## 
ZcplHpmSvReSvRecHpm = 0._dp 


 ! ## ZcplSdSdcSdcSd ## 
ZcplSdSdcSdcSd = 0._dp 


 ! ## ZcplSdSecSdcSe ## 
ZcplSdSecSdcSe = 0._dp 


 ! ## ZcplSdSucSdcSu ## 
ZcplSdSucSdcSu = 0._dp 


 ! ## ZcplSdSvImSvImcSd ## 
ZcplSdSvImSvImcSd = 0._dp 


 ! ## ZcplSdSvImcSecSu ## 
ZcplSdSvImcSecSu = 0._dp 


 ! ## ZcplSdSvReSvRecSd ## 
ZcplSdSvReSvRecSd = 0._dp 


 ! ## ZcplSdSvRecSecSu ## 
ZcplSdSvRecSecSu = 0._dp 


 ! ## ZcplSeSecSecSe ## 
ZcplSeSecSecSe = 0._dp 


 ! ## ZcplSeSuSvImcSd ## 
ZcplSeSuSvImcSd = 0._dp 


 ! ## ZcplSeSuSvRecSd ## 
ZcplSeSuSvRecSd = 0._dp 


 ! ## ZcplSeSucSecSu ## 
ZcplSeSucSecSu = 0._dp 


 ! ## ZcplSeSvImSvImcSe ## 
ZcplSeSvImSvImcSe = 0._dp 


 ! ## ZcplSeSvImSvRecSe ## 
ZcplSeSvImSvRecSe = 0._dp 


 ! ## ZcplSeSvReSvRecSe ## 
ZcplSeSvReSvRecSe = 0._dp 


 ! ## ZcplSuSucSucSu ## 
ZcplSuSucSucSu = 0._dp 


 ! ## ZcplSuSvImSvImcSu ## 
ZcplSuSvImSvImcSu = 0._dp 


 ! ## ZcplSuSvImSvRecSu ## 
ZcplSuSvImSvRecSu = 0._dp 


 ! ## ZcplSuSvReSvRecSu ## 
ZcplSuSvReSvRecSu = 0._dp 


 ! ## ZcplSvImSvImSvImSvIm ## 
ZcplSvImSvImSvImSvIm = 0._dp 


 ! ## ZcplSvImSvImSvImSvRe ## 
ZcplSvImSvImSvImSvRe = 0._dp 


 ! ## ZcplSvImSvImSvReSvRe ## 
ZcplSvImSvImSvReSvRe = 0._dp 


 ! ## ZcplSvImSvReSvReSvRe ## 
ZcplSvImSvReSvReSvRe = 0._dp 


 ! ## ZcplSvReSvReSvReSvRe ## 
ZcplSvReSvReSvReSvRe = 0._dp 


 ! ## ZcplAhhhVZ ## 
ZcplAhhhVZ = 0._dp 
TempcplAhhhVZ = cplAhhhVZ 
Do gt1=1,3
  Do gt2=1,3
ZcplAhhhVZ(gt2,:) = ZcplAhhhVZ(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhhhVZ(gt1,:) 
 End Do 
End Do 
TempcplAhhhVZ = ZcplAhhhVZ 
ZcplAhhhVZ = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhhhVZ(:,gt2) = ZcplAhhhVZ(:,gt2) + ZRUZH(gt2,gt1)*TempcplAhhhVZ(:,gt1) 
 End Do 
End Do 
TempcplAhhhVZ = ZcplAhhhVZ 


 ! ## ZcplAhHpmcVWm ## 
ZcplAhHpmcVWm = 0._dp 
TempcplAhHpmcVWm = cplAhHpmcVWm 
Do gt1=1,3
  Do gt2=1,3
ZcplAhHpmcVWm(gt2,:) = ZcplAhHpmcVWm(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhHpmcVWm(gt1,:) 
 End Do 
End Do 
TempcplAhHpmcVWm = ZcplAhHpmcVWm 
ZcplAhHpmcVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhHpmcVWm(:,gt2) = ZcplAhHpmcVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplAhHpmcVWm(:,gt1) 
 End Do 
End Do 
TempcplAhHpmcVWm = ZcplAhHpmcVWm 


 ! ## ZcplAhcHpmVWm ## 
ZcplAhcHpmVWm = 0._dp 
TempcplAhcHpmVWm = cplAhcHpmVWm 
Do gt1=1,3
  Do gt2=1,3
ZcplAhcHpmVWm(gt2,:) = ZcplAhcHpmVWm(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhcHpmVWm(gt1,:) 
 End Do 
End Do 
TempcplAhcHpmVWm = ZcplAhcHpmVWm 
ZcplAhcHpmVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhcHpmVWm(:,gt2) = ZcplAhcHpmVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplAhcHpmVWm(:,gt1) 
 End Do 
End Do 
TempcplAhcHpmVWm = ZcplAhcHpmVWm 


 ! ## ZcplhhHpmcVWm ## 
ZcplhhHpmcVWm = 0._dp 
TempcplhhHpmcVWm = cplhhHpmcVWm 
Do gt1=1,3
  Do gt2=1,3
ZcplhhHpmcVWm(gt2,:) = ZcplhhHpmcVWm(gt2,:) + ZRUZH(gt2,gt1)*TempcplhhHpmcVWm(gt1,:) 
 End Do 
End Do 
TempcplhhHpmcVWm = ZcplhhHpmcVWm 
ZcplhhHpmcVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpmcVWm(:,gt2) = ZcplhhHpmcVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplhhHpmcVWm(:,gt1) 
 End Do 
End Do 
TempcplhhHpmcVWm = ZcplhhHpmcVWm 


 ! ## ZcplhhcHpmVWm ## 
ZcplhhcHpmVWm = 0._dp 
TempcplhhcHpmVWm = cplhhcHpmVWm 
Do gt1=1,3
  Do gt2=1,3
ZcplhhcHpmVWm(gt2,:) = ZcplhhcHpmVWm(gt2,:) + ZRUZH(gt2,gt1)*TempcplhhcHpmVWm(gt1,:) 
 End Do 
End Do 
TempcplhhcHpmVWm = ZcplhhcHpmVWm 
ZcplhhcHpmVWm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhcHpmVWm(:,gt2) = ZcplhhcHpmVWm(:,gt2) + ZRUZP(gt2,gt1)*TempcplhhcHpmVWm(:,gt1) 
 End Do 
End Do 
TempcplhhcHpmVWm = ZcplhhcHpmVWm 


 ! ## ZcplHpmcHpmVP ## 
ZcplHpmcHpmVP = 0._dp 
TempcplHpmcHpmVP = cplHpmcHpmVP 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVP(gt2,:) = ZcplHpmcHpmVP(gt2,:) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVP(gt1,:) 
 End Do 
End Do 
TempcplHpmcHpmVP = ZcplHpmcHpmVP 
ZcplHpmcHpmVP = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVP(:,gt2) = ZcplHpmcHpmVP(:,gt2) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVP(:,gt1) 
 End Do 
End Do 
TempcplHpmcHpmVP = ZcplHpmcHpmVP 


 ! ## ZcplHpmcHpmVZ ## 
ZcplHpmcHpmVZ = 0._dp 
TempcplHpmcHpmVZ = cplHpmcHpmVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVZ(gt2,:) = ZcplHpmcHpmVZ(gt2,:) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVZ(gt1,:) 
 End Do 
End Do 
TempcplHpmcHpmVZ = ZcplHpmcHpmVZ 
ZcplHpmcHpmVZ = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcHpmVZ(:,gt2) = ZcplHpmcHpmVZ(:,gt2) + ZRUZP(gt2,gt1)*TempcplHpmcHpmVZ(:,gt1) 
 End Do 
End Do 
TempcplHpmcHpmVZ = ZcplHpmcHpmVZ 


 ! ## ZcplSdcSdVG ## 
ZcplSdcSdVG = 0._dp 
TempcplSdcSdVG = cplSdcSdVG 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVG(gt2,:) = ZcplSdcSdVG(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSdVG(gt1,:) 
 End Do 
End Do 
TempcplSdcSdVG = ZcplSdcSdVG 
ZcplSdcSdVG = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVG(:,gt2) = ZcplSdcSdVG(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSdcSdVG(:,gt1) 
 End Do 
End Do 
TempcplSdcSdVG = ZcplSdcSdVG 


 ! ## ZcplSdcSdVP ## 
ZcplSdcSdVP = 0._dp 
TempcplSdcSdVP = cplSdcSdVP 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVP(gt2,:) = ZcplSdcSdVP(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSdVP(gt1,:) 
 End Do 
End Do 
TempcplSdcSdVP = ZcplSdcSdVP 
ZcplSdcSdVP = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVP(:,gt2) = ZcplSdcSdVP(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSdcSdVP(:,gt1) 
 End Do 
End Do 
TempcplSdcSdVP = ZcplSdcSdVP 


 ! ## ZcplSdcSdVZ ## 
ZcplSdcSdVZ = 0._dp 
TempcplSdcSdVZ = cplSdcSdVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVZ(gt2,:) = ZcplSdcSdVZ(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSdVZ(gt1,:) 
 End Do 
End Do 
TempcplSdcSdVZ = ZcplSdcSdVZ 
ZcplSdcSdVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSdVZ(:,gt2) = ZcplSdcSdVZ(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSdcSdVZ(:,gt1) 
 End Do 
End Do 
TempcplSdcSdVZ = ZcplSdcSdVZ 


 ! ## ZcplSdcSucVWm ## 
ZcplSdcSucVWm = 0._dp 
TempcplSdcSucVWm = cplSdcSucVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSucVWm(gt2,:) = ZcplSdcSucVWm(gt2,:) + ZRUZD(gt2,gt1)*TempcplSdcSucVWm(gt1,:) 
 End Do 
End Do 
TempcplSdcSucVWm = ZcplSdcSucVWm 
ZcplSdcSucVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSdcSucVWm(:,gt2) = ZcplSdcSucVWm(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSdcSucVWm(:,gt1) 
 End Do 
End Do 
TempcplSdcSucVWm = ZcplSdcSucVWm 


 ! ## ZcplSeSvImcVWm ## 
ZcplSeSvImcVWm = 0._dp 
TempcplSeSvImcVWm = cplSeSvImcVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcVWm(gt2,:) = ZcplSeSvImcVWm(gt2,:) + ZRUZE(gt2,gt1)*TempcplSeSvImcVWm(gt1,:) 
 End Do 
End Do 
TempcplSeSvImcVWm = ZcplSeSvImcVWm 
ZcplSeSvImcVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvImcVWm(:,gt2) = ZcplSeSvImcVWm(:,gt2) + ZRUZVI(gt2,gt1)*TempcplSeSvImcVWm(:,gt1) 
 End Do 
End Do 
TempcplSeSvImcVWm = ZcplSeSvImcVWm 


 ! ## ZcplSeSvRecVWm ## 
ZcplSeSvRecVWm = 0._dp 
TempcplSeSvRecVWm = cplSeSvRecVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecVWm(gt2,:) = ZcplSeSvRecVWm(gt2,:) + ZRUZE(gt2,gt1)*TempcplSeSvRecVWm(gt1,:) 
 End Do 
End Do 
TempcplSeSvRecVWm = ZcplSeSvRecVWm 
ZcplSeSvRecVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSeSvRecVWm(:,gt2) = ZcplSeSvRecVWm(:,gt2) + ZRUZVR(gt2,gt1)*TempcplSeSvRecVWm(:,gt1) 
 End Do 
End Do 
TempcplSeSvRecVWm = ZcplSeSvRecVWm 


 ! ## ZcplSecSeVP ## 
ZcplSecSeVP = 0._dp 
TempcplSecSeVP = cplSecSeVP 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVP(gt2,:) = ZcplSecSeVP(gt2,:) + ZRUZE(gt2,gt1)*TempcplSecSeVP(gt1,:) 
 End Do 
End Do 
TempcplSecSeVP = ZcplSecSeVP 
ZcplSecSeVP = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVP(:,gt2) = ZcplSecSeVP(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSecSeVP(:,gt1) 
 End Do 
End Do 
TempcplSecSeVP = ZcplSecSeVP 


 ! ## ZcplSecSeVZ ## 
ZcplSecSeVZ = 0._dp 
TempcplSecSeVZ = cplSecSeVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVZ(gt2,:) = ZcplSecSeVZ(gt2,:) + ZRUZE(gt2,gt1)*TempcplSecSeVZ(gt1,:) 
 End Do 
End Do 
TempcplSecSeVZ = ZcplSecSeVZ 
ZcplSecSeVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSecSeVZ(:,gt2) = ZcplSecSeVZ(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSecSeVZ(:,gt1) 
 End Do 
End Do 
TempcplSecSeVZ = ZcplSecSeVZ 


 ! ## ZcplSucSuVG ## 
ZcplSucSuVG = 0._dp 
TempcplSucSuVG = cplSucSuVG 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVG(gt2,:) = ZcplSucSuVG(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSuVG(gt1,:) 
 End Do 
End Do 
TempcplSucSuVG = ZcplSucSuVG 
ZcplSucSuVG = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVG(:,gt2) = ZcplSucSuVG(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSucSuVG(:,gt1) 
 End Do 
End Do 
TempcplSucSuVG = ZcplSucSuVG 


 ! ## ZcplSucSuVP ## 
ZcplSucSuVP = 0._dp 
TempcplSucSuVP = cplSucSuVP 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVP(gt2,:) = ZcplSucSuVP(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSuVP(gt1,:) 
 End Do 
End Do 
TempcplSucSuVP = ZcplSucSuVP 
ZcplSucSuVP = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVP(:,gt2) = ZcplSucSuVP(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSucSuVP(:,gt1) 
 End Do 
End Do 
TempcplSucSuVP = ZcplSucSuVP 


 ! ## ZcplSucSdVWm ## 
ZcplSucSdVWm = 0._dp 
TempcplSucSdVWm = cplSucSdVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSdVWm(gt2,:) = ZcplSucSdVWm(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSdVWm(gt1,:) 
 End Do 
End Do 
TempcplSucSdVWm = ZcplSucSdVWm 
ZcplSucSdVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSdVWm(:,gt2) = ZcplSucSdVWm(:,gt2) + ZRUZDc(gt2,gt1)*TempcplSucSdVWm(:,gt1) 
 End Do 
End Do 
TempcplSucSdVWm = ZcplSucSdVWm 


 ! ## ZcplSucSuVZ ## 
ZcplSucSuVZ = 0._dp 
TempcplSucSuVZ = cplSucSuVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVZ(gt2,:) = ZcplSucSuVZ(gt2,:) + ZRUZU(gt2,gt1)*TempcplSucSuVZ(gt1,:) 
 End Do 
End Do 
TempcplSucSuVZ = ZcplSucSuVZ 
ZcplSucSuVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSucSuVZ(:,gt2) = ZcplSucSuVZ(:,gt2) + ZRUZUc(gt2,gt1)*TempcplSucSuVZ(:,gt1) 
 End Do 
End Do 
TempcplSucSuVZ = ZcplSucSuVZ 


 ! ## ZcplSvImSvReVZ ## 
ZcplSvImSvReVZ = 0._dp 
TempcplSvImSvReVZ = cplSvImSvReVZ 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVZ(gt2,:) = ZcplSvImSvReVZ(gt2,:) + ZRUZVI(gt2,gt1)*TempcplSvImSvReVZ(gt1,:) 
 End Do 
End Do 
TempcplSvImSvReVZ = ZcplSvImSvReVZ 
ZcplSvImSvReVZ = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImSvReVZ(:,gt2) = ZcplSvImSvReVZ(:,gt2) + ZRUZVR(gt2,gt1)*TempcplSvImSvReVZ(:,gt1) 
 End Do 
End Do 
TempcplSvImSvReVZ = ZcplSvImSvReVZ 


 ! ## ZcplSvImcSeVWm ## 
ZcplSvImcSeVWm = 0._dp 
TempcplSvImcSeVWm = cplSvImcSeVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImcSeVWm(gt2,:) = ZcplSvImcSeVWm(gt2,:) + ZRUZVI(gt2,gt1)*TempcplSvImcSeVWm(gt1,:) 
 End Do 
End Do 
TempcplSvImcSeVWm = ZcplSvImcSeVWm 
ZcplSvImcSeVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvImcSeVWm(:,gt2) = ZcplSvImcSeVWm(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSvImcSeVWm(:,gt1) 
 End Do 
End Do 
TempcplSvImcSeVWm = ZcplSvImcSeVWm 


 ! ## ZcplSvRecSeVWm ## 
ZcplSvRecSeVWm = 0._dp 
TempcplSvRecSeVWm = cplSvRecSeVWm 
Do gt1=1,6
  Do gt2=1,6
ZcplSvRecSeVWm(gt2,:) = ZcplSvRecSeVWm(gt2,:) + ZRUZVR(gt2,gt1)*TempcplSvRecSeVWm(gt1,:) 
 End Do 
End Do 
TempcplSvRecSeVWm = ZcplSvRecSeVWm 
ZcplSvRecSeVWm = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplSvRecSeVWm(:,gt2) = ZcplSvRecSeVWm(:,gt2) + ZRUZEc(gt2,gt1)*TempcplSvRecSeVWm(:,gt1) 
 End Do 
End Do 
TempcplSvRecSeVWm = ZcplSvRecSeVWm 


 ! ## ZcplhhcVWmVWm ## 
ZcplhhcVWmVWm = 0._dp 
TempcplhhcVWmVWm = cplhhcVWmVWm 
Do gt1=1,3
  Do gt2=1,3
ZcplhhcVWmVWm(gt2) = ZcplhhcVWmVWm(gt2) + ZRUZH(gt2,gt1)*TempcplhhcVWmVWm(gt1) 
 End Do 
End Do 
TempcplhhcVWmVWm = ZcplhhcVWmVWm 


 ! ## ZcplhhVZVZ ## 
ZcplhhVZVZ = 0._dp 
TempcplhhVZVZ = cplhhVZVZ 
Do gt1=1,3
  Do gt2=1,3
ZcplhhVZVZ(gt2) = ZcplhhVZVZ(gt2) + ZRUZH(gt2,gt1)*TempcplhhVZVZ(gt1) 
 End Do 
End Do 
TempcplhhVZVZ = ZcplhhVZVZ 


 ! ## ZcplHpmcVWmVP ## 
ZcplHpmcVWmVP = 0._dp 
TempcplHpmcVWmVP = cplHpmcVWmVP 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcVWmVP(gt2) = ZcplHpmcVWmVP(gt2) + ZRUZP(gt2,gt1)*TempcplHpmcVWmVP(gt1) 
 End Do 
End Do 
TempcplHpmcVWmVP = ZcplHpmcVWmVP 


 ! ## ZcplHpmcVWmVZ ## 
ZcplHpmcVWmVZ = 0._dp 
TempcplHpmcVWmVZ = cplHpmcVWmVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplHpmcVWmVZ(gt2) = ZcplHpmcVWmVZ(gt2) + ZRUZP(gt2,gt1)*TempcplHpmcVWmVZ(gt1) 
 End Do 
End Do 
TempcplHpmcVWmVZ = ZcplHpmcVWmVZ 


 ! ## ZcplcHpmVPVWm ## 
ZcplcHpmVPVWm = 0._dp 
TempcplcHpmVPVWm = cplcHpmVPVWm 
Do gt1=1,2
  Do gt2=1,2
ZcplcHpmVPVWm(gt2) = ZcplcHpmVPVWm(gt2) + ZRUZP(gt2,gt1)*TempcplcHpmVPVWm(gt1) 
 End Do 
End Do 
TempcplcHpmVPVWm = ZcplcHpmVPVWm 


 ! ## ZcplcHpmVWmVZ ## 
ZcplcHpmVWmVZ = 0._dp 
TempcplcHpmVWmVZ = cplcHpmVWmVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplcHpmVWmVZ(gt2) = ZcplcHpmVWmVZ(gt2) + ZRUZP(gt2,gt1)*TempcplcHpmVWmVZ(gt1) 
 End Do 
End Do 
TempcplcHpmVWmVZ = ZcplcHpmVWmVZ 


 ! ## ZcplAhAhcVWmVWm ## 
ZcplAhAhcVWmVWm = 0._dp 


 ! ## ZcplAhAhVZVZ ## 
ZcplAhAhVZVZ = 0._dp 


 ! ## ZcplAhHpmcVWmVP ## 
ZcplAhHpmcVWmVP = 0._dp 


 ! ## ZcplAhHpmcVWmVZ ## 
ZcplAhHpmcVWmVZ = 0._dp 


 ! ## ZcplAhcHpmVPVWm ## 
ZcplAhcHpmVPVWm = 0._dp 


 ! ## ZcplAhcHpmVWmVZ ## 
ZcplAhcHpmVWmVZ = 0._dp 


 ! ## ZcplhhhhcVWmVWm ## 
ZcplhhhhcVWmVWm = 0._dp 


 ! ## ZcplhhhhVZVZ ## 
ZcplhhhhVZVZ = 0._dp 


 ! ## ZcplhhHpmcVWmVP ## 
ZcplhhHpmcVWmVP = 0._dp 


 ! ## ZcplhhHpmcVWmVZ ## 
ZcplhhHpmcVWmVZ = 0._dp 


 ! ## ZcplhhcHpmVPVWm ## 
ZcplhhcHpmVPVWm = 0._dp 


 ! ## ZcplhhcHpmVWmVZ ## 
ZcplhhcHpmVWmVZ = 0._dp 


 ! ## ZcplHpmcHpmVPVP ## 
ZcplHpmcHpmVPVP = 0._dp 


 ! ## ZcplHpmcHpmVPVZ ## 
ZcplHpmcHpmVPVZ = 0._dp 


 ! ## ZcplHpmcHpmcVWmVWm ## 
ZcplHpmcHpmcVWmVWm = 0._dp 


 ! ## ZcplHpmcHpmVZVZ ## 
ZcplHpmcHpmVZVZ = 0._dp 


 ! ## ZcplSdcSdVGVG ## 
ZcplSdcSdVGVG = 0._dp 


 ! ## ZcplSdcSdVGVP ## 
ZcplSdcSdVGVP = 0._dp 


 ! ## ZcplSdcSdVGVZ ## 
ZcplSdcSdVGVZ = 0._dp 


 ! ## ZcplSdcSucVWmVG ## 
ZcplSdcSucVWmVG = 0._dp 


 ! ## ZcplSdcSdVPVP ## 
ZcplSdcSdVPVP = 0._dp 


 ! ## ZcplSdcSdVPVZ ## 
ZcplSdcSdVPVZ = 0._dp 


 ! ## ZcplSdcSucVWmVP ## 
ZcplSdcSucVWmVP = 0._dp 


 ! ## ZcplSdcSdcVWmVWm ## 
ZcplSdcSdcVWmVWm = 0._dp 


 ! ## ZcplSdcSdVZVZ ## 
ZcplSdcSdVZVZ = 0._dp 


 ! ## ZcplSdcSucVWmVZ ## 
ZcplSdcSucVWmVZ = 0._dp 


 ! ## ZcplSeSvImcVWmVP ## 
ZcplSeSvImcVWmVP = 0._dp 


 ! ## ZcplSeSvImcVWmVZ ## 
ZcplSeSvImcVWmVZ = 0._dp 


 ! ## ZcplSeSvRecVWmVP ## 
ZcplSeSvRecVWmVP = 0._dp 


 ! ## ZcplSeSvRecVWmVZ ## 
ZcplSeSvRecVWmVZ = 0._dp 


 ! ## ZcplSecSeVPVP ## 
ZcplSecSeVPVP = 0._dp 


 ! ## ZcplSecSeVPVZ ## 
ZcplSecSeVPVZ = 0._dp 


 ! ## ZcplSecSecVWmVWm ## 
ZcplSecSecVWmVWm = 0._dp 


 ! ## ZcplSecSeVZVZ ## 
ZcplSecSeVZVZ = 0._dp 


 ! ## ZcplSucSuVGVG ## 
ZcplSucSuVGVG = 0._dp 


 ! ## ZcplSucSuVGVP ## 
ZcplSucSuVGVP = 0._dp 


 ! ## ZcplSucSdVGVWm ## 
ZcplSucSdVGVWm = 0._dp 


 ! ## ZcplSucSuVGVZ ## 
ZcplSucSuVGVZ = 0._dp 


 ! ## ZcplSucSuVPVP ## 
ZcplSucSuVPVP = 0._dp 


 ! ## ZcplSucSdVPVWm ## 
ZcplSucSdVPVWm = 0._dp 


 ! ## ZcplSucSuVPVZ ## 
ZcplSucSuVPVZ = 0._dp 


 ! ## ZcplSucSdVWmVZ ## 
ZcplSucSdVWmVZ = 0._dp 


 ! ## ZcplSucSucVWmVWm ## 
ZcplSucSucVWmVWm = 0._dp 


 ! ## ZcplSucSuVZVZ ## 
ZcplSucSuVZVZ = 0._dp 


 ! ## ZcplSvImSvImcVWmVWm ## 
ZcplSvImSvImcVWmVWm = 0._dp 


 ! ## ZcplSvImSvImVZVZ ## 
ZcplSvImSvImVZVZ = 0._dp 


 ! ## ZcplSvImcSeVPVWm ## 
ZcplSvImcSeVPVWm = 0._dp 


 ! ## ZcplSvImcSeVWmVZ ## 
ZcplSvImcSeVWmVZ = 0._dp 


 ! ## ZcplSvReSvRecVWmVWm ## 
ZcplSvReSvRecVWmVWm = 0._dp 


 ! ## ZcplSvReSvReVZVZ ## 
ZcplSvReSvReVZVZ = 0._dp 


 ! ## ZcplSvRecSeVPVWm ## 
ZcplSvRecSeVPVWm = 0._dp 


 ! ## ZcplSvRecSeVWmVZ ## 
ZcplSvRecSeVWmVZ = 0._dp 


 ! ## ZcplVGVGVG ## 
ZcplVGVGVG = 0._dp 
TempcplVGVGVG = cplVGVGVG 
ZcplVGVGVG = TempcplVGVGVG 


 ! ## ZcplcVWmVPVWm ## 
ZcplcVWmVPVWm = 0._dp 
TempcplcVWmVPVWm = cplcVWmVPVWm 
ZcplcVWmVPVWm = TempcplcVWmVPVWm 


 ! ## ZcplcVWmVWmVZ ## 
ZcplcVWmVWmVZ = 0._dp 
TempcplcVWmVWmVZ = cplcVWmVWmVZ 
ZcplcVWmVWmVZ = TempcplcVWmVWmVZ 


 ! ## ZcplcChaChaAhL ## 
ZcplcChaChaAhL = 0._dp 
TempcplcChaChaAhL = cplcChaChaAhL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhL(gt2,:,:) = ZcplcChaChaAhL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaChaAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChaAhL = ZcplcChaChaAhL 
ZcplcChaChaAhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhL(:,gt2,:) = ZcplcChaChaAhL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcChaChaAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChaAhL = ZcplcChaChaAhL 
ZcplcChaChaAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaChaAhL(:,:,gt2) = ZcplcChaChaAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcChaChaAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChaAhR ## 
ZcplcChaChaAhR = 0._dp 
TempcplcChaChaAhR = cplcChaChaAhR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhR(gt2,:,:) = ZcplcChaChaAhR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaChaAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChaAhR = ZcplcChaChaAhR 
ZcplcChaChaAhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaAhR(:,gt2,:) = ZcplcChaChaAhR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcChaChaAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChaAhR = ZcplcChaChaAhR 
ZcplcChaChaAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaChaAhR(:,:,gt2) = ZcplcChaChaAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcChaChaAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChiAhL ## 
ZcplChiChiAhL = 0._dp 
TempcplChiChiAhL = cplChiChiAhL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiAhL(gt2,:,:) = ZcplChiChiAhL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiChiAhL(gt1,:,:) 
 End Do 
End Do 
TempcplChiChiAhL = ZcplChiChiAhL 
ZcplChiChiAhL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiAhL(:,gt2,:) = ZcplChiChiAhL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChiAhL(:,gt1,:) 
 End Do 
End Do 
TempcplChiChiAhL = ZcplChiChiAhL 
ZcplChiChiAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiChiAhL(:,:,gt2) = ZcplChiChiAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplChiChiAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChiAhR ## 
ZcplChiChiAhR = 0._dp 
TempcplChiChiAhR = cplChiChiAhR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiAhR(gt2,:,:) = ZcplChiChiAhR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiChiAhR(gt1,:,:) 
 End Do 
End Do 
TempcplChiChiAhR = ZcplChiChiAhR 
ZcplChiChiAhR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiAhR(:,gt2,:) = ZcplChiChiAhR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChiAhR(:,gt1,:) 
 End Do 
End Do 
TempcplChiChiAhR = ZcplChiChiAhR 
ZcplChiChiAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiChiAhR(:,:,gt2) = ZcplChiChiAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplChiChiAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdAhL ## 
ZcplcFdFdAhL = 0._dp 
TempcplcFdFdAhL = cplcFdFdAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(gt2,:,:) = ZcplcFdFdAhL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(:,gt2,:) = ZcplcFdFdAhL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcFdFdAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(:,:,gt2) = ZcplcFdFdAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFdFdAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdAhR ## 
ZcplcFdFdAhR = 0._dp 
TempcplcFdFdAhR = cplcFdFdAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(gt2,:,:) = ZcplcFdFdAhR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(:,gt2,:) = ZcplcFdFdAhR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcFdFdAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(:,:,gt2) = ZcplcFdFdAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFdFdAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFeAhL ## 
ZcplcFeFeAhL = 0._dp 
TempcplcFeFeAhL = cplcFeFeAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(gt2,:,:) = ZcplcFeFeAhL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeFeAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(:,gt2,:) = ZcplcFeFeAhL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcFeFeAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(:,:,gt2) = ZcplcFeFeAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFeFeAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFeAhR ## 
ZcplcFeFeAhR = 0._dp 
TempcplcFeFeAhR = cplcFeFeAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(gt2,:,:) = ZcplcFeFeAhR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeFeAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(:,gt2,:) = ZcplcFeFeAhR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcFeFeAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(:,:,gt2) = ZcplcFeFeAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFeFeAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuAhL ## 
ZcplcFuFuAhL = 0._dp 
TempcplcFuFuAhL = cplcFuFuAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(gt2,:,:) = ZcplcFuFuAhL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(:,gt2,:) = ZcplcFuFuAhL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplcFuFuAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(:,:,gt2) = ZcplcFuFuAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFuFuAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuAhR ## 
ZcplcFuFuAhR = 0._dp 
TempcplcFuFuAhR = cplcFuFuAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(gt2,:,:) = ZcplcFuFuAhR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(:,gt2,:) = ZcplcFuFuAhR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplcFuFuAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(:,:,gt2) = ZcplcFuFuAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFuFuAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvAhL ## 
ZcplFvFvAhL = 0._dp 
TempcplFvFvAhL = cplFvFvAhL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhL(gt2,:,:) = ZcplFvFvAhL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFvAhL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvAhL = ZcplFvFvAhL 
ZcplFvFvAhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhL(:,gt2,:) = ZcplFvFvAhL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvAhL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvAhL = ZcplFvFvAhL 
ZcplFvFvAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvAhL(:,:,gt2) = ZcplFvFvAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplFvFvAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvAhR ## 
ZcplFvFvAhR = 0._dp 
TempcplFvFvAhR = cplFvFvAhR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhR(gt2,:,:) = ZcplFvFvAhR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFvAhR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvAhR = ZcplFvFvAhR 
ZcplFvFvAhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvAhR(:,gt2,:) = ZcplFvFvAhR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvAhR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvAhR = ZcplFvFvAhR 
ZcplFvFvAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvAhR(:,:,gt2) = ZcplFvFvAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplFvFvAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChacHpmL ## 
ZcplChiChacHpmL = 0._dp 
TempcplChiChacHpmL = cplChiChacHpmL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChacHpmL(gt2,:,:) = ZcplChiChacHpmL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiChacHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplChiChacHpmL = ZcplChiChacHpmL 
ZcplChiChacHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmL(:,gt2,:) = ZcplChiChacHpmL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplChiChacHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplChiChacHpmL = ZcplChiChacHpmL 
ZcplChiChacHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmL(:,:,gt2) = ZcplChiChacHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplChiChacHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChacHpmR ## 
ZcplChiChacHpmR = 0._dp 
TempcplChiChacHpmR = cplChiChacHpmR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChacHpmR(gt2,:,:) = ZcplChiChacHpmR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiChacHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplChiChacHpmR = ZcplChiChacHpmR 
ZcplChiChacHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmR(:,gt2,:) = ZcplChiChacHpmR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplChiChacHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplChiChacHpmR = ZcplChiChacHpmR 
ZcplChiChacHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacHpmR(:,:,gt2) = ZcplChiChacHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplChiChacHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChaFucSdL ## 
ZcplChaFucSdL = 0._dp 
TempcplChaFucSdL = cplChaFucSdL 
Do gt1=1,2
  Do gt2=1,2
ZcplChaFucSdL(gt2,:,:) = ZcplChaFucSdL(gt2,:,:) + ZRUUM(gt2,gt1)*TempcplChaFucSdL(gt1,:,:) 
 End Do 
End Do 
TempcplChaFucSdL = ZcplChaFucSdL 
ZcplChaFucSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChaFucSdL(:,gt2,:) = ZcplChaFucSdL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplChaFucSdL(:,gt1,:) 
 End Do 
End Do 
TempcplChaFucSdL = ZcplChaFucSdL 
ZcplChaFucSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChaFucSdL(:,:,gt2) = ZcplChaFucSdL(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChaFucSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChaFucSdR ## 
ZcplChaFucSdR = 0._dp 
TempcplChaFucSdR = cplChaFucSdR 
Do gt1=1,2
  Do gt2=1,2
ZcplChaFucSdR(gt2,:,:) = ZcplChaFucSdR(gt2,:,:) + ZRUUPc(gt2,gt1)*TempcplChaFucSdR(gt1,:,:) 
 End Do 
End Do 
TempcplChaFucSdR = ZcplChaFucSdR 
ZcplChaFucSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChaFucSdR(:,gt2,:) = ZcplChaFucSdR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplChaFucSdR(:,gt1,:) 
 End Do 
End Do 
TempcplChaFucSdR = ZcplChaFucSdR 
ZcplChaFucSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChaFucSdR(:,:,gt2) = ZcplChaFucSdR(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChaFucSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvChacSeL ## 
ZcplFvChacSeL = 0._dp 
TempcplFvChacSeL = cplFvChacSeL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeL(gt2,:,:) = ZcplFvChacSeL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvChacSeL(gt1,:,:) 
 End Do 
End Do 
TempcplFvChacSeL = ZcplFvChacSeL 
ZcplFvChacSeL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvChacSeL(:,gt2,:) = ZcplFvChacSeL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplFvChacSeL(:,gt1,:) 
 End Do 
End Do 
TempcplFvChacSeL = ZcplFvChacSeL 
ZcplFvChacSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeL(:,:,gt2) = ZcplFvChacSeL(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplFvChacSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvChacSeR ## 
ZcplFvChacSeR = 0._dp 
TempcplFvChacSeR = cplFvChacSeR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeR(gt2,:,:) = ZcplFvChacSeR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvChacSeR(gt1,:,:) 
 End Do 
End Do 
TempcplFvChacSeR = ZcplFvChacSeR 
ZcplFvChacSeR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvChacSeR(:,gt2,:) = ZcplFvChacSeR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplFvChacSeR(:,gt1,:) 
 End Do 
End Do 
TempcplFvChacSeR = ZcplFvChacSeR 
ZcplFvChacSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvChacSeR(:,:,gt2) = ZcplFvChacSeR(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplFvChacSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChahhL ## 
ZcplcChaChahhL = 0._dp 
TempcplcChaChahhL = cplcChaChahhL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhL(gt2,:,:) = ZcplcChaChahhL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaChahhL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChahhL = ZcplcChaChahhL 
ZcplcChaChahhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhL(:,gt2,:) = ZcplcChaChahhL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcChaChahhL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChahhL = ZcplcChaChahhL 
ZcplcChaChahhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaChahhL(:,:,gt2) = ZcplcChaChahhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcChaChahhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChahhR ## 
ZcplcChaChahhR = 0._dp 
TempcplcChaChahhR = cplcChaChahhR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhR(gt2,:,:) = ZcplcChaChahhR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaChahhR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChahhR = ZcplcChaChahhR 
ZcplcChaChahhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChahhR(:,gt2,:) = ZcplcChaChahhR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcChaChahhR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChahhR = ZcplcChaChahhR 
ZcplcChaChahhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaChahhR(:,:,gt2) = ZcplcChaChahhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcChaChahhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChaSuL ## 
ZcplcFdChaSuL = 0._dp 
TempcplcFdChaSuL = cplcFdChaSuL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChaSuL(gt2,:,:) = ZcplcFdChaSuL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdChaSuL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChaSuL = ZcplcFdChaSuL 
ZcplcFdChaSuL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdChaSuL(:,gt2,:) = ZcplcFdChaSuL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcFdChaSuL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChaSuL = ZcplcFdChaSuL 
ZcplcFdChaSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChaSuL(:,:,gt2) = ZcplcFdChaSuL(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFdChaSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChaSuR ## 
ZcplcFdChaSuR = 0._dp 
TempcplcFdChaSuR = cplcFdChaSuR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChaSuR(gt2,:,:) = ZcplcFdChaSuR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdChaSuR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChaSuR = ZcplcFdChaSuR 
ZcplcFdChaSuR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdChaSuR(:,gt2,:) = ZcplcFdChaSuR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcFdChaSuR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChaSuR = ZcplcFdChaSuR 
ZcplcFdChaSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChaSuR(:,:,gt2) = ZcplcFdChaSuR(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFdChaSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvImL ## 
ZcplcFeChaSvImL = 0._dp 
TempcplcFeChaSvImL = cplcFeChaSvImL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvImL(gt2,:,:) = ZcplcFeChaSvImL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeChaSvImL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvImL = ZcplcFeChaSvImL 
ZcplcFeChaSvImL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvImL(:,gt2,:) = ZcplcFeChaSvImL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcFeChaSvImL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvImL = ZcplcFeChaSvImL 
ZcplcFeChaSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvImL(:,:,gt2) = ZcplcFeChaSvImL(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcFeChaSvImL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvImR ## 
ZcplcFeChaSvImR = 0._dp 
TempcplcFeChaSvImR = cplcFeChaSvImR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvImR(gt2,:,:) = ZcplcFeChaSvImR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeChaSvImR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvImR = ZcplcFeChaSvImR 
ZcplcFeChaSvImR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvImR(:,gt2,:) = ZcplcFeChaSvImR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcFeChaSvImR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvImR = ZcplcFeChaSvImR 
ZcplcFeChaSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvImR(:,:,gt2) = ZcplcFeChaSvImR(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcFeChaSvImR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvReL ## 
ZcplcFeChaSvReL = 0._dp 
TempcplcFeChaSvReL = cplcFeChaSvReL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvReL(gt2,:,:) = ZcplcFeChaSvReL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeChaSvReL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvReL = ZcplcFeChaSvReL 
ZcplcFeChaSvReL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvReL(:,gt2,:) = ZcplcFeChaSvReL(:,gt2,:) + ZRUUM(gt2,gt1)*TempcplcFeChaSvReL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvReL = ZcplcFeChaSvReL 
ZcplcFeChaSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvReL(:,:,gt2) = ZcplcFeChaSvReL(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcFeChaSvReL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChaSvReR ## 
ZcplcFeChaSvReR = 0._dp 
TempcplcFeChaSvReR = cplcFeChaSvReR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChaSvReR(gt2,:,:) = ZcplcFeChaSvReR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeChaSvReR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChaSvReR = ZcplcFeChaSvReR 
ZcplcFeChaSvReR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeChaSvReR(:,gt2,:) = ZcplcFeChaSvReR(:,gt2,:) + ZRUUPc(gt2,gt1)*TempcplcFeChaSvReR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChaSvReR = ZcplcFeChaSvReR 
ZcplcFeChaSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChaSvReR(:,:,gt2) = ZcplcFeChaSvReR(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcFeChaSvReR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChihhL ## 
ZcplChiChihhL = 0._dp 
TempcplChiChihhL = cplChiChihhL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChihhL(gt2,:,:) = ZcplChiChihhL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiChihhL(gt1,:,:) 
 End Do 
End Do 
TempcplChiChihhL = ZcplChiChihhL 
ZcplChiChihhL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChihhL(:,gt2,:) = ZcplChiChihhL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChihhL(:,gt1,:) 
 End Do 
End Do 
TempcplChiChihhL = ZcplChiChihhL 
ZcplChiChihhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiChihhL(:,:,gt2) = ZcplChiChihhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplChiChihhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChihhR ## 
ZcplChiChihhR = 0._dp 
TempcplChiChihhR = cplChiChihhR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChihhR(gt2,:,:) = ZcplChiChihhR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiChihhR(gt1,:,:) 
 End Do 
End Do 
TempcplChiChihhR = ZcplChiChihhR 
ZcplChiChihhR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChihhR(:,gt2,:) = ZcplChiChihhR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChihhR(:,gt1,:) 
 End Do 
End Do 
TempcplChiChihhR = ZcplChiChihhR 
ZcplChiChihhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiChihhR(:,:,gt2) = ZcplChiChihhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplChiChihhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFdcSdL ## 
ZcplChiFdcSdL = 0._dp 
TempcplChiFdcSdL = cplChiFdcSdL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFdcSdL(gt2,:,:) = ZcplChiFdcSdL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFdcSdL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFdcSdL = ZcplChiFdcSdL 
ZcplChiFdcSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFdcSdL(:,gt2,:) = ZcplChiFdcSdL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplChiFdcSdL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFdcSdL = ZcplChiFdcSdL 
ZcplChiFdcSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFdcSdL(:,:,gt2) = ZcplChiFdcSdL(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChiFdcSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFdcSdR ## 
ZcplChiFdcSdR = 0._dp 
TempcplChiFdcSdR = cplChiFdcSdR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFdcSdR(gt2,:,:) = ZcplChiFdcSdR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFdcSdR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFdcSdR = ZcplChiFdcSdR 
ZcplChiFdcSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFdcSdR(:,gt2,:) = ZcplChiFdcSdR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplChiFdcSdR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFdcSdR = ZcplChiFdcSdR 
ZcplChiFdcSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFdcSdR(:,:,gt2) = ZcplChiFdcSdR(:,:,gt2) + ZRUZDc(gt2,gt1)*TempcplChiFdcSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFecSeL ## 
ZcplChiFecSeL = 0._dp 
TempcplChiFecSeL = cplChiFecSeL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFecSeL(gt2,:,:) = ZcplChiFecSeL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFecSeL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFecSeL = ZcplChiFecSeL 
ZcplChiFecSeL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFecSeL(:,gt2,:) = ZcplChiFecSeL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplChiFecSeL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFecSeL = ZcplChiFecSeL 
ZcplChiFecSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFecSeL(:,:,gt2) = ZcplChiFecSeL(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplChiFecSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFecSeR ## 
ZcplChiFecSeR = 0._dp 
TempcplChiFecSeR = cplChiFecSeR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFecSeR(gt2,:,:) = ZcplChiFecSeR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFecSeR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFecSeR = ZcplChiFecSeR 
ZcplChiFecSeR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFecSeR(:,gt2,:) = ZcplChiFecSeR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplChiFecSeR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFecSeR = ZcplChiFecSeR 
ZcplChiFecSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFecSeR(:,:,gt2) = ZcplChiFecSeR(:,:,gt2) + ZRUZEc(gt2,gt1)*TempcplChiFecSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFucSuL ## 
ZcplChiFucSuL = 0._dp 
TempcplChiFucSuL = cplChiFucSuL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFucSuL(gt2,:,:) = ZcplChiFucSuL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFucSuL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFucSuL = ZcplChiFucSuL 
ZcplChiFucSuL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFucSuL(:,gt2,:) = ZcplChiFucSuL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplChiFucSuL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFucSuL = ZcplChiFucSuL 
ZcplChiFucSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFucSuL(:,:,gt2) = ZcplChiFucSuL(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplChiFucSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFucSuR ## 
ZcplChiFucSuR = 0._dp 
TempcplChiFucSuR = cplChiFucSuR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFucSuR(gt2,:,:) = ZcplChiFucSuR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFucSuR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFucSuR = ZcplChiFucSuR 
ZcplChiFucSuR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplChiFucSuR(:,gt2,:) = ZcplChiFucSuR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplChiFucSuR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFucSuR = ZcplChiFucSuR 
ZcplChiFucSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFucSuR(:,:,gt2) = ZcplChiFucSuR(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplChiFucSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvImL ## 
ZcplChiFvSvImL = 0._dp 
TempcplChiFvSvImL = cplChiFvSvImL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFvSvImL(gt2,:,:) = ZcplChiFvSvImL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFvSvImL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvImL = ZcplChiFvSvImL 
ZcplChiFvSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImL(:,gt2,:) = ZcplChiFvSvImL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplChiFvSvImL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvImL = ZcplChiFvSvImL 
ZcplChiFvSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImL(:,:,gt2) = ZcplChiFvSvImL(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplChiFvSvImL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvImR ## 
ZcplChiFvSvImR = 0._dp 
TempcplChiFvSvImR = cplChiFvSvImR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFvSvImR(gt2,:,:) = ZcplChiFvSvImR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFvSvImR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvImR = ZcplChiFvSvImR 
ZcplChiFvSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImR(:,gt2,:) = ZcplChiFvSvImR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplChiFvSvImR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvImR = ZcplChiFvSvImR 
ZcplChiFvSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvImR(:,:,gt2) = ZcplChiFvSvImR(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplChiFvSvImR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvReL ## 
ZcplChiFvSvReL = 0._dp 
TempcplChiFvSvReL = cplChiFvSvReL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFvSvReL(gt2,:,:) = ZcplChiFvSvReL(gt2,:,:) + ZRUZN(gt2,gt1)*TempcplChiFvSvReL(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvReL = ZcplChiFvSvReL 
ZcplChiFvSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReL(:,gt2,:) = ZcplChiFvSvReL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplChiFvSvReL(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvReL = ZcplChiFvSvReL 
ZcplChiFvSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReL(:,:,gt2) = ZcplChiFvSvReL(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplChiFvSvReL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiFvSvReR ## 
ZcplChiFvSvReR = 0._dp 
TempcplChiFvSvReR = cplChiFvSvReR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiFvSvReR(gt2,:,:) = ZcplChiFvSvReR(gt2,:,:) + ZRUZNc(gt2,gt1)*TempcplChiFvSvReR(gt1,:,:) 
 End Do 
End Do 
TempcplChiFvSvReR = ZcplChiFvSvReR 
ZcplChiFvSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReR(:,gt2,:) = ZcplChiFvSvReR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplChiFvSvReR(:,gt1,:) 
 End Do 
End Do 
TempcplChiFvSvReR = ZcplChiFvSvReR 
ZcplChiFvSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplChiFvSvReR(:,:,gt2) = ZcplChiFvSvReR(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplChiFvSvReR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChiHpmL ## 
ZcplcChaChiHpmL = 0._dp 
TempcplcChaChiHpmL = cplcChaChiHpmL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmL(gt2,:,:) = ZcplcChaChiHpmL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaChiHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChiHpmL = ZcplcChaChiHpmL 
ZcplcChaChiHpmL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcChaChiHpmL(:,gt2,:) = ZcplcChaChiHpmL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcChaChiHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChiHpmL = ZcplcChaChiHpmL 
ZcplcChaChiHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmL(:,:,gt2) = ZcplcChaChiHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcChaChiHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaChiHpmR ## 
ZcplcChaChiHpmR = 0._dp 
TempcplcChaChiHpmR = cplcChaChiHpmR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmR(gt2,:,:) = ZcplcChaChiHpmR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaChiHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaChiHpmR = ZcplcChaChiHpmR 
ZcplcChaChiHpmR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcChaChiHpmR(:,gt2,:) = ZcplcChaChiHpmR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcChaChiHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaChiHpmR = ZcplcChaChiHpmR 
ZcplcChaChiHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiHpmR(:,:,gt2) = ZcplcChaChiHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcChaChiHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChiSdL ## 
ZcplcFdChiSdL = 0._dp 
TempcplcFdChiSdL = cplcFdChiSdL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChiSdL(gt2,:,:) = ZcplcFdChiSdL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdChiSdL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChiSdL = ZcplcFdChiSdL 
ZcplcFdChiSdL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcFdChiSdL(:,gt2,:) = ZcplcFdChiSdL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcFdChiSdL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChiSdL = ZcplcFdChiSdL 
ZcplcFdChiSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChiSdL(:,:,gt2) = ZcplcFdChiSdL(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdChiSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdChiSdR ## 
ZcplcFdChiSdR = 0._dp 
TempcplcFdChiSdR = cplcFdChiSdR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdChiSdR(gt2,:,:) = ZcplcFdChiSdR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdChiSdR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdChiSdR = ZcplcFdChiSdR 
ZcplcFdChiSdR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcFdChiSdR(:,gt2,:) = ZcplcFdChiSdR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcFdChiSdR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdChiSdR = ZcplcFdChiSdR 
ZcplcFdChiSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdChiSdR(:,:,gt2) = ZcplcFdChiSdR(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdChiSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChiSeL ## 
ZcplcFeChiSeL = 0._dp 
TempcplcFeChiSeL = cplcFeChiSeL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChiSeL(gt2,:,:) = ZcplcFeChiSeL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeChiSeL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChiSeL = ZcplcFeChiSeL 
ZcplcFeChiSeL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcFeChiSeL(:,gt2,:) = ZcplcFeChiSeL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcFeChiSeL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChiSeL = ZcplcFeChiSeL 
ZcplcFeChiSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChiSeL(:,:,gt2) = ZcplcFeChiSeL(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcFeChiSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeChiSeR ## 
ZcplcFeChiSeR = 0._dp 
TempcplcFeChiSeR = cplcFeChiSeR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeChiSeR(gt2,:,:) = ZcplcFeChiSeR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeChiSeR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeChiSeR = ZcplcFeChiSeR 
ZcplcFeChiSeR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcFeChiSeR(:,gt2,:) = ZcplcFeChiSeR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcFeChiSeR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeChiSeR = ZcplcFeChiSeR 
ZcplcFeChiSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeChiSeR(:,:,gt2) = ZcplcFeChiSeR(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcFeChiSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuChiSuL ## 
ZcplcFuChiSuL = 0._dp 
TempcplcFuChiSuL = cplcFuChiSuL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuChiSuL(gt2,:,:) = ZcplcFuChiSuL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuChiSuL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuChiSuL = ZcplcFuChiSuL 
ZcplcFuChiSuL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcFuChiSuL(:,gt2,:) = ZcplcFuChiSuL(:,gt2,:) + ZRUZN(gt2,gt1)*TempcplcFuChiSuL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuChiSuL = ZcplcFuChiSuL 
ZcplcFuChiSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuChiSuL(:,:,gt2) = ZcplcFuChiSuL(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuChiSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuChiSuR ## 
ZcplcFuChiSuR = 0._dp 
TempcplcFuChiSuR = cplcFuChiSuR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuChiSuR(gt2,:,:) = ZcplcFuChiSuR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuChiSuR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuChiSuR = ZcplcFuChiSuR 
ZcplcFuChiSuR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcFuChiSuR(:,gt2,:) = ZcplcFuChiSuR(:,gt2,:) + ZRUZNc(gt2,gt1)*TempcplcFuChiSuR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuChiSuR = ZcplcFuChiSuR 
ZcplcFuChiSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuChiSuR(:,:,gt2) = ZcplcFuChiSuR(:,:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuChiSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFdcSdL ## 
ZcplGluFdcSdL = 0._dp 
TempcplGluFdcSdL = cplGluFdcSdL 
ZcplGluFdcSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFdcSdL(gt2,:) = ZcplGluFdcSdL(gt2,:) + ZRUZDL(gt2,gt1)*TempcplGluFdcSdL(gt1,:) 
 End Do 
End Do 
TempcplGluFdcSdL = ZcplGluFdcSdL 
ZcplGluFdcSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFdcSdL(:,gt2) = ZcplGluFdcSdL(:,gt2) + ZRUZDc(gt2,gt1)*TempcplGluFdcSdL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFdcSdR ## 
ZcplGluFdcSdR = 0._dp 
TempcplGluFdcSdR = cplGluFdcSdR 
ZcplGluFdcSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFdcSdR(gt2,:) = ZcplGluFdcSdR(gt2,:) + ZRUZDRc(gt2,gt1)*TempcplGluFdcSdR(gt1,:) 
 End Do 
End Do 
TempcplGluFdcSdR = ZcplGluFdcSdR 
ZcplGluFdcSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFdcSdR(:,gt2) = ZcplGluFdcSdR(:,gt2) + ZRUZDc(gt2,gt1)*TempcplGluFdcSdR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdhhL ## 
ZcplcFdFdhhL = 0._dp 
TempcplcFdFdhhL = cplcFdFdhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(gt2,:,:) = ZcplcFdFdhhL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(:,gt2,:) = ZcplcFdFdhhL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcFdFdhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(:,:,gt2) = ZcplcFdFdhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFdFdhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdhhR ## 
ZcplcFdFdhhR = 0._dp 
TempcplcFdFdhhR = cplcFdFdhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(gt2,:,:) = ZcplcFdFdhhR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(:,gt2,:) = ZcplcFdFdhhR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcFdFdhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(:,:,gt2) = ZcplcFdFdhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFdFdhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFdcSuL ## 
ZcplcChaFdcSuL = 0._dp 
TempcplcChaFdcSuL = cplcChaFdcSuL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFdcSuL(gt2,:,:) = ZcplcChaFdcSuL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFdcSuL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFdcSuL = ZcplcChaFdcSuL 
ZcplcChaFdcSuL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFdcSuL(:,gt2,:) = ZcplcChaFdcSuL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcChaFdcSuL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFdcSuL = ZcplcChaFdcSuL 
ZcplcChaFdcSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFdcSuL(:,:,gt2) = ZcplcChaFdcSuL(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplcChaFdcSuL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFdcSuR ## 
ZcplcChaFdcSuR = 0._dp 
TempcplcChaFdcSuR = cplcChaFdcSuR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFdcSuR(gt2,:,:) = ZcplcChaFdcSuR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFdcSuR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFdcSuR = ZcplcChaFdcSuR 
ZcplcChaFdcSuR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFdcSuR(:,gt2,:) = ZcplcChaFdcSuR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcChaFdcSuR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFdcSuR = ZcplcChaFdcSuR 
ZcplcChaFdcSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFdcSuR(:,:,gt2) = ZcplcChaFdcSuR(:,:,gt2) + ZRUZUc(gt2,gt1)*TempcplcChaFdcSuR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFdcHpmL ## 
ZcplcFuFdcHpmL = 0._dp 
TempcplcFuFdcHpmL = cplcFuFdcHpmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmL(gt2,:,:) = ZcplcFuFdcHpmL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuFdcHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFdcHpmL = ZcplcFuFdcHpmL 
ZcplcFuFdcHpmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmL(:,gt2,:) = ZcplcFuFdcHpmL(:,gt2,:) + ZRUZDL(gt2,gt1)*TempcplcFuFdcHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFdcHpmL = ZcplcFuFdcHpmL 
ZcplcFuFdcHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFdcHpmL(:,:,gt2) = ZcplcFuFdcHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFuFdcHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFdcHpmR ## 
ZcplcFuFdcHpmR = 0._dp 
TempcplcFuFdcHpmR = cplcFuFdcHpmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmR(gt2,:,:) = ZcplcFuFdcHpmR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuFdcHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFdcHpmR = ZcplcFuFdcHpmR 
ZcplcFuFdcHpmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcHpmR(:,gt2,:) = ZcplcFuFdcHpmR(:,gt2,:) + ZRUZDRc(gt2,gt1)*TempcplcFuFdcHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFdcHpmR = ZcplcFuFdcHpmR 
ZcplcFuFdcHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFdcHpmR(:,:,gt2) = ZcplcFuFdcHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFuFdcHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFecHpmL ## 
ZcplFvFecHpmL = 0._dp 
TempcplFvFecHpmL = cplFvFecHpmL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecHpmL(gt2,:,:) = ZcplFvFecHpmL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFecHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFecHpmL = ZcplFvFecHpmL 
ZcplFvFecHpmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecHpmL(:,gt2,:) = ZcplFvFecHpmL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplFvFecHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFecHpmL = ZcplFvFecHpmL 
ZcplFvFecHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFecHpmL(:,:,gt2) = ZcplFvFecHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplFvFecHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFecHpmR ## 
ZcplFvFecHpmR = 0._dp 
TempcplFvFecHpmR = cplFvFecHpmR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecHpmR(gt2,:,:) = ZcplFvFecHpmR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFecHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFecHpmR = ZcplFvFecHpmR 
ZcplFvFecHpmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecHpmR(:,gt2,:) = ZcplFvFecHpmR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplFvFecHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFecHpmR = ZcplFvFecHpmR 
ZcplFvFecHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFecHpmR(:,:,gt2) = ZcplFvFecHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplFvFecHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFehhL ## 
ZcplcFeFehhL = 0._dp 
TempcplcFeFehhL = cplcFeFehhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(gt2,:,:) = ZcplcFeFehhL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeFehhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(:,gt2,:) = ZcplcFeFehhL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcFeFehhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(:,:,gt2) = ZcplcFeFehhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFeFehhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFehhR ## 
ZcplcFeFehhR = 0._dp 
TempcplcFeFehhR = cplcFeFehhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(gt2,:,:) = ZcplcFeFehhR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeFehhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(:,gt2,:) = ZcplcFeFehhR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcFeFehhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(:,:,gt2) = ZcplcFeFehhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFeFehhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvImL ## 
ZcplcChaFeSvImL = 0._dp 
TempcplcChaFeSvImL = cplcChaFeSvImL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvImL(gt2,:,:) = ZcplcChaFeSvImL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFeSvImL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvImL = ZcplcChaFeSvImL 
ZcplcChaFeSvImL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvImL(:,gt2,:) = ZcplcChaFeSvImL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcChaFeSvImL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvImL = ZcplcChaFeSvImL 
ZcplcChaFeSvImL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvImL(:,:,gt2) = ZcplcChaFeSvImL(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcChaFeSvImL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvImR ## 
ZcplcChaFeSvImR = 0._dp 
TempcplcChaFeSvImR = cplcChaFeSvImR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvImR(gt2,:,:) = ZcplcChaFeSvImR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFeSvImR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvImR = ZcplcChaFeSvImR 
ZcplcChaFeSvImR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvImR(:,gt2,:) = ZcplcChaFeSvImR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcChaFeSvImR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvImR = ZcplcChaFeSvImR 
ZcplcChaFeSvImR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvImR(:,:,gt2) = ZcplcChaFeSvImR(:,:,gt2) + ZRUZVI(gt2,gt1)*TempcplcChaFeSvImR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvReL ## 
ZcplcChaFeSvReL = 0._dp 
TempcplcChaFeSvReL = cplcChaFeSvReL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvReL(gt2,:,:) = ZcplcChaFeSvReL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFeSvReL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvReL = ZcplcChaFeSvReL 
ZcplcChaFeSvReL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvReL(:,gt2,:) = ZcplcChaFeSvReL(:,gt2,:) + ZRUZEL(gt2,gt1)*TempcplcChaFeSvReL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvReL = ZcplcChaFeSvReL 
ZcplcChaFeSvReL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvReL(:,:,gt2) = ZcplcChaFeSvReL(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcChaFeSvReL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFeSvReR ## 
ZcplcChaFeSvReR = 0._dp 
TempcplcChaFeSvReR = cplcChaFeSvReR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFeSvReR(gt2,:,:) = ZcplcChaFeSvReR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFeSvReR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFeSvReR = ZcplcChaFeSvReR 
ZcplcChaFeSvReR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChaFeSvReR(:,gt2,:) = ZcplcChaFeSvReR(:,gt2,:) + ZRUZERc(gt2,gt1)*TempcplcChaFeSvReR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFeSvReR = ZcplcChaFeSvReR 
ZcplcChaFeSvReR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFeSvReR(:,:,gt2) = ZcplcChaFeSvReR(:,:,gt2) + ZRUZVR(gt2,gt1)*TempcplcChaFeSvReR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFucSuL ## 
ZcplGluFucSuL = 0._dp 
TempcplGluFucSuL = cplGluFucSuL 
ZcplGluFucSuL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFucSuL(gt2,:) = ZcplGluFucSuL(gt2,:) + ZRUZUL(gt2,gt1)*TempcplGluFucSuL(gt1,:) 
 End Do 
End Do 
TempcplGluFucSuL = ZcplGluFucSuL 
ZcplGluFucSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFucSuL(:,gt2) = ZcplGluFucSuL(:,gt2) + ZRUZUc(gt2,gt1)*TempcplGluFucSuL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplGluFucSuR ## 
ZcplGluFucSuR = 0._dp 
TempcplGluFucSuR = cplGluFucSuR 
ZcplGluFucSuR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplGluFucSuR(gt2,:) = ZcplGluFucSuR(gt2,:) + ZRUZURc(gt2,gt1)*TempcplGluFucSuR(gt1,:) 
 End Do 
End Do 
TempcplGluFucSuR = ZcplGluFucSuR 
ZcplGluFucSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplGluFucSuR(:,gt2) = ZcplGluFucSuR(:,gt2) + ZRUZUc(gt2,gt1)*TempcplGluFucSuR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhL ## 
ZcplcFuFuhhL = 0._dp 
TempcplcFuFuhhL = cplcFuFuhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(gt2,:,:) = ZcplcFuFuhhL(gt2,:,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(:,gt2,:) = ZcplcFuFuhhL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplcFuFuhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(:,:,gt2) = ZcplcFuFuhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFuFuhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhR ## 
ZcplcFuFuhhR = 0._dp 
TempcplcFuFuhhR = cplcFuFuhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(gt2,:,:) = ZcplcFuFuhhR(gt2,:,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(:,gt2,:) = ZcplcFuFuhhR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplcFuFuhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(:,:,gt2) = ZcplcFuFuhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFuFuhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFuHpmL ## 
ZcplcFdFuHpmL = 0._dp 
TempcplcFdFuHpmL = cplcFdFuHpmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmL(gt2,:,:) = ZcplcFdFuHpmL(gt2,:,:) + ZRUZDR(gt2,gt1)*TempcplcFdFuHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFuHpmL = ZcplcFdFuHpmL 
ZcplcFdFuHpmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmL(:,gt2,:) = ZcplcFdFuHpmL(:,gt2,:) + ZRUZUL(gt2,gt1)*TempcplcFdFuHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFuHpmL = ZcplcFdFuHpmL 
ZcplcFdFuHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFuHpmL(:,:,gt2) = ZcplcFdFuHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFdFuHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFuHpmR ## 
ZcplcFdFuHpmR = 0._dp 
TempcplcFdFuHpmR = cplcFdFuHpmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmR(gt2,:,:) = ZcplcFdFuHpmR(gt2,:,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFuHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFuHpmR = ZcplcFdFuHpmR 
ZcplcFdFuHpmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuHpmR(:,gt2,:) = ZcplcFdFuHpmR(:,gt2,:) + ZRUZURc(gt2,gt1)*TempcplcFdFuHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFuHpmR = ZcplcFdFuHpmR 
ZcplcFdFuHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFuHpmR(:,:,gt2) = ZcplcFdFuHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFdFuHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvhhL ## 
ZcplFvFvhhL = 0._dp 
TempcplFvFvhhL = cplFvFvhhL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhL(gt2,:,:) = ZcplFvFvhhL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFvhhL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvhhL = ZcplFvFvhhL 
ZcplFvFvhhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhL(:,gt2,:) = ZcplFvFvhhL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvhhL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvhhL = ZcplFvFvhhL 
ZcplFvFvhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvhhL(:,:,gt2) = ZcplFvFvhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplFvFvhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvhhR ## 
ZcplFvFvhhR = 0._dp 
TempcplFvFvhhR = cplFvFvhhR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhR(gt2,:,:) = ZcplFvFvhhR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFvhhR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvhhR = ZcplFvFvhhR 
ZcplFvFvhhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvhhR(:,gt2,:) = ZcplFvFvhhR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvhhR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvhhR = ZcplFvFvhhR 
ZcplFvFvhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvhhR(:,:,gt2) = ZcplFvFvhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplFvFvhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFvHpmL ## 
ZcplcFeFvHpmL = 0._dp 
TempcplcFeFvHpmL = cplcFeFvHpmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvHpmL(gt2,:,:) = ZcplcFeFvHpmL(gt2,:,:) + ZRUZER(gt2,gt1)*TempcplcFeFvHpmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFvHpmL = ZcplcFeFvHpmL 
ZcplcFeFvHpmL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvHpmL(:,gt2,:) = ZcplcFeFvHpmL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplcFeFvHpmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFvHpmL = ZcplcFeFvHpmL 
ZcplcFeFvHpmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFvHpmL(:,:,gt2) = ZcplcFeFvHpmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFeFvHpmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFvHpmR ## 
ZcplcFeFvHpmR = 0._dp 
TempcplcFeFvHpmR = cplcFeFvHpmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvHpmR(gt2,:,:) = ZcplcFeFvHpmR(gt2,:,:) + ZRUZELc(gt2,gt1)*TempcplcFeFvHpmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFvHpmR = ZcplcFeFvHpmR 
ZcplcFeFvHpmR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvHpmR(:,gt2,:) = ZcplcFeFvHpmR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplcFeFvHpmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFvHpmR = ZcplcFeFvHpmR 
ZcplcFeFvHpmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFvHpmR(:,:,gt2) = ZcplcFeFvHpmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFeFvHpmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFvSeL ## 
ZcplcChaFvSeL = 0._dp 
TempcplcChaFvSeL = cplcChaFvSeL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFvSeL(gt2,:,:) = ZcplcChaFvSeL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChaFvSeL(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFvSeL = ZcplcChaFvSeL 
ZcplcChaFvSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeL(:,gt2,:) = ZcplcChaFvSeL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplcChaFvSeL(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFvSeL = ZcplcChaFvSeL 
ZcplcChaFvSeL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeL(:,:,gt2) = ZcplcChaFvSeL(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcChaFvSeL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChaFvSeR ## 
ZcplcChaFvSeR = 0._dp 
TempcplcChaFvSeR = cplcChaFvSeR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaFvSeR(gt2,:,:) = ZcplcChaFvSeR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChaFvSeR(gt1,:,:) 
 End Do 
End Do 
TempcplcChaFvSeR = ZcplcChaFvSeR 
ZcplcChaFvSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeR(:,gt2,:) = ZcplcChaFvSeR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplcChaFvSeR(:,gt1,:) 
 End Do 
End Do 
TempcplcChaFvSeR = ZcplcChaFvSeR 
ZcplcChaFvSeR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChaFvSeR(:,:,gt2) = ZcplcChaFvSeR(:,:,gt2) + ZRUZE(gt2,gt1)*TempcplcChaFvSeR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdGluSdL ## 
ZcplcFdGluSdL = 0._dp 
TempcplcFdGluSdL = cplcFdGluSdL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdGluSdL(gt2,:) = ZcplcFdGluSdL(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdGluSdL(gt1,:) 
 End Do 
End Do 
TempcplcFdGluSdL = ZcplcFdGluSdL 
ZcplcFdGluSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdGluSdL(:,gt2) = ZcplcFdGluSdL(:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdGluSdL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdGluSdR ## 
ZcplcFdGluSdR = 0._dp 
TempcplcFdGluSdR = cplcFdGluSdR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdGluSdR(gt2,:) = ZcplcFdGluSdR(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdGluSdR(gt1,:) 
 End Do 
End Do 
TempcplcFdGluSdR = ZcplcFdGluSdR 
ZcplcFdGluSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdGluSdR(:,gt2) = ZcplcFdGluSdR(:,gt2) + ZRUZD(gt2,gt1)*TempcplcFdGluSdR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuGluSuL ## 
ZcplcFuGluSuL = 0._dp 
TempcplcFuGluSuL = cplcFuGluSuL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuGluSuL(gt2,:) = ZcplcFuGluSuL(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuGluSuL(gt1,:) 
 End Do 
End Do 
TempcplcFuGluSuL = ZcplcFuGluSuL 
ZcplcFuGluSuL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuGluSuL(:,gt2) = ZcplcFuGluSuL(:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuGluSuL(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuGluSuR ## 
ZcplcFuGluSuR = 0._dp 
TempcplcFuGluSuR = cplcFuGluSuR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuGluSuR(gt2,:) = ZcplcFuGluSuR(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuGluSuR(gt1,:) 
 End Do 
End Do 
TempcplcFuGluSuR = ZcplcFuGluSuR 
ZcplcFuGluSuR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuGluSuR(:,gt2) = ZcplcFuGluSuR(:,gt2) + ZRUZU(gt2,gt1)*TempcplcFuGluSuR(:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChacFuSdL ## 
ZcplcChacFuSdL = 0._dp 
TempcplcChacFuSdL = cplcChacFuSdL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChacFuSdL(gt2,:,:) = ZcplcChacFuSdL(gt2,:,:) + ZRUUP(gt2,gt1)*TempcplcChacFuSdL(gt1,:,:) 
 End Do 
End Do 
TempcplcChacFuSdL = ZcplcChacFuSdL 
ZcplcChacFuSdL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChacFuSdL(:,gt2,:) = ZcplcChacFuSdL(:,gt2,:) + ZRUZUR(gt2,gt1)*TempcplcChacFuSdL(:,gt1,:) 
 End Do 
End Do 
TempcplcChacFuSdL = ZcplcChacFuSdL 
ZcplcChacFuSdL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChacFuSdL(:,:,gt2) = ZcplcChacFuSdL(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcChacFuSdL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcChacFuSdR ## 
ZcplcChacFuSdR = 0._dp 
TempcplcChacFuSdR = cplcChacFuSdR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChacFuSdR(gt2,:,:) = ZcplcChacFuSdR(gt2,:,:) + ZRUUMc(gt2,gt1)*TempcplcChacFuSdR(gt1,:,:) 
 End Do 
End Do 
TempcplcChacFuSdR = ZcplcChacFuSdR 
ZcplcChacFuSdR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcChacFuSdR(:,gt2,:) = ZcplcChacFuSdR(:,gt2,:) + ZRUZULc(gt2,gt1)*TempcplcChacFuSdR(:,gt1,:) 
 End Do 
End Do 
TempcplcChacFuSdR = ZcplcChacFuSdR 
ZcplcChacFuSdR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcChacFuSdR(:,:,gt2) = ZcplcChacFuSdR(:,:,gt2) + ZRUZD(gt2,gt1)*TempcplcChacFuSdR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplChiChacVWmL ## 
ZcplChiChacVWmL = 0._dp 
TempcplChiChacVWmL = cplChiChacVWmL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChacVWmL(gt2,:) = ZcplChiChacVWmL(gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChacVWmL(gt1,:) 
 End Do 
End Do 
TempcplChiChacVWmL = ZcplChiChacVWmL 
ZcplChiChacVWmL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacVWmL(:,gt2) = ZcplChiChacVWmL(:,gt2) + ZRUUM(gt2,gt1)*TempcplChiChacVWmL(:,gt1) 
 End Do 
End Do 
TempcplChiChacVWmL = ZcplChiChacVWmL 


 ! ## ZcplChiChacVWmR ## 
ZcplChiChacVWmR = 0._dp 
TempcplChiChacVWmR = cplChiChacVWmR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChacVWmR(gt2,:) = ZcplChiChacVWmR(gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChacVWmR(gt1,:) 
 End Do 
End Do 
TempcplChiChacVWmR = ZcplChiChacVWmR 
ZcplChiChacVWmR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplChiChacVWmR(:,gt2) = ZcplChiChacVWmR(:,gt2) + ZRUUPc(gt2,gt1)*TempcplChiChacVWmR(:,gt1) 
 End Do 
End Do 
TempcplChiChacVWmR = ZcplChiChacVWmR 


 ! ## ZcplcChaChaVPL ## 
ZcplcChaChaVPL = 0._dp 
TempcplcChaChaVPL = cplcChaChaVPL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPL(gt2,:) = ZcplcChaChaVPL(gt2,:) + ZRUUMc(gt2,gt1)*TempcplcChaChaVPL(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVPL = ZcplcChaChaVPL 
ZcplcChaChaVPL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPL(:,gt2) = ZcplcChaChaVPL(:,gt2) + ZRUUM(gt2,gt1)*TempcplcChaChaVPL(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVPL = ZcplcChaChaVPL 


 ! ## ZcplcChaChaVPR ## 
ZcplcChaChaVPR = 0._dp 
TempcplcChaChaVPR = cplcChaChaVPR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPR(gt2,:) = ZcplcChaChaVPR(gt2,:) + ZRUUP(gt2,gt1)*TempcplcChaChaVPR(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVPR = ZcplcChaChaVPR 
ZcplcChaChaVPR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVPR(:,gt2) = ZcplcChaChaVPR(:,gt2) + ZRUUPc(gt2,gt1)*TempcplcChaChaVPR(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVPR = ZcplcChaChaVPR 


 ! ## ZcplcChaChaVZL ## 
ZcplcChaChaVZL = 0._dp 
TempcplcChaChaVZL = cplcChaChaVZL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZL(gt2,:) = ZcplcChaChaVZL(gt2,:) + ZRUUMc(gt2,gt1)*TempcplcChaChaVZL(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVZL = ZcplcChaChaVZL 
ZcplcChaChaVZL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZL(:,gt2) = ZcplcChaChaVZL(:,gt2) + ZRUUM(gt2,gt1)*TempcplcChaChaVZL(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVZL = ZcplcChaChaVZL 


 ! ## ZcplcChaChaVZR ## 
ZcplcChaChaVZR = 0._dp 
TempcplcChaChaVZR = cplcChaChaVZR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZR(gt2,:) = ZcplcChaChaVZR(gt2,:) + ZRUUP(gt2,gt1)*TempcplcChaChaVZR(gt1,:) 
 End Do 
End Do 
TempcplcChaChaVZR = ZcplcChaChaVZR 
ZcplcChaChaVZR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChaVZR(:,gt2) = ZcplcChaChaVZR(:,gt2) + ZRUUPc(gt2,gt1)*TempcplcChaChaVZR(:,gt1) 
 End Do 
End Do 
TempcplcChaChaVZR = ZcplcChaChaVZR 


 ! ## ZcplChiChiVZL ## 
ZcplChiChiVZL = 0._dp 
TempcplChiChiVZL = cplChiChiVZL 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiVZL(gt2,:) = ZcplChiChiVZL(gt2,:) + ZRUZNc(gt2,gt1)*TempcplChiChiVZL(gt1,:) 
 End Do 
End Do 
TempcplChiChiVZL = ZcplChiChiVZL 
ZcplChiChiVZL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiVZL(:,gt2) = ZcplChiChiVZL(:,gt2) + ZRUZN(gt2,gt1)*TempcplChiChiVZL(:,gt1) 
 End Do 
End Do 
TempcplChiChiVZL = ZcplChiChiVZL 


 ! ## ZcplChiChiVZR ## 
ZcplChiChiVZR = 0._dp 
TempcplChiChiVZR = cplChiChiVZR 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiVZR(gt2,:) = ZcplChiChiVZR(gt2,:) + ZRUZN(gt2,gt1)*TempcplChiChiVZR(gt1,:) 
 End Do 
End Do 
TempcplChiChiVZR = ZcplChiChiVZR 
ZcplChiChiVZR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplChiChiVZR(:,gt2) = ZcplChiChiVZR(:,gt2) + ZRUZNc(gt2,gt1)*TempcplChiChiVZR(:,gt1) 
 End Do 
End Do 
TempcplChiChiVZR = ZcplChiChiVZR 


 ! ## ZcplcChaChiVWmL ## 
ZcplcChaChiVWmL = 0._dp 
TempcplcChaChiVWmL = cplcChaChiVWmL 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiVWmL(gt2,:) = ZcplcChaChiVWmL(gt2,:) + ZRUUMc(gt2,gt1)*TempcplcChaChiVWmL(gt1,:) 
 End Do 
End Do 
TempcplcChaChiVWmL = ZcplcChaChiVWmL 
ZcplcChaChiVWmL = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcChaChiVWmL(:,gt2) = ZcplcChaChiVWmL(:,gt2) + ZRUZN(gt2,gt1)*TempcplcChaChiVWmL(:,gt1) 
 End Do 
End Do 
TempcplcChaChiVWmL = ZcplcChaChiVWmL 


 ! ## ZcplcChaChiVWmR ## 
ZcplcChaChiVWmR = 0._dp 
TempcplcChaChiVWmR = cplcChaChiVWmR 
Do gt1=1,2
  Do gt2=1,2
ZcplcChaChiVWmR(gt2,:) = ZcplcChaChiVWmR(gt2,:) + ZRUUP(gt2,gt1)*TempcplcChaChiVWmR(gt1,:) 
 End Do 
End Do 
TempcplcChaChiVWmR = ZcplcChaChiVWmR 
ZcplcChaChiVWmR = 0._dp 
Do gt1=1,5
  Do gt2=1,5
ZcplcChaChiVWmR(:,gt2) = ZcplcChaChiVWmR(:,gt2) + ZRUZNc(gt2,gt1)*TempcplcChaChiVWmR(:,gt1) 
 End Do 
End Do 
TempcplcChaChiVWmR = ZcplcChaChiVWmR 


 ! ## ZcplcFdFdVGL ## 
ZcplcFdFdVGL = 0._dp 
TempcplcFdFdVGL = cplcFdFdVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(gt2,:) = ZcplcFdFdVGL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdVGL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 
ZcplcFdFdVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(:,gt2) = ZcplcFdFdVGL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFdFdVGL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 


 ! ## ZcplcFdFdVGR ## 
ZcplcFdFdVGR = 0._dp 
TempcplcFdFdVGR = cplcFdFdVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(gt2,:) = ZcplcFdFdVGR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdVGR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 
ZcplcFdFdVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(:,gt2) = ZcplcFdFdVGR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFdFdVGR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 


 ! ## ZcplcFdFdVPL ## 
ZcplcFdFdVPL = 0._dp 
TempcplcFdFdVPL = cplcFdFdVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(gt2,:) = ZcplcFdFdVPL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdVPL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 
ZcplcFdFdVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(:,gt2) = ZcplcFdFdVPL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFdFdVPL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 


 ! ## ZcplcFdFdVPR ## 
ZcplcFdFdVPR = 0._dp 
TempcplcFdFdVPR = cplcFdFdVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(gt2,:) = ZcplcFdFdVPR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdVPR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 
ZcplcFdFdVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(:,gt2) = ZcplcFdFdVPR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFdFdVPR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 


 ! ## ZcplcFdFdVZL ## 
ZcplcFdFdVZL = 0._dp 
TempcplcFdFdVZL = cplcFdFdVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(gt2,:) = ZcplcFdFdVZL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFdVZL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 
ZcplcFdFdVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(:,gt2) = ZcplcFdFdVZL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFdFdVZL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 


 ! ## ZcplcFdFdVZR ## 
ZcplcFdFdVZR = 0._dp 
TempcplcFdFdVZR = cplcFdFdVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(gt2,:) = ZcplcFdFdVZR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFdVZR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 
ZcplcFdFdVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(:,gt2) = ZcplcFdFdVZR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFdFdVZR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 


 ! ## ZcplcFuFdcVWmL ## 
ZcplcFuFdcVWmL = 0._dp 
TempcplcFuFdcVWmL = cplcFuFdcVWmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmL(gt2,:) = ZcplcFuFdcVWmL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFdcVWmL(gt1,:) 
 End Do 
End Do 
TempcplcFuFdcVWmL = ZcplcFuFdcVWmL 
ZcplcFuFdcVWmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmL(:,gt2) = ZcplcFuFdcVWmL(:,gt2) + ZRUZDL(gt2,gt1)*TempcplcFuFdcVWmL(:,gt1) 
 End Do 
End Do 
TempcplcFuFdcVWmL = ZcplcFuFdcVWmL 


 ! ## ZcplcFuFdcVWmR ## 
ZcplcFuFdcVWmR = 0._dp 
TempcplcFuFdcVWmR = cplcFuFdcVWmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmR(gt2,:) = ZcplcFuFdcVWmR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFdcVWmR(gt1,:) 
 End Do 
End Do 
TempcplcFuFdcVWmR = ZcplcFuFdcVWmR 
ZcplcFuFdcVWmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWmR(:,gt2) = ZcplcFuFdcVWmR(:,gt2) + ZRUZDRc(gt2,gt1)*TempcplcFuFdcVWmR(:,gt1) 
 End Do 
End Do 
TempcplcFuFdcVWmR = ZcplcFuFdcVWmR 


 ! ## ZcplFvFecVWmL ## 
ZcplFvFecVWmL = 0._dp 
TempcplFvFecVWmL = cplFvFecVWmL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecVWmL(gt2,:) = ZcplFvFecVWmL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFecVWmL(gt1,:) 
 End Do 
End Do 
TempcplFvFecVWmL = ZcplFvFecVWmL 
ZcplFvFecVWmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWmL(:,gt2) = ZcplFvFecVWmL(:,gt2) + ZRUZEL(gt2,gt1)*TempcplFvFecVWmL(:,gt1) 
 End Do 
End Do 
TempcplFvFecVWmL = ZcplFvFecVWmL 


 ! ## ZcplFvFecVWmR ## 
ZcplFvFecVWmR = 0._dp 
TempcplFvFecVWmR = cplFvFecVWmR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFecVWmR(gt2,:) = ZcplFvFecVWmR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFecVWmR(gt1,:) 
 End Do 
End Do 
TempcplFvFecVWmR = ZcplFvFecVWmR 
ZcplFvFecVWmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWmR(:,gt2) = ZcplFvFecVWmR(:,gt2) + ZRUZERc(gt2,gt1)*TempcplFvFecVWmR(:,gt1) 
 End Do 
End Do 
TempcplFvFecVWmR = ZcplFvFecVWmR 


 ! ## ZcplcFeFeVPL ## 
ZcplcFeFeVPL = 0._dp 
TempcplcFeFeVPL = cplcFeFeVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(gt2,:) = ZcplcFeFeVPL(gt2,:) + ZRUZELc(gt2,gt1)*TempcplcFeFeVPL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 
ZcplcFeFeVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(:,gt2) = ZcplcFeFeVPL(:,gt2) + ZRUZEL(gt2,gt1)*TempcplcFeFeVPL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 


 ! ## ZcplcFeFeVPR ## 
ZcplcFeFeVPR = 0._dp 
TempcplcFeFeVPR = cplcFeFeVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(gt2,:) = ZcplcFeFeVPR(gt2,:) + ZRUZER(gt2,gt1)*TempcplcFeFeVPR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 
ZcplcFeFeVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(:,gt2) = ZcplcFeFeVPR(:,gt2) + ZRUZERc(gt2,gt1)*TempcplcFeFeVPR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 


 ! ## ZcplcFeFeVZL ## 
ZcplcFeFeVZL = 0._dp 
TempcplcFeFeVZL = cplcFeFeVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(gt2,:) = ZcplcFeFeVZL(gt2,:) + ZRUZELc(gt2,gt1)*TempcplcFeFeVZL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 
ZcplcFeFeVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(:,gt2) = ZcplcFeFeVZL(:,gt2) + ZRUZEL(gt2,gt1)*TempcplcFeFeVZL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 


 ! ## ZcplcFeFeVZR ## 
ZcplcFeFeVZR = 0._dp 
TempcplcFeFeVZR = cplcFeFeVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(gt2,:) = ZcplcFeFeVZR(gt2,:) + ZRUZER(gt2,gt1)*TempcplcFeFeVZR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 
ZcplcFeFeVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(:,gt2) = ZcplcFeFeVZR(:,gt2) + ZRUZERc(gt2,gt1)*TempcplcFeFeVZR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 


 ! ## ZcplcFuFuVGL ## 
ZcplcFuFuVGL = 0._dp 
TempcplcFuFuVGL = cplcFuFuVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(gt2,:) = ZcplcFuFuVGL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuVGL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 
ZcplcFuFuVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(:,gt2) = ZcplcFuFuVGL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFuFuVGL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 


 ! ## ZcplcFuFuVGR ## 
ZcplcFuFuVGR = 0._dp 
TempcplcFuFuVGR = cplcFuFuVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(gt2,:) = ZcplcFuFuVGR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuVGR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 
ZcplcFuFuVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(:,gt2) = ZcplcFuFuVGR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFuFuVGR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 


 ! ## ZcplcFuFuVPL ## 
ZcplcFuFuVPL = 0._dp 
TempcplcFuFuVPL = cplcFuFuVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(gt2,:) = ZcplcFuFuVPL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuVPL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 
ZcplcFuFuVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(:,gt2) = ZcplcFuFuVPL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFuFuVPL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 


 ! ## ZcplcFuFuVPR ## 
ZcplcFuFuVPR = 0._dp 
TempcplcFuFuVPR = cplcFuFuVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(gt2,:) = ZcplcFuFuVPR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuVPR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 
ZcplcFuFuVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(:,gt2) = ZcplcFuFuVPR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFuFuVPR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 


 ! ## ZcplcFdFuVWmL ## 
ZcplcFdFuVWmL = 0._dp 
TempcplcFdFuVWmL = cplcFdFuVWmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmL(gt2,:) = ZcplcFdFuVWmL(gt2,:) + ZRUZDLc(gt2,gt1)*TempcplcFdFuVWmL(gt1,:) 
 End Do 
End Do 
TempcplcFdFuVWmL = ZcplcFdFuVWmL 
ZcplcFdFuVWmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmL(:,gt2) = ZcplcFdFuVWmL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFdFuVWmL(:,gt1) 
 End Do 
End Do 
TempcplcFdFuVWmL = ZcplcFdFuVWmL 


 ! ## ZcplcFdFuVWmR ## 
ZcplcFdFuVWmR = 0._dp 
TempcplcFdFuVWmR = cplcFdFuVWmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmR(gt2,:) = ZcplcFdFuVWmR(gt2,:) + ZRUZDR(gt2,gt1)*TempcplcFdFuVWmR(gt1,:) 
 End Do 
End Do 
TempcplcFdFuVWmR = ZcplcFdFuVWmR 
ZcplcFdFuVWmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWmR(:,gt2) = ZcplcFdFuVWmR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFdFuVWmR(:,gt1) 
 End Do 
End Do 
TempcplcFdFuVWmR = ZcplcFdFuVWmR 


 ! ## ZcplcFuFuVZL ## 
ZcplcFuFuVZL = 0._dp 
TempcplcFuFuVZL = cplcFuFuVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(gt2,:) = ZcplcFuFuVZL(gt2,:) + ZRUZULc(gt2,gt1)*TempcplcFuFuVZL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 
ZcplcFuFuVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(:,gt2) = ZcplcFuFuVZL(:,gt2) + ZRUZUL(gt2,gt1)*TempcplcFuFuVZL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 


 ! ## ZcplcFuFuVZR ## 
ZcplcFuFuVZR = 0._dp 
TempcplcFuFuVZR = cplcFuFuVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(gt2,:) = ZcplcFuFuVZR(gt2,:) + ZRUZUR(gt2,gt1)*TempcplcFuFuVZR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 
ZcplcFuFuVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(:,gt2) = ZcplcFuFuVZR(:,gt2) + ZRUZURc(gt2,gt1)*TempcplcFuFuVZR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 


 ! ## ZcplFvFvVZL ## 
ZcplFvFvVZL = 0._dp 
TempcplFvFvVZL = cplFvFvVZL 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZL(gt2,:) = ZcplFvFvVZL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvVZL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 
ZcplFvFvVZL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZL(:,gt2) = ZcplFvFvVZL(:,gt2) + ZRUUV(gt2,gt1)*TempcplFvFvVZL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 


 ! ## ZcplFvFvVZR ## 
ZcplFvFvVZR = 0._dp 
TempcplFvFvVZR = cplFvFvVZR 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZR(gt2,:) = ZcplFvFvVZR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvVZR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 
ZcplFvFvVZR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFvVZR(:,gt2) = ZcplFvFvVZR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplFvFvVZR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 


 ! ## ZcplcFeFvVWmL ## 
ZcplcFeFvVWmL = 0._dp 
TempcplcFeFvVWmL = cplcFeFvVWmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWmL(gt2,:) = ZcplcFeFvVWmL(gt2,:) + ZRUZELc(gt2,gt1)*TempcplcFeFvVWmL(gt1,:) 
 End Do 
End Do 
TempcplcFeFvVWmL = ZcplcFeFvVWmL 
ZcplcFeFvVWmL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvVWmL(:,gt2) = ZcplcFeFvVWmL(:,gt2) + ZRUUV(gt2,gt1)*TempcplcFeFvVWmL(:,gt1) 
 End Do 
End Do 
TempcplcFeFvVWmL = ZcplcFeFvVWmL 


 ! ## ZcplcFeFvVWmR ## 
ZcplcFeFvVWmR = 0._dp 
TempcplcFeFvVWmR = cplcFeFvVWmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWmR(gt2,:) = ZcplcFeFvVWmR(gt2,:) + ZRUZER(gt2,gt1)*TempcplcFeFvVWmR(gt1,:) 
 End Do 
End Do 
TempcplcFeFvVWmR = ZcplcFeFvVWmR 
ZcplcFeFvVWmR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvVWmR(:,gt2) = ZcplcFeFvVWmR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplcFeFvVWmR(:,gt1) 
 End Do 
End Do 
TempcplcFeFvVWmR = ZcplcFeFvVWmR 


 ! ## ZcplGluGluVGL ## 
ZcplGluGluVGL = 0._dp 
TempcplGluGluVGL = cplGluGluVGL 
ZcplGluGluVGL = TempcplGluGluVGL 


 ! ## ZcplGluGluVGR ## 
ZcplGluGluVGR = 0._dp 
TempcplGluGluVGR = cplGluGluVGR 
ZcplGluGluVGR = TempcplGluGluVGR 


 ! ## ZcplVGVGVGVG1 ## 
ZcplVGVGVGVG1 = 0._dp 


 ! ## ZcplVGVGVGVG2 ## 
ZcplVGVGVGVG2 = 0._dp 


 ! ## ZcplVGVGVGVG3 ## 
ZcplVGVGVGVG3 = 0._dp 


 ! ## ZcplcVWmVPVPVWm1 ## 
ZcplcVWmVPVPVWm1 = 0._dp 


 ! ## ZcplcVWmVPVPVWm2 ## 
ZcplcVWmVPVPVWm2 = 0._dp 


 ! ## ZcplcVWmVPVPVWm3 ## 
ZcplcVWmVPVPVWm3 = 0._dp 


 ! ## ZcplcVWmVPVWmVZ1 ## 
ZcplcVWmVPVWmVZ1 = 0._dp 


 ! ## ZcplcVWmVPVWmVZ2 ## 
ZcplcVWmVPVWmVZ2 = 0._dp 


 ! ## ZcplcVWmVPVWmVZ3 ## 
ZcplcVWmVPVWmVZ3 = 0._dp 


 ! ## ZcplcVWmcVWmVWmVWm1 ## 
ZcplcVWmcVWmVWmVWm1 = 0._dp 


 ! ## ZcplcVWmcVWmVWmVWm2 ## 
ZcplcVWmcVWmVWmVWm2 = 0._dp 


 ! ## ZcplcVWmcVWmVWmVWm3 ## 
ZcplcVWmcVWmVWmVWm3 = 0._dp 


 ! ## ZcplcVWmVWmVZVZ1 ## 
ZcplcVWmVWmVZVZ1 = 0._dp 


 ! ## ZcplcVWmVWmVZVZ2 ## 
ZcplcVWmVWmVZVZ2 = 0._dp 


 ! ## ZcplcVWmVWmVZVZ3 ## 
ZcplcVWmVWmVZVZ3 = 0._dp 


 ! ## ZcplcgGgGVG ## 
ZcplcgGgGVG = 0._dp 
TempcplcgGgGVG = cplcgGgGVG 
ZcplcgGgGVG = TempcplcgGgGVG 


 ! ## ZcplcgWmgAVWm ## 
ZcplcgWmgAVWm = 0._dp 
TempcplcgWmgAVWm = cplcgWmgAVWm 
ZcplcgWmgAVWm = TempcplcgWmgAVWm 


 ! ## ZcplcgWpCgAcVWm ## 
ZcplcgWpCgAcVWm = 0._dp 
TempcplcgWpCgAcVWm = cplcgWpCgAcVWm 
ZcplcgWpCgAcVWm = TempcplcgWpCgAcVWm 


 ! ## ZcplcgWmgWmVP ## 
ZcplcgWmgWmVP = 0._dp 
TempcplcgWmgWmVP = cplcgWmgWmVP 
ZcplcgWmgWmVP = TempcplcgWmgWmVP 


 ! ## ZcplcgWmgWmVZ ## 
ZcplcgWmgWmVZ = 0._dp 
TempcplcgWmgWmVZ = cplcgWmgWmVZ 
ZcplcgWmgWmVZ = TempcplcgWmgWmVZ 


 ! ## ZcplcgAgWmcVWm ## 
ZcplcgAgWmcVWm = 0._dp 
TempcplcgAgWmcVWm = cplcgAgWmcVWm 
ZcplcgAgWmcVWm = TempcplcgAgWmcVWm 


 ! ## ZcplcgZgWmcVWm ## 
ZcplcgZgWmcVWm = 0._dp 
TempcplcgZgWmcVWm = cplcgZgWmcVWm 
ZcplcgZgWmcVWm = TempcplcgZgWmcVWm 


 ! ## ZcplcgWpCgWpCVP ## 
ZcplcgWpCgWpCVP = 0._dp 
TempcplcgWpCgWpCVP = cplcgWpCgWpCVP 
ZcplcgWpCgWpCVP = TempcplcgWpCgWpCVP 


 ! ## ZcplcgAgWpCVWm ## 
ZcplcgAgWpCVWm = 0._dp 
TempcplcgAgWpCVWm = cplcgAgWpCVWm 
ZcplcgAgWpCVWm = TempcplcgAgWpCVWm 


 ! ## ZcplcgZgWpCVWm ## 
ZcplcgZgWpCVWm = 0._dp 
TempcplcgZgWpCVWm = cplcgZgWpCVWm 
ZcplcgZgWpCVWm = TempcplcgZgWpCVWm 


 ! ## ZcplcgWpCgWpCVZ ## 
ZcplcgWpCgWpCVZ = 0._dp 
TempcplcgWpCgWpCVZ = cplcgWpCgWpCVZ 
ZcplcgWpCgWpCVZ = TempcplcgWpCgWpCVZ 


 ! ## ZcplcgWmgZVWm ## 
ZcplcgWmgZVWm = 0._dp 
TempcplcgWmgZVWm = cplcgWmgZVWm 
ZcplcgWmgZVWm = TempcplcgWmgZVWm 


 ! ## ZcplcgWpCgZcVWm ## 
ZcplcgWpCgZcVWm = 0._dp 
TempcplcgWpCgZcVWm = cplcgWpCgZcVWm 
ZcplcgWpCgZcVWm = TempcplcgWpCgZcVWm 


 ! ## ZcplcgWmgWmAh ## 
ZcplcgWmgWmAh = 0._dp 
TempcplcgWmgWmAh = cplcgWmgWmAh 
ZcplcgWmgWmAh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWmgWmAh(gt2) = ZcplcgWmgWmAh(gt2) + ZRUZA(gt2,gt1)*TempcplcgWmgWmAh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgWpCAh ## 
ZcplcgWpCgWpCAh = 0._dp 
TempcplcgWpCgWpCAh = cplcgWpCgWpCAh 
ZcplcgWpCgWpCAh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWpCgWpCAh(gt2) = ZcplcgWpCgWpCAh(gt2) + ZRUZA(gt2,gt1)*TempcplcgWpCgWpCAh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgAhh ## 
ZcplcgZgAhh = 0._dp 
TempcplcgZgAhh = cplcgZgAhh 
ZcplcgZgAhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgZgAhh(gt2) = ZcplcgZgAhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZgAhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWmgAHpm ## 
ZcplcgWmgAHpm = 0._dp 
TempcplcgWmgAHpm = cplcgWmgAHpm 
ZcplcgWmgAHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWmgAHpm(gt2) = ZcplcgWmgAHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWmgAHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgAcHpm ## 
ZcplcgWpCgAcHpm = 0._dp 
TempcplcgWpCgAcHpm = cplcgWpCgAcHpm 
ZcplcgWpCgAcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpCgAcHpm(gt2) = ZcplcgWpCgAcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWpCgAcHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWmgWmhh ## 
ZcplcgWmgWmhh = 0._dp 
TempcplcgWmgWmhh = cplcgWmgWmhh 
ZcplcgWmgWmhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWmgWmhh(gt2) = ZcplcgWmgWmhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgWmgWmhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWmcHpm ## 
ZcplcgZgWmcHpm = 0._dp 
TempcplcgZgWmcHpm = cplcgZgWmcHpm 
ZcplcgZgWmcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgWmcHpm(gt2) = ZcplcgZgWmcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZgWmcHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgWpChh ## 
ZcplcgWpCgWpChh = 0._dp 
TempcplcgWpCgWpChh = cplcgWpCgWpChh 
ZcplcgWpCgWpChh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWpCgWpChh(gt2) = ZcplcgWpCgWpChh(gt2) + ZRUZH(gt2,gt1)*TempcplcgWpCgWpChh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWpCHpm ## 
ZcplcgZgWpCHpm = 0._dp 
TempcplcgZgWpCHpm = cplcgZgWpCHpm 
ZcplcgZgWpCHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgWpCHpm(gt2) = ZcplcgZgWpCHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZgWpCHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgZhh ## 
ZcplcgZgZhh = 0._dp 
TempcplcgZgZhh = cplcgZgZhh 
ZcplcgZgZhh = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgZgZhh(gt2) = ZcplcgZgZhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZgZhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWmgZHpm ## 
ZcplcgWmgZHpm = 0._dp 
TempcplcgWmgZHpm = cplcgWmgZHpm 
ZcplcgWmgZHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWmgZHpm(gt2) = ZcplcgWmgZHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWmgZHpm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpCgZcHpm ## 
ZcplcgWpCgZcHpm = 0._dp 
TempcplcgWpCgZcHpm = cplcgWpCgZcHpm 
ZcplcgWpCgZcHpm = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpCgZcHpm(gt2) = ZcplcgWpCgZcHpm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWpCgZcHpm(gt1) 
 End Do 
End Do 
End Subroutine  getZCouplings 

Subroutine getGBCouplings(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,             & 
& MSuOS,MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,             & 
& MChi2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,            & 
& MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,            & 
& ZAOS,ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,            & 
& MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,             & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,              & 
& ZUR,ZVI,ZVR,ZW,ZZ,betaH,cplAhcHpmVWm,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFuVWmL,       & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,       & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,ZcplAhcHpmVWm,ZcplcChaChiVWmL,ZcplcChaChiVWmR, & 
& ZcplcFdFuVWmL,ZcplcFdFuVWmR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR, & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,ZcplcVWmVPVWm,             & 
& ZcplcVWmVWmVZ,ZcplFvFecVWmL,ZcplFvFecVWmR,ZcplhhcHpmVWm,ZcplhhcVWmVWm,ZcplSdcSucVWm,   & 
& ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSucSdVWm,ZcplSvImcSeVWm,ZcplSvRecSeVWm,              & 
& GcplAhHpmcHpm,GcplhhHpmcHpm,GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe,GcplSdcHpmcSu,  & 
& GcplSeSvImcHpm,GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,GcplhhHpmcVWm,               & 
& GcplhhcHpmVWm,GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,GcplcHpmVPVWm,   & 
& GcplcHpmVWmVZ,GcplChiChacHpmL,GcplChiChacHpmR,GcplcChaChiHpmL,GcplcChaChiHpmR,         & 
& GcplcFuFdcHpmL,GcplcFuFdcHpmR,GcplFvFecHpmL,GcplFvFecHpmR,GcplcFdFuHpmL,               & 
& GcplcFdFuHpmR,GcplcFeFvHpmL,GcplcFeFvHpmR,GZcplAhHpmcHpm,GZcplhhHpmcHpm,               & 
& GZcplHpmSucSd,GZcplHpmSvImcSe,GZcplHpmSvRecSe,GZcplSdcHpmcSu,GZcplSeSvImcHpm,          & 
& GZcplSeSvRecHpm,GZcplAhHpmcVWm,GZcplAhcHpmVWm,GZcplhhHpmcVWm,GZcplhhcHpmVWm,           & 
& GZcplHpmcHpmVP,GZcplHpmcHpmVZ,GZcplHpmcVWmVP,GZcplHpmcVWmVZ,GZcplcHpmVPVWm,            & 
& GZcplcHpmVWmVZ,GZcplChiChacHpmL,GZcplChiChacHpmR,GZcplcChaChiHpmL,GZcplcChaChiHpmR,    & 
& GZcplcFuFdcHpmL,GZcplcFuFdcHpmR,GZcplFvFecHpmL,GZcplFvFecHpmR,GZcplcFdFuHpmL,          & 
& GZcplcFdFuHpmR,GZcplcFeFvHpmL,GZcplcFeFvHpmR,GosZcplAhHpmcHpm,GosZcplhhHpmcHpm,        & 
& GosZcplHpmSucSd,GosZcplHpmSvImcSe,GosZcplHpmSvRecSe,GosZcplSdcHpmcSu,GosZcplSeSvImcHpm,& 
& GosZcplSeSvRecHpm,GosZcplAhHpmcVWm,GosZcplAhcHpmVWm,GosZcplhhHpmcVWm,GosZcplhhcHpmVWm, & 
& GosZcplHpmcHpmVP,GosZcplHpmcHpmVZ,GosZcplHpmcVWmVP,GosZcplHpmcVWmVZ,GosZcplcHpmVPVWm,  & 
& GosZcplcHpmVWmVZ,GosZcplChiChacHpmL,GosZcplChiChacHpmR,GosZcplcChaChiHpmL,             & 
& GosZcplcChaChiHpmR,GosZcplcFuFdcHpmL,GosZcplcFuFdcHpmR,GosZcplFvFecHpmL,               & 
& GosZcplFvFecHpmR,GosZcplcFdFuHpmL,GosZcplcFdFuHpmR,GosZcplcFeFvHpmL,GosZcplcFeFvHpmR)

Implicit None

Real(dp), Intent(in) :: MSdOS(6),MSd2OS(6),MSvImOS(6),MSvIm2OS(6),MSvReOS(6),MSvRe2OS(6),MSuOS(6),            & 
& MSu2OS(6),MSeOS(6),MSe2OS(6),MhhOS(3),Mhh2OS(3),MAhOS(3),MAh2OS(3),MHpmOS(2),          & 
& MHpm2OS(2),MChiOS(5),MChi2OS(5),MFvOS(6),MFv2OS(6),MChaOS(2),MCha2OS(2),               & 
& MFeOS(3),MFe2OS(3),MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,               & 
& MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZHOS(3,3),ZAOS(3,3),ZPOS(2,2)

Complex(dp), Intent(in) :: ZDOS(6,6),ZVIOS(6,6),ZVROS(6,6),ZUOS(6,6),ZEOS(6,6),ZNOS(5,5),UVOS(6,6),              & 
& UMOS(2,2),UPOS(2,2),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),            & 
& ZUROS(3,3)

Real(dp), Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp), Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp), Intent(in) :: cplAhcHpmVWm(3,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcFdFuVWmL(3,3),          & 
& cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFdcVWmL(3,3),              & 
& cplcFuFdcVWmR(3,3),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplcHpmVPVWm(2),            & 
& cplcHpmVWmVZ(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),         & 
& cplhhcHpmVWm(3,2),cplhhcVWmVWm(3),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),& 
& cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),ZcplAhcHpmVWm(3,2),             & 
& ZcplcChaChiVWmL(2,5),ZcplcChaChiVWmR(2,5),ZcplcFdFuVWmL(3,3),ZcplcFdFuVWmR(3,3),       & 
& ZcplcFeFvVWmL(3,6),ZcplcFeFvVWmR(3,6),ZcplcFuFdcVWmL(3,3),ZcplcFuFdcVWmR(3,3),         & 
& ZcplChiChacVWmL(5,2),ZcplChiChacVWmR(5,2),ZcplcHpmVPVWm(2),ZcplcHpmVWmVZ(2),           & 
& ZcplcVWmVPVWm,ZcplcVWmVWmVZ,ZcplFvFecVWmL(6,3),ZcplFvFecVWmR(6,3),ZcplhhcHpmVWm(3,2),  & 
& ZcplhhcVWmVWm(3),ZcplSdcSucVWm(6,6),ZcplSeSvImcVWm(6,6),ZcplSeSvRecVWm(6,6),           & 
& ZcplSucSdVWm(6,6),ZcplSvImcSeVWm(6,6),ZcplSvRecSeVWm(6,6)

Integer :: gt1, gt2, gt3, i1, i2
Complex(dp), Intent(out) :: GcplAhHpmcHpm(3,2,2),GcplhhHpmcHpm(3,2,2),GcplHpmSucSd(2,6,6),GcplHpmSvImcSe(2,6,6),  & 
& GcplHpmSvRecSe(2,6,6),GcplSdcHpmcSu(6,2,6),GcplSeSvImcHpm(6,6,2),GcplSeSvRecHpm(6,6,2),& 
& GcplAhHpmcVWm(3,2),GcplAhcHpmVWm(3,2),GcplhhHpmcVWm(3,2),GcplhhcHpmVWm(3,2),           & 
& GcplHpmcHpmVP(2,2),GcplHpmcHpmVZ(2,2),GcplHpmcVWmVP(2),GcplHpmcVWmVZ(2),               & 
& GcplcHpmVPVWm(2),GcplcHpmVWmVZ(2),GcplChiChacHpmL(5,2,2),GcplChiChacHpmR(5,2,2),       & 
& GcplcChaChiHpmL(2,5,2),GcplcChaChiHpmR(2,5,2),GcplcFuFdcHpmL(3,3,2),GcplcFuFdcHpmR(3,3,2),& 
& GcplFvFecHpmL(6,3,2),GcplFvFecHpmR(6,3,2),GcplcFdFuHpmL(3,3,2),GcplcFdFuHpmR(3,3,2),   & 
& GcplcFeFvHpmL(3,6,2),GcplcFeFvHpmR(3,6,2)

Complex(dp), Intent(out) :: GZcplAhHpmcHpm(3,2,2),GZcplhhHpmcHpm(3,2,2),GZcplHpmSucSd(2,6,6),GZcplHpmSvImcSe(2,6,6),& 
& GZcplHpmSvRecSe(2,6,6),GZcplSdcHpmcSu(6,2,6),GZcplSeSvImcHpm(6,6,2),GZcplSeSvRecHpm(6,6,2),& 
& GZcplAhHpmcVWm(3,2),GZcplAhcHpmVWm(3,2),GZcplhhHpmcVWm(3,2),GZcplhhcHpmVWm(3,2),       & 
& GZcplHpmcHpmVP(2,2),GZcplHpmcHpmVZ(2,2),GZcplHpmcVWmVP(2),GZcplHpmcVWmVZ(2),           & 
& GZcplcHpmVPVWm(2),GZcplcHpmVWmVZ(2),GZcplChiChacHpmL(5,2,2),GZcplChiChacHpmR(5,2,2),   & 
& GZcplcChaChiHpmL(2,5,2),GZcplcChaChiHpmR(2,5,2),GZcplcFuFdcHpmL(3,3,2),GZcplcFuFdcHpmR(3,3,2),& 
& GZcplFvFecHpmL(6,3,2),GZcplFvFecHpmR(6,3,2),GZcplcFdFuHpmL(3,3,2),GZcplcFdFuHpmR(3,3,2),& 
& GZcplcFeFvHpmL(3,6,2),GZcplcFeFvHpmR(3,6,2)

Complex(dp), Intent(out) :: GosZcplAhHpmcHpm(3,2,2),GosZcplhhHpmcHpm(3,2,2),GosZcplHpmSucSd(2,6,6),               & 
& GosZcplHpmSvImcSe(2,6,6),GosZcplHpmSvRecSe(2,6,6),GosZcplSdcHpmcSu(6,2,6),             & 
& GosZcplSeSvImcHpm(6,6,2),GosZcplSeSvRecHpm(6,6,2),GosZcplAhHpmcVWm(3,2),               & 
& GosZcplAhcHpmVWm(3,2),GosZcplhhHpmcVWm(3,2),GosZcplhhcHpmVWm(3,2),GosZcplHpmcHpmVP(2,2),& 
& GosZcplHpmcHpmVZ(2,2),GosZcplHpmcVWmVP(2),GosZcplHpmcVWmVZ(2),GosZcplcHpmVPVWm(2),     & 
& GosZcplcHpmVWmVZ(2),GosZcplChiChacHpmL(5,2,2),GosZcplChiChacHpmR(5,2,2),               & 
& GosZcplcChaChiHpmL(2,5,2),GosZcplcChaChiHpmR(2,5,2),GosZcplcFuFdcHpmL(3,3,2),          & 
& GosZcplcFuFdcHpmR(3,3,2),GosZcplFvFecHpmL(6,3,2),GosZcplFvFecHpmR(6,3,2),              & 
& GosZcplcFdFuHpmL(3,3,2),GosZcplcFdFuHpmR(3,3,2),GosZcplcFeFvHpmL(3,6,2),               & 
& GosZcplcFeFvHpmR(3,6,2)

Do i1=1,3
 Do i2=1,2
GcplAhHpmcHpm(i1,1,i2) = (1)*(MAh2OS(i1) - MHpm2OS(i2))/MVWmOS*cplAhcHpmVWm(i1,i2)
GosZcplAhHpmcHpm(i1,1,i2) = (1)*(MAh2OS(i1) - MHpm2OS(i2))/MVWmOS*ZcplAhcHpmVWm(i1,i2)
GZcplAhHpmcHpm(i1,1,i2) = (1)*(MAh2(i1) - MHpm2(i2))/MVWm*ZcplAhcHpmVWm(i1,i2)
 End Do
End Do 
Do i1=1,3
 Do i2=1,2
GcplhhHpmcHpm(i1,1,i2) = (1)*(Mhh2OS(i1) - MHpm2OS(i2))/MVWmOS*cplhhcHpmVWm(i1,i2)
GosZcplhhHpmcHpm(i1,1,i2) = (1)*(Mhh2OS(i1) - MHpm2OS(i2))/MVWmOS*ZcplhhcHpmVWm(i1,i2)
GZcplhhHpmcHpm(i1,1,i2) = (1)*(Mhh2(i1) - MHpm2(i2))/MVWm*ZcplhhcHpmVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplHpmSucSd(1,i1,i2) = (1)*(MSu2OS(i1) - MSd2OS(i2))/MVWmOS*cplSucSdVWm(i1,i2)
GosZcplHpmSucSd(1,i1,i2) = (1)*(MSu2OS(i1) - MSd2OS(i2))/MVWmOS*ZcplSucSdVWm(i1,i2)
GZcplHpmSucSd(1,i1,i2) = (1)*(MSu2(i1) - MSd2(i2))/MVWm*ZcplSucSdVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplHpmSvImcSe(1,i1,i2) = (1)*(MSvIm2OS(i1) - MSe2OS(i2))/MVWmOS*cplSvImcSeVWm(i1,i2)
GosZcplHpmSvImcSe(1,i1,i2) = (1)*(MSvIm2OS(i1) - MSe2OS(i2))/MVWmOS*ZcplSvImcSeVWm(i1,i2)
GZcplHpmSvImcSe(1,i1,i2) = (1)*(MSvIm2(i1) - MSe2(i2))/MVWm*ZcplSvImcSeVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplHpmSvRecSe(1,i1,i2) = (1)*(MSvRe2OS(i1) - MSe2OS(i2))/MVWmOS*cplSvRecSeVWm(i1,i2)
GosZcplHpmSvRecSe(1,i1,i2) = (1)*(MSvRe2OS(i1) - MSe2OS(i2))/MVWmOS*ZcplSvRecSeVWm(i1,i2)
GZcplHpmSvRecSe(1,i1,i2) = (1)*(MSvRe2(i1) - MSe2(i2))/MVWm*ZcplSvRecSeVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplSdcHpmcSu(i1,1,i2) = (1)*(MSd2OS(i1) - MSu2OS(i2))/MVWmOS*cplSdcSucVWm(i1,i2)
GosZcplSdcHpmcSu(i1,1,i2) = (1)*(MSd2OS(i1) - MSu2OS(i2))/MVWmOS*ZcplSdcSucVWm(i1,i2)
GZcplSdcHpmcSu(i1,1,i2) = (1)*(MSd2(i1) - MSu2(i2))/MVWm*ZcplSdcSucVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplSeSvImcHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvIm2OS(i2))/MVWmOS*cplSeSvImcVWm(i1,i2)
GosZcplSeSvImcHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvIm2OS(i2))/MVWmOS*ZcplSeSvImcVWm(i1,i2)
GZcplSeSvImcHpm(i1,i2,1) = (1)*(MSe2(i1) - MSvIm2(i2))/MVWm*ZcplSeSvImcVWm(i1,i2)
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplSeSvRecHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvRe2OS(i2))/MVWmOS*cplSeSvRecVWm(i1,i2)
GosZcplSeSvRecHpm(i1,i2,1) = (1)*(MSe2OS(i1) - MSvRe2OS(i2))/MVWmOS*ZcplSeSvRecVWm(i1,i2)
GZcplSeSvRecHpm(i1,i2,1) = (1)*(MSe2(i1) - MSvRe2(i2))/MVWm*ZcplSeSvRecVWm(i1,i2)
 End Do
End Do 
Do i1=1,3
GcplAhHpmcVWm(i1,1) = 0._dp 
GosZcplAhHpmcVWm(i1,1) = 0._dp
GZcplAhHpmcVWm(i1,1) = 0._dp
End Do 
Do i1=1,3
GcplAhcHpmVWm(i1,1) = 0._dp 
GosZcplAhcHpmVWm(i1,1) = 0._dp
GZcplAhcHpmVWm(i1,1) = 0._dp
End Do 
Do i1=1,3
GcplhhHpmcVWm(i1,1) = 0.5_dp*(1)/MVWmOS*cplhhcVWmVWm(i1)
GosZcplhhHpmcVWm(i1,1) = 0.5_dp*(1)/MVWmOS*ZcplhhcVWmVWm(i1)
GZcplhhHpmcVWm(i1,1) = 0.5_dp*(1)/MVWm*ZcplhhcVWmVWm(i1)
End Do 
Do i1=1,3
GcplhhcHpmVWm(i1,1) = 0.5_dp*(1)/MVWmOS*cplhhcVWmVWm(i1)
GosZcplhhcHpmVWm(i1,1) = 0.5_dp*(1)/MVWmOS*ZcplhhcVWmVWm(i1)
GZcplhhcHpmVWm(i1,1) = 0.5_dp*(1)/MVWm*ZcplhhcVWmVWm(i1)
End Do 
Do i1=1,2
GcplHpmcHpmVP(1,i1) = 0.5_dp*(1)/MVWmOS*cplcHpmVPVWm(i1)
GosZcplHpmcHpmVP(1,i1) = 0.5_dp*(1)/MVWmOS*ZcplcHpmVPVWm(i1)
GZcplHpmcHpmVP(1,i1) = 0.5_dp*(1)/MVWm*ZcplcHpmVPVWm(i1)
End Do 
Do i1=1,2
GcplHpmcHpmVZ(1,i1) = 0.5_dp*(1)/MVWmOS*cplcHpmVWmVZ(i1)
GosZcplHpmcHpmVZ(1,i1) = 0.5_dp*(1)/MVWmOS*ZcplcHpmVWmVZ(i1)
GZcplHpmcHpmVZ(1,i1) = 0.5_dp*(1)/MVWm*ZcplcHpmVWmVZ(i1)
End Do 
GcplHpmcVWmVP(1) = (-1)*(MVWm2OS - 0._dp)/MVWmOS*cplcVWmVPVWm
GosZcplHpmcVWmVP(1) = (-1)*(MVWm2OS - 0._dp)/MVWmOS*ZcplcVWmVPVWm
GZcplHpmcVWmVP(1) = (-1)*(MVWm2 - 0._dp)/MVWmOS*ZcplcVWmVPVWm 
GcplHpmcVWmVZ(1) = (1)*(MVWm2OS - MVZ2OS)/MVWmOS*cplcVWmVWmVZ
GosZcplHpmcVWmVZ(1) = (1)*(MVWm2OS - MVZ2OS)/MVWmOS*ZcplcVWmVWmVZ
GZcplHpmcVWmVZ(1) = (1)*(MVWm2 - MVZ2)/MVWmOS*ZcplcVWmVWmVZ 
GcplcHpmVPVWm(1) = (-1)*(0._dp - MVWm2OS)/MVWmOS*cplcVWmVPVWm
GosZcplcHpmVPVWm(1) = (-1)*(0._dp - MVWm2OS)/MVWmOS*ZcplcVWmVPVWm
GZcplcHpmVPVWm(1) = (-1)*(0._dp - MVWm2)/MVWmOS*ZcplcVWmVPVWm 
GcplcHpmVWmVZ(1) = (-1)*(MVWm2OS - MVZ2OS)/MVWmOS*cplcVWmVWmVZ
GosZcplcHpmVWmVZ(1) = (-1)*(MVWm2OS - MVZ2OS)/MVWmOS*ZcplcVWmVWmVZ
GZcplcHpmVWmVZ(1) = (-1)*(MVWm2 - MVZ2)/MVWmOS*ZcplcVWmVWmVZ 
Do i1=1,5
 Do i2=1,2
GcplChiChacHpmL(i1,i2,1) = (MChiOS(i1)*cplChiChacVWmL(i1,i2) - MChaOS(i2)*cplChiChacVWmR(i1,i2))/MVWmOS
GcplChiChacHpmR(i1,i2,1) = -(MChaOS(i2)*cplChiChacVWmL(i1,i2) - MChiOS(i1)*cplChiChacVWmR(i1,i2))/MVWmOS
GosZcplChiChacHpmL(i1,i2,1) = (MChiOS(i1)*ZcplChiChacVWmL(i1,i2) - MChaOS(i2)*ZcplChiChacVWmR(i1,i2))/MVWmOS
GosZcplChiChacHpmR(i1,i2,1) = -(MChaOS(i2)*ZcplChiChacVWmL(i1,i2) - MChiOS(i1)*ZcplChiChacVWmR(i1,i2))/MVWmOS
GZcplChiChacHpmL(i1,i2,1) = (MChi(i1)*ZcplChiChacVWmL(i1,i2) - MCha(i2)*ZcplChiChacVWmR(i1,i2))/MVWm
GZcplChiChacHpmR(i1,i2,1) = -(MCha(i2)*ZcplChiChacVWmL(i1,i2) - MChi(i1)*ZcplChiChacVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,2
 Do i2=1,5
GcplcChaChiHpmL(i1,i2,1) = (MChaOS(i1)*cplcChaChiVWmL(i1,i2) - MChiOS(i2)*cplcChaChiVWmR(i1,i2))/MVWmOS
GcplcChaChiHpmR(i1,i2,1) = -(MChiOS(i2)*cplcChaChiVWmL(i1,i2) - MChaOS(i1)*cplcChaChiVWmR(i1,i2))/MVWmOS
GosZcplcChaChiHpmL(i1,i2,1) = (MChaOS(i1)*ZcplcChaChiVWmL(i1,i2) - MChiOS(i2)*ZcplcChaChiVWmR(i1,i2))/MVWmOS
GosZcplcChaChiHpmR(i1,i2,1) = -(MChiOS(i2)*ZcplcChaChiVWmL(i1,i2) - MChaOS(i1)*ZcplcChaChiVWmR(i1,i2))/MVWmOS
GZcplcChaChiHpmL(i1,i2,1) = (MCha(i1)*ZcplcChaChiVWmL(i1,i2) - MChi(i2)*ZcplcChaChiVWmR(i1,i2))/MVWm
GZcplcChaChiHpmR(i1,i2,1) = -(MChi(i2)*ZcplcChaChiVWmL(i1,i2) - MCha(i1)*ZcplcChaChiVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFuFdcHpmL(i1,i2,1) = (MFuOS(i1)*cplcFuFdcVWmL(i1,i2) - MFdOS(i2)*cplcFuFdcVWmR(i1,i2))/MVWmOS
GcplcFuFdcHpmR(i1,i2,1) = -(MFdOS(i2)*cplcFuFdcVWmL(i1,i2) - MFuOS(i1)*cplcFuFdcVWmR(i1,i2))/MVWmOS
GosZcplcFuFdcHpmL(i1,i2,1) = (MFuOS(i1)*ZcplcFuFdcVWmL(i1,i2) - MFdOS(i2)*ZcplcFuFdcVWmR(i1,i2))/MVWmOS
GosZcplcFuFdcHpmR(i1,i2,1) = -(MFdOS(i2)*ZcplcFuFdcVWmL(i1,i2) - MFuOS(i1)*ZcplcFuFdcVWmR(i1,i2))/MVWmOS
GZcplcFuFdcHpmL(i1,i2,1) = (MFu(i1)*ZcplcFuFdcVWmL(i1,i2) - MFd(i2)*ZcplcFuFdcVWmR(i1,i2))/MVWm
GZcplcFuFdcHpmR(i1,i2,1) = -(MFd(i2)*ZcplcFuFdcVWmL(i1,i2) - MFu(i1)*ZcplcFuFdcVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,6
 Do i2=1,3
GcplFvFecHpmL(i1,i2,1) = (MFvOS(i1)*cplFvFecVWmL(i1,i2) - MFeOS(i2)*cplFvFecVWmR(i1,i2))/MVWmOS
GcplFvFecHpmR(i1,i2,1) = -(MFeOS(i2)*cplFvFecVWmL(i1,i2) - MFvOS(i1)*cplFvFecVWmR(i1,i2))/MVWmOS
GosZcplFvFecHpmL(i1,i2,1) = (MFvOS(i1)*ZcplFvFecVWmL(i1,i2) - MFeOS(i2)*ZcplFvFecVWmR(i1,i2))/MVWmOS
GosZcplFvFecHpmR(i1,i2,1) = -(MFeOS(i2)*ZcplFvFecVWmL(i1,i2) - MFvOS(i1)*ZcplFvFecVWmR(i1,i2))/MVWmOS
GZcplFvFecHpmL(i1,i2,1) = (MFv(i1)*ZcplFvFecVWmL(i1,i2) - MFe(i2)*ZcplFvFecVWmR(i1,i2))/MVWm
GZcplFvFecHpmR(i1,i2,1) = -(MFe(i2)*ZcplFvFecVWmL(i1,i2) - MFv(i1)*ZcplFvFecVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFdFuHpmL(i1,i2,1) = (MFdOS(i1)*cplcFdFuVWmL(i1,i2) - MFuOS(i2)*cplcFdFuVWmR(i1,i2))/MVWmOS
GcplcFdFuHpmR(i1,i2,1) = -(MFuOS(i2)*cplcFdFuVWmL(i1,i2) - MFdOS(i1)*cplcFdFuVWmR(i1,i2))/MVWmOS
GosZcplcFdFuHpmL(i1,i2,1) = (MFdOS(i1)*ZcplcFdFuVWmL(i1,i2) - MFuOS(i2)*ZcplcFdFuVWmR(i1,i2))/MVWmOS
GosZcplcFdFuHpmR(i1,i2,1) = -(MFuOS(i2)*ZcplcFdFuVWmL(i1,i2) - MFdOS(i1)*ZcplcFdFuVWmR(i1,i2))/MVWmOS
GZcplcFdFuHpmL(i1,i2,1) = (MFd(i1)*ZcplcFdFuVWmL(i1,i2) - MFu(i2)*ZcplcFdFuVWmR(i1,i2))/MVWm
GZcplcFdFuHpmR(i1,i2,1) = -(MFu(i2)*ZcplcFdFuVWmL(i1,i2) - MFd(i1)*ZcplcFdFuVWmR(i1,i2))/MVWm
 End Do
End Do 
Do i1=1,3
 Do i2=1,6
GcplcFeFvHpmL(i1,i2,1) = (MFeOS(i1)*cplcFeFvVWmL(i1,i2) - MFvOS(i2)*cplcFeFvVWmR(i1,i2))/MVWmOS
GcplcFeFvHpmR(i1,i2,1) = -(MFvOS(i2)*cplcFeFvVWmL(i1,i2) - MFeOS(i1)*cplcFeFvVWmR(i1,i2))/MVWmOS
GosZcplcFeFvHpmL(i1,i2,1) = (MFeOS(i1)*ZcplcFeFvVWmL(i1,i2) - MFvOS(i2)*ZcplcFeFvVWmR(i1,i2))/MVWmOS
GosZcplcFeFvHpmR(i1,i2,1) = -(MFvOS(i2)*ZcplcFeFvVWmL(i1,i2) - MFeOS(i1)*ZcplcFeFvVWmR(i1,i2))/MVWmOS
GZcplcFeFvHpmL(i1,i2,1) = (MFe(i1)*ZcplcFeFvVWmL(i1,i2) - MFv(i2)*ZcplcFeFvVWmR(i1,i2))/MVWm
GZcplcFeFvHpmR(i1,i2,1) = -(MFv(i2)*ZcplcFeFvVWmL(i1,i2) - MFe(i1)*ZcplcFeFvVWmR(i1,i2))/MVWm
 End Do
End Do 
End Subroutine  getGBCouplings 

Subroutine WaveFunctionRenormalisation(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,         & 
& MSvRe2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,           & 
& MChiOS,MChi2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,            & 
& MFu2OS,MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,               & 
& ZEOS,ZHOS,ZAOS,ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,           & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,               & 
& ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,             & 
& Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,             & 
& vS,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,           & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplAhAhAhAh,      & 
& cplAhAhAhhh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,         & 
& cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhhhhh,cplAhhhHpmcHpm,            & 
& cplAhhhSdcSd,cplAhhhSecSe,cplAhhhSucSu,cplAhhhSvImSvIm,cplAhhhSvImSvRe,cplAhhhSvReSvRe,& 
& cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,cplAhSeSvImcHpm,          & 
& cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,     & 
& cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,cplhhHpmSucSd,cplhhHpmSvImcSe,         & 
& cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,      & 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm, & 
& cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,         & 
& cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,cplSeSecSecSe,cplSeSuSvImcSd,         & 
& cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvImSvRecSe,cplSeSvReSvRecSe,       & 
& cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,       & 
& cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,            & 
& cplHpmcHpmVZ,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSucVWm,cplSeSvImcVWm,              & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,      & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,         & 
& cplHpmcVWmVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHpmcVWmVP,      & 
& cplAhHpmcVWmVZ,cplAhcHpmVPVWm,cplAhcHpmVWmVZ,cplhhhhcVWmVWm,cplhhhhVZVZ,               & 
& cplhhHpmcVWmVP,cplhhHpmcVWmVZ,cplhhcHpmVPVWm,cplhhcHpmVWmVZ,cplHpmcHpmVPVP,            & 
& cplHpmcHpmVPVZ,cplHpmcHpmcVWmVWm,cplHpmcHpmVZVZ,cplSdcSdVGVG,cplSdcSdVGVP,             & 
& cplSdcSdVGVZ,cplSdcSucVWmVG,cplSdcSdVPVP,cplSdcSdVPVZ,cplSdcSucVWmVP,cplSdcSdcVWmVWm,  & 
& cplSdcSdVZVZ,cplSdcSucVWmVZ,cplSeSvImcVWmVP,cplSeSvImcVWmVZ,cplSeSvRecVWmVP,           & 
& cplSeSvRecVWmVZ,cplSecSeVPVP,cplSecSeVPVZ,cplSecSecVWmVWm,cplSecSeVZVZ,cplSucSuVGVG,   & 
& cplSucSuVGVP,cplSucSdVGVWm,cplSucSuVGVZ,cplSucSuVPVP,cplSucSdVPVWm,cplSucSuVPVZ,       & 
& cplSucSdVWmVZ,cplSucSucVWmVWm,cplSucSuVZVZ,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,         & 
& cplSvImcSeVPVWm,cplSvImcSeVWmVZ,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvRecSeVPVWm,    & 
& cplSvRecSeVWmVZ,cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,             & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,               & 
& cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,         & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,       & 
& cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpCVP,   & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgWmAh,   & 
& cplcgWpCgWpCAh,cplcgZgAhh,cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,GcplAhHpmcHpm,     & 
& GcplhhHpmcHpm,GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe,GcplSdcHpmcSu,GcplSeSvImcHpm, & 
& GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,GcplhhHpmcVWm,GcplhhcHpmVWm,GcplHpmcHpmVP,  & 
& GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplChiChacHpmL, & 
& GcplChiChacHpmR,GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcFuFdcHpmL,GcplcFuFdcHpmR,         & 
& GcplFvFecHpmL,GcplFvFecHpmR,GcplcFdFuHpmL,GcplcFdFuHpmR,GcplcFeFvHpmL,GcplcFeFvHpmR,   & 
& dg1,dg2,dg3,dYd,dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,            & 
& dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,            & 
& dZD,dZVI,dZVR,dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,            & 
& dZUR,dSinTW,dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,           & 
& ZfSe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,          & 
& ZfVPVZ,ZfVZVP,ctcplAhAhAh,ctcplAhAhhh,ctcplAhhhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,         & 
& ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,             & 
& ctcplhhhhhh,ctcplhhHpmcHpm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,     & 
& ctcplhhSvImSvRe,ctcplhhSvReSvRe,ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,         & 
& ctcplSdcHpmcSu,ctcplSeSvImcHpm,ctcplSeSvRecHpm,ctcplAhhhVZ,ctcplAhHpmcVWm,             & 
& ctcplAhcHpmVWm,ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,            & 
& ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSucVWm,ctcplSeSvImcVWm,ctcplSeSvRecVWm, & 
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
& ctcplFvFvVZL,ctcplFvFvVZR,ctcplcFeFvVWmL,ctcplcFeFvVWmR,ctcplGluGluVGL,ctcplGluGluVGR, & 
& MLambda,deltaM,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Real(dp),Intent(inout) :: vd,vu,vS

Complex(dp),Intent(in) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),            & 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),     & 
& cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),    & 
& cplAhAhAhAh(3,3,3,3),cplAhAhAhhh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),& 
& cplAhAhSdcSd(3,3,6,6),cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,6,6),& 
& cplAhAhSvImSvRe(3,3,6,6),cplAhAhSvReSvRe(3,3,6,6),cplAhhhhhhh(3,3,3,3),cplAhhhHpmcHpm(3,3,2,2),& 
& cplAhhhSdcSd(3,3,6,6),cplAhhhSecSe(3,3,6,6),cplAhhhSucSu(3,3,6,6),cplAhhhSvImSvIm(3,3,6,6),& 
& cplAhhhSvImSvRe(3,3,6,6),cplAhhhSvReSvRe(3,3,6,6),cplAhHpmSucSd(3,2,6,6),              & 
& cplAhHpmSvImcSe(3,2,6,6),cplAhHpmSvRecSe(3,2,6,6),cplAhSdcHpmcSu(3,6,2,6),             & 
& cplAhSeSvImcHpm(3,6,6,2),cplAhSeSvRecHpm(3,6,6,2),cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),& 
& cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,6,6),& 
& cplhhhhSvImSvRe(3,3,6,6),cplhhhhSvReSvRe(3,3,6,6),cplhhHpmSucSd(3,2,6,6),              & 
& cplhhHpmSvImcSe(3,2,6,6),cplhhHpmSvRecSe(3,2,6,6),cplhhSdcHpmcSu(3,6,2,6),             & 
& cplhhSeSvImcHpm(3,6,6,2),cplhhSeSvRecHpm(3,6,6,2),cplHpmHpmcHpmcHpm(2,2,2,2),          & 
& cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),            & 
& cplHpmSvImSvImcHpm(2,6,6,2),cplHpmSvImSvRecHpm(2,6,6,2),cplHpmSvReSvRecHpm(2,6,6,2),   & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSdSvImSvImcSd(6,6,6,6),& 
& cplSdSvImcSecSu(6,6,6,6),cplSdSvReSvRecSd(6,6,6,6),cplSdSvRecSecSu(6,6,6,6),           & 
& cplSeSecSecSe(6,6,6,6),cplSeSuSvImcSd(6,6,6,6),cplSeSuSvRecSd(6,6,6,6),cplSeSucSecSu(6,6,6,6),& 
& cplSeSvImSvImcSe(6,6,6,6),cplSeSvImSvRecSe(6,6,6,6),cplSeSvReSvRecSe(6,6,6,6),         & 
& cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),cplSuSvImSvRecSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvImSvRe(6,6,6,6),   & 
& cplSvImSvImSvReSvRe(6,6,6,6),cplSvImSvReSvReSvRe(6,6,6,6),cplSvReSvReSvReSvRe(6,6,6,6),& 
& cplAhhhVZ(3,3),cplAhHpmcVWm(3,2),cplAhcHpmVWm(3,2),cplhhHpmcVWm(3,2),cplhhcHpmVWm(3,2),& 
& cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),   & 
& cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),               & 
& cplSecSeVZ(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),      & 
& cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplhhcVWmVWm(3),              & 
& cplhhVZVZ(3),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),          & 
& cplAhAhcVWmVWm(3,3),cplAhAhVZVZ(3,3),cplAhHpmcVWmVP(3,2),cplAhHpmcVWmVZ(3,2),          & 
& cplAhcHpmVPVWm(3,2),cplAhcHpmVWmVZ(3,2),cplhhhhcVWmVWm(3,3),cplhhhhVZVZ(3,3),          & 
& cplhhHpmcVWmVP(3,2),cplhhHpmcVWmVZ(3,2),cplhhcHpmVPVWm(3,2),cplhhcHpmVWmVZ(3,2),       & 
& cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVZVZ(2,2),    & 
& cplSdcSdVGVG(6,6),cplSdcSdVGVP(6,6),cplSdcSdVGVZ(6,6),cplSdcSucVWmVG(6,6)

Complex(dp),Intent(in) :: cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6),cplSdcSucVWmVP(6,6),cplSdcSdcVWmVWm(6,6),          & 
& cplSdcSdVZVZ(6,6),cplSdcSucVWmVZ(6,6),cplSeSvImcVWmVP(6,6),cplSeSvImcVWmVZ(6,6),       & 
& cplSeSvRecVWmVP(6,6),cplSeSvRecVWmVZ(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),         & 
& cplSecSecVWmVWm(6,6),cplSecSeVZVZ(6,6),cplSucSuVGVG(6,6),cplSucSuVGVP(6,6),            & 
& cplSucSdVGVWm(6,6),cplSucSuVGVZ(6,6),cplSucSuVPVP(6,6),cplSucSdVPVWm(6,6),             & 
& cplSucSuVPVZ(6,6),cplSucSdVWmVZ(6,6),cplSucSucVWmVWm(6,6),cplSucSuVZVZ(6,6),           & 
& cplSvImSvImcVWmVWm(6,6),cplSvImSvImVZVZ(6,6),cplSvImcSeVPVWm(6,6),cplSvImcSeVWmVZ(6,6),& 
& cplSvReSvRecVWmVWm(6,6),cplSvReSvReVZVZ(6,6),cplSvRecSeVPVWm(6,6),cplSvRecSeVWmVZ(6,6),& 
& cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),         & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),           & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),              & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3), & 
& cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),   & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1

Complex(dp),Intent(in) :: cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,         & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm, & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplcgZgAhh(3),cplcgWmgAHpm(2),cplcgWpCgAcHpm(2),     & 
& cplcgWmgWmhh(3),cplcgZgWmcHpm(2),cplcgWpCgWpChh(3),cplcgZgWpCHpm(2),cplcgZgZhh(3),     & 
& cplcgWmgZHpm(2),cplcgWpCgZcHpm(2)

Real(dp),Intent(in) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSvImOS(6),MSvIm2OS(6),MSvReOS(6),MSvRe2OS(6),MSuOS(6),            & 
& MSu2OS(6),MSeOS(6),MSe2OS(6),MhhOS(3),Mhh2OS(3),MAhOS(3),MAh2OS(3),MHpmOS(2),          & 
& MHpm2OS(2),MChiOS(5),MChi2OS(5),MFvOS(6),MFv2OS(6),MChaOS(2),MCha2OS(2),               & 
& MFeOS(3),MFe2OS(3),MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,               & 
& MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZHOS(3,3),ZAOS(3,3),ZPOS(2,2)

Complex(dp),Intent(in) :: ZDOS(6,6),ZVIOS(6,6),ZVROS(6,6),ZUOS(6,6),ZEOS(6,6),ZNOS(5,5),UVOS(6,6),              & 
& UMOS(2,2),UPOS(2,2),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),            & 
& ZUROS(3,3)

Complex(dp) :: PiSd(6,6,6),DerPiSd(6,6,6),PiSvIm(6,6,6),DerPiSvIm(6,6,6),PiSvRe(6,6,6),              & 
& DerPiSvRe(6,6,6),PiSu(6,6,6),DerPiSu(6,6,6),PiSe(6,6,6),DerPiSe(6,6,6),Pihh(3,3,3),    & 
& DerPihh(3,3,3),PiAh(3,3,3),DerPiAh(3,3,3),PiHpm(2,2,2),DerPiHpm(2,2,2),SigmaLChi(5,5,5),& 
& SigmaSLChi(5,5,5),SigmaSRChi(5,5,5),SigmaRChi(5,5,5),DerSigmaLChi(5,5,5),              & 
& DerSigmaSLChi(5,5,5),DerSigmaSRChi(5,5,5),DerSigmaRChi(5,5,5),DerSigmaLirChi(5,5,5),   & 
& DerSigmaSLirChi(5,5,5),DerSigmaSRirChi(5,5,5),DerSigmaRirChi(5,5,5),SigmaLFv(6,6,6),   & 
& SigmaSLFv(6,6,6),SigmaSRFv(6,6,6),SigmaRFv(6,6,6),DerSigmaLFv(6,6,6),DerSigmaSLFv(6,6,6),& 
& DerSigmaSRFv(6,6,6),DerSigmaRFv(6,6,6),DerSigmaLirFv(6,6,6),DerSigmaSLirFv(6,6,6),     & 
& DerSigmaSRirFv(6,6,6),DerSigmaRirFv(6,6,6),SigmaLCha(2,2,2),SigmaSLCha(2,2,2),         & 
& SigmaSRCha(2,2,2),SigmaRCha(2,2,2),DerSigmaLCha(2,2,2),DerSigmaSLCha(2,2,2),           & 
& DerSigmaSRCha(2,2,2),DerSigmaRCha(2,2,2),DerSigmaLirCha(2,2,2),DerSigmaSLirCha(2,2,2), & 
& DerSigmaSRirCha(2,2,2),DerSigmaRirCha(2,2,2),SigmaLFe(3,3,3),SigmaSLFe(3,3,3),         & 
& SigmaSRFe(3,3,3),SigmaRFe(3,3,3),DerSigmaLFe(3,3,3),DerSigmaSLFe(3,3,3),               & 
& DerSigmaSRFe(3,3,3),DerSigmaRFe(3,3,3),DerSigmaLirFe(3,3,3),DerSigmaSLirFe(3,3,3),     & 
& DerSigmaSRirFe(3,3,3),DerSigmaRirFe(3,3,3),SigmaLFd(3,3,3),SigmaSLFd(3,3,3),           & 
& SigmaSRFd(3,3,3),SigmaRFd(3,3,3),DerSigmaLFd(3,3,3),DerSigmaSLFd(3,3,3),               & 
& DerSigmaSRFd(3,3,3),DerSigmaRFd(3,3,3),DerSigmaLirFd(3,3,3),DerSigmaSLirFd(3,3,3),     & 
& DerSigmaSRirFd(3,3,3),DerSigmaRirFd(3,3,3),SigmaLFu(3,3,3),SigmaSLFu(3,3,3),           & 
& SigmaSRFu(3,3,3),SigmaRFu(3,3,3),DerSigmaLFu(3,3,3),DerSigmaSLFu(3,3,3),               & 
& DerSigmaSRFu(3,3,3),DerSigmaRFu(3,3,3),DerSigmaLirFu(3,3,3),DerSigmaSLirFu(3,3,3),     & 
& DerSigmaSRirFu(3,3,3),DerSigmaRirFu(3,3,3),SigmaLGlu,SigmaSLGlu,SigmaSRGlu,            & 
& SigmaRGlu,DerSigmaLGlu,DerSigmaSLGlu,DerSigmaSRGlu,DerSigmaRGlu,DerSigmaLirGlu,        & 
& DerSigmaSLirGlu,DerSigmaSRirGlu,DerSigmaRirGlu,PiVG,DerPiVG,PiVP,DerPiVP,              & 
& PiVZ,DerPiVZ,PiVWm,DerPiVWm,PiVPlight0,DerPiVPlight0,PiVPheavy0,DerPiVPheavy0,         & 
& PiVPlightMZ,DerPiVPlightMZ,PiVPheavyMZ,DerPiVPheavyMZ,PiVPVZ,DerPiVPVZ,PiVZVP,         & 
& DerPiVZVP,PiVZhh(3,3,3),DerPiVZhh(3,3,3),PihhVZ(3,3,3),DerPihhVZ(3,3,3),               & 
& PiVZAh(3,3,3),DerPiVZAh(3,3,3),PiAhVZ(3,3,3),DerPiAhVZ(3,3,3),PiVWmHpm(2,2,2),         & 
& DerPiVWmHpm(2,2,2),PiHpmVWm(2,2,2),DerPiHpmVWm(2,2,2)

Complex(dp) :: PiSdDR(6,6,6),DerPiSdDR(6,6,6),PiSvImDR(6,6,6),DerPiSvImDR(6,6,6),PiSvReDR(6,6,6),    & 
& DerPiSvReDR(6,6,6),PiSuDR(6,6,6),DerPiSuDR(6,6,6),PiSeDR(6,6,6),DerPiSeDR(6,6,6),      & 
& PihhDR(3,3,3),DerPihhDR(3,3,3),PiAhDR(3,3,3),DerPiAhDR(3,3,3),PiHpmDR(2,2,2),          & 
& DerPiHpmDR(2,2,2),SigmaLChiDR(5,5,5),SigmaSLChiDR(5,5,5),SigmaSRChiDR(5,5,5),          & 
& SigmaRChiDR(5,5,5),DerSigmaLChiDR(5,5,5),DerSigmaSLChiDR(5,5,5),DerSigmaSRChiDR(5,5,5),& 
& DerSigmaRChiDR(5,5,5),DerSigmaLirChiDR(5,5,5),DerSigmaSLirChiDR(5,5,5),DerSigmaSRirChiDR(5,5,5),& 
& DerSigmaRirChiDR(5,5,5),SigmaLFvDR(6,6,6),SigmaSLFvDR(6,6,6),SigmaSRFvDR(6,6,6),       & 
& SigmaRFvDR(6,6,6),DerSigmaLFvDR(6,6,6),DerSigmaSLFvDR(6,6,6),DerSigmaSRFvDR(6,6,6),    & 
& DerSigmaRFvDR(6,6,6),DerSigmaLirFvDR(6,6,6),DerSigmaSLirFvDR(6,6,6),DerSigmaSRirFvDR(6,6,6),& 
& DerSigmaRirFvDR(6,6,6),SigmaLChaDR(2,2,2),SigmaSLChaDR(2,2,2),SigmaSRChaDR(2,2,2),     & 
& SigmaRChaDR(2,2,2),DerSigmaLChaDR(2,2,2),DerSigmaSLChaDR(2,2,2),DerSigmaSRChaDR(2,2,2),& 
& DerSigmaRChaDR(2,2,2),DerSigmaLirChaDR(2,2,2),DerSigmaSLirChaDR(2,2,2),DerSigmaSRirChaDR(2,2,2),& 
& DerSigmaRirChaDR(2,2,2),SigmaLFeDR(3,3,3),SigmaSLFeDR(3,3,3),SigmaSRFeDR(3,3,3),       & 
& SigmaRFeDR(3,3,3),DerSigmaLFeDR(3,3,3),DerSigmaSLFeDR(3,3,3),DerSigmaSRFeDR(3,3,3),    & 
& DerSigmaRFeDR(3,3,3),DerSigmaLirFeDR(3,3,3),DerSigmaSLirFeDR(3,3,3),DerSigmaSRirFeDR(3,3,3),& 
& DerSigmaRirFeDR(3,3,3),SigmaLFdDR(3,3,3),SigmaSLFdDR(3,3,3),SigmaSRFdDR(3,3,3),        & 
& SigmaRFdDR(3,3,3),DerSigmaLFdDR(3,3,3),DerSigmaSLFdDR(3,3,3),DerSigmaSRFdDR(3,3,3),    & 
& DerSigmaRFdDR(3,3,3),DerSigmaLirFdDR(3,3,3),DerSigmaSLirFdDR(3,3,3),DerSigmaSRirFdDR(3,3,3),& 
& DerSigmaRirFdDR(3,3,3),SigmaLFuDR(3,3,3),SigmaSLFuDR(3,3,3),SigmaSRFuDR(3,3,3),        & 
& SigmaRFuDR(3,3,3),DerSigmaLFuDR(3,3,3),DerSigmaSLFuDR(3,3,3),DerSigmaSRFuDR(3,3,3),    & 
& DerSigmaRFuDR(3,3,3),DerSigmaLirFuDR(3,3,3),DerSigmaSLirFuDR(3,3,3),DerSigmaSRirFuDR(3,3,3),& 
& DerSigmaRirFuDR(3,3,3),SigmaLGluDR,SigmaSLGluDR,SigmaSRGluDR,SigmaRGluDR,              & 
& DerSigmaLGluDR,DerSigmaSLGluDR,DerSigmaSRGluDR,DerSigmaRGluDR,DerSigmaLirGluDR,        & 
& DerSigmaSLirGluDR,DerSigmaSRirGluDR,DerSigmaRirGluDR,PiVGDR,DerPiVGDR,PiVPDR,          & 
& DerPiVPDR,PiVZDR,DerPiVZDR,PiVWmDR,DerPiVWmDR,PiVPlight0DR,DerPiVPlight0DR,            & 
& PiVPheavy0DR,DerPiVPheavy0DR,PiVPlightMZDR,DerPiVPlightMZDR,PiVPheavyMZDR,             & 
& DerPiVPheavyMZDR,PiVPVZDR,DerPiVPVZDR,PiVZVPDR,DerPiVZVPDR,PiVZhhDR(3,3,3),            & 
& DerPiVZhhDR(3,3,3),PihhVZDR(3,3,3),DerPihhVZDR(3,3,3),PiVZAhDR(3,3,3),DerPiVZAhDR(3,3,3),& 
& PiAhVZDR(3,3,3),DerPiAhVZDR(3,3,3),PiVWmHpmDR(2,2,2),DerPiVWmHpmDR(2,2,2),             & 
& PiHpmVWmDR(2,2,2),DerPiHpmVWmDR(2,2,2)

Complex(dp) :: PiSdOS(6,6,6),DerPiSdOS(6,6,6),PiSvImOS(6,6,6),DerPiSvImOS(6,6,6),PiSvReOS(6,6,6),    & 
& DerPiSvReOS(6,6,6),PiSuOS(6,6,6),DerPiSuOS(6,6,6),PiSeOS(6,6,6),DerPiSeOS(6,6,6),      & 
& PihhOS(3,3,3),DerPihhOS(3,3,3),PiAhOS(3,3,3),DerPiAhOS(3,3,3),PiHpmOS(2,2,2),          & 
& DerPiHpmOS(2,2,2),SigmaLChiOS(5,5,5),SigmaSLChiOS(5,5,5),SigmaSRChiOS(5,5,5),          & 
& SigmaRChiOS(5,5,5),DerSigmaLChiOS(5,5,5),DerSigmaSLChiOS(5,5,5),DerSigmaSRChiOS(5,5,5),& 
& DerSigmaRChiOS(5,5,5),DerSigmaLirChiOS(5,5,5),DerSigmaSLirChiOS(5,5,5),DerSigmaSRirChiOS(5,5,5),& 
& DerSigmaRirChiOS(5,5,5),SigmaLFvOS(6,6,6),SigmaSLFvOS(6,6,6),SigmaSRFvOS(6,6,6),       & 
& SigmaRFvOS(6,6,6),DerSigmaLFvOS(6,6,6),DerSigmaSLFvOS(6,6,6),DerSigmaSRFvOS(6,6,6),    & 
& DerSigmaRFvOS(6,6,6),DerSigmaLirFvOS(6,6,6),DerSigmaSLirFvOS(6,6,6),DerSigmaSRirFvOS(6,6,6),& 
& DerSigmaRirFvOS(6,6,6),SigmaLChaOS(2,2,2),SigmaSLChaOS(2,2,2),SigmaSRChaOS(2,2,2),     & 
& SigmaRChaOS(2,2,2),DerSigmaLChaOS(2,2,2),DerSigmaSLChaOS(2,2,2),DerSigmaSRChaOS(2,2,2),& 
& DerSigmaRChaOS(2,2,2),DerSigmaLirChaOS(2,2,2),DerSigmaSLirChaOS(2,2,2),DerSigmaSRirChaOS(2,2,2),& 
& DerSigmaRirChaOS(2,2,2),SigmaLFeOS(3,3,3),SigmaSLFeOS(3,3,3),SigmaSRFeOS(3,3,3),       & 
& SigmaRFeOS(3,3,3),DerSigmaLFeOS(3,3,3),DerSigmaSLFeOS(3,3,3),DerSigmaSRFeOS(3,3,3),    & 
& DerSigmaRFeOS(3,3,3),DerSigmaLirFeOS(3,3,3),DerSigmaSLirFeOS(3,3,3),DerSigmaSRirFeOS(3,3,3),& 
& DerSigmaRirFeOS(3,3,3),SigmaLFdOS(3,3,3),SigmaSLFdOS(3,3,3),SigmaSRFdOS(3,3,3),        & 
& SigmaRFdOS(3,3,3),DerSigmaLFdOS(3,3,3),DerSigmaSLFdOS(3,3,3),DerSigmaSRFdOS(3,3,3),    & 
& DerSigmaRFdOS(3,3,3),DerSigmaLirFdOS(3,3,3),DerSigmaSLirFdOS(3,3,3),DerSigmaSRirFdOS(3,3,3),& 
& DerSigmaRirFdOS(3,3,3),SigmaLFuOS(3,3,3),SigmaSLFuOS(3,3,3),SigmaSRFuOS(3,3,3),        & 
& SigmaRFuOS(3,3,3),DerSigmaLFuOS(3,3,3),DerSigmaSLFuOS(3,3,3),DerSigmaSRFuOS(3,3,3),    & 
& DerSigmaRFuOS(3,3,3),DerSigmaLirFuOS(3,3,3),DerSigmaSLirFuOS(3,3,3),DerSigmaSRirFuOS(3,3,3),& 
& DerSigmaRirFuOS(3,3,3),SigmaLGluOS,SigmaSLGluOS,SigmaSRGluOS,SigmaRGluOS,              & 
& DerSigmaLGluOS,DerSigmaSLGluOS,DerSigmaSRGluOS,DerSigmaRGluOS,DerSigmaLirGluOS,        & 
& DerSigmaSLirGluOS,DerSigmaSRirGluOS,DerSigmaRirGluOS,PiVGOS,DerPiVGOS,PiVPOS,          & 
& DerPiVPOS,PiVZOS,DerPiVZOS,PiVWmOS,DerPiVWmOS,PiVPlight0OS,DerPiVPlight0OS,            & 
& PiVPheavy0OS,DerPiVPheavy0OS,PiVPlightMZOS,DerPiVPlightMZOS,PiVPheavyMZOS,             & 
& DerPiVPheavyMZOS,PiVPVZOS,DerPiVPVZOS,PiVZVPOS,DerPiVZVPOS,PiVZhhOS(3,3,3),            & 
& DerPiVZhhOS(3,3,3),PihhVZOS(3,3,3),DerPihhVZOS(3,3,3),PiVZAhOS(3,3,3),DerPiVZAhOS(3,3,3),& 
& PiAhVZOS(3,3,3),DerPiAhVZOS(3,3,3),PiVWmHpmOS(2,2,2),DerPiVWmHpmOS(2,2,2),             & 
& PiHpmVWmOS(2,2,2),DerPiHpmVWmOS(2,2,2)

Real(dp), Intent(in) :: MLambda, deltaM 

Integer, Intent(out) :: kont 
Real(dp),Intent(out) :: dg1,dg2,dg3,dmHd2,dmHu2,dms2,dvd,dvu,dvS,dZH(3,3),dZA(3,3),dZP(2,2),dSinTW,           & 
& dCosTW,dTanTW

Complex(dp),Intent(out) :: dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dlam,dTlam,dkap,dTk,dlamN(3,3),dTLN(3,3),         & 
& dYu(3,3),dTu(3,3),dYv(3,3),dTv(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),           & 
& dme2(3,3),dmv2(3,3),dM1,dM2,dM3,dpG,dZD(6,6),dZVI(6,6),dZVR(6,6),dZU(6,6),             & 
& dZE(6,6),dZN(5,5),dUV(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3),dZDL(3,3),            & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(out) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd(6,6),ZfSvIm(6,6),ZfSvRe(6,6),ZfSu(6,6),ZfSe(6,6),      & 
& Zfhh(3,3),ZfAh(3,3),ZfHpm(2,2),ZfL0(5,5),ZfFV(6,6),ZfLm(2,2),ZfLp(2,2),ZfFEL(3,3),     & 
& ZfFER(3,3),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),ZfVPVZ,ZfVZVP

Complex(dp),Intent(out) :: ctcplAhAhAh(3,3,3),ctcplAhAhhh(3,3,3),ctcplAhhhhh(3,3,3),ctcplAhHpmcHpm(3,2,2),       & 
& ctcplAhSdcSd(3,6,6),ctcplAhSecSe(3,6,6),ctcplAhSucSu(3,6,6),ctcplAhSvImSvIm(3,6,6),    & 
& ctcplAhSvImSvRe(3,6,6),ctcplAhSvReSvRe(3,6,6),ctcplhhhhhh(3,3,3),ctcplhhHpmcHpm(3,2,2),& 
& ctcplhhSdcSd(3,6,6),ctcplhhSecSe(3,6,6),ctcplhhSucSu(3,6,6),ctcplhhSvImSvIm(3,6,6),    & 
& ctcplhhSvImSvRe(3,6,6),ctcplhhSvReSvRe(3,6,6),ctcplHpmSucSd(2,6,6),ctcplHpmSvImcSe(2,6,6),& 
& ctcplHpmSvRecSe(2,6,6),ctcplSdcHpmcSu(6,2,6),ctcplSeSvImcHpm(6,6,2),ctcplSeSvRecHpm(6,6,2),& 
& ctcplAhhhVZ(3,3),ctcplAhHpmcVWm(3,2),ctcplAhcHpmVWm(3,2),ctcplhhHpmcVWm(3,2),          & 
& ctcplhhcHpmVWm(3,2),ctcplHpmcHpmVP(2,2),ctcplHpmcHpmVZ(2,2),ctcplSdcSdVG(6,6),         & 
& ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSucVWm(6,6),ctcplSeSvImcVWm(6,6),          & 
& ctcplSeSvRecVWm(6,6),ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSucSuVG(6,6),            & 
& ctcplSucSuVP(6,6),ctcplSucSdVWm(6,6),ctcplSucSuVZ(6,6),ctcplSvImSvReVZ(6,6),           & 
& ctcplSvImcSeVWm(6,6),ctcplSvRecSeVWm(6,6),ctcplhhcVWmVWm(3),ctcplhhVZVZ(3),            & 
& ctcplHpmcVWmVP(2),ctcplHpmcVWmVZ(2),ctcplcHpmVPVWm(2),ctcplcHpmVWmVZ(2),               & 
& ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcChaChaAhL(2,2,3),ctcplcChaChaAhR(2,2,3),& 
& ctcplChiChiAhL(5,5,3),ctcplChiChiAhR(5,5,3),ctcplcFdFdAhL(3,3,3),ctcplcFdFdAhR(3,3,3), & 
& ctcplcFeFeAhL(3,3,3),ctcplcFeFeAhR(3,3,3),ctcplcFuFuAhL(3,3,3),ctcplcFuFuAhR(3,3,3),   & 
& ctcplFvFvAhL(6,6,3),ctcplFvFvAhR(6,6,3),ctcplChiChacHpmL(5,2,2),ctcplChiChacHpmR(5,2,2),& 
& ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6),ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6),& 
& ctcplcChaChahhL(2,2,3),ctcplcChaChahhR(2,2,3),ctcplcFdChaSuL(3,2,6),ctcplcFdChaSuR(3,2,6),& 
& ctcplcFeChaSvImL(3,2,6),ctcplcFeChaSvImR(3,2,6),ctcplcFeChaSvReL(3,2,6),               & 
& ctcplcFeChaSvReR(3,2,6),ctcplChiChihhL(5,5,3),ctcplChiChihhR(5,5,3),ctcplChiFdcSdL(5,3,6),& 
& ctcplChiFdcSdR(5,3,6),ctcplChiFecSeL(5,3,6),ctcplChiFecSeR(5,3,6),ctcplChiFucSuL(5,3,6),& 
& ctcplChiFucSuR(5,3,6),ctcplChiFvSvImL(5,6,6),ctcplChiFvSvImR(5,6,6),ctcplChiFvSvReL(5,6,6),& 
& ctcplChiFvSvReR(5,6,6),ctcplcChaChiHpmL(2,5,2),ctcplcChaChiHpmR(2,5,2),ctcplcFdChiSdL(3,5,6),& 
& ctcplcFdChiSdR(3,5,6),ctcplcFeChiSeL(3,5,6),ctcplcFeChiSeR(3,5,6),ctcplcFuChiSuL(3,5,6),& 
& ctcplcFuChiSuR(3,5,6),ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6),ctcplcFdFdhhL(3,3,3),    & 
& ctcplcFdFdhhR(3,3,3),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),ctcplcFuFdcHpmL(3,3,2),& 
& ctcplcFuFdcHpmR(3,3,2),ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2),ctcplcFeFehhL(3,3,3),& 
& ctcplcFeFehhR(3,3,3),ctcplcChaFeSvImL(2,3,6),ctcplcChaFeSvImR(2,3,6),ctcplcChaFeSvReL(2,3,6),& 
& ctcplcChaFeSvReR(2,3,6),ctcplGluFucSuL(3,6),ctcplGluFucSuR(3,6),ctcplcFuFuhhL(3,3,3),  & 
& ctcplcFuFuhhR(3,3,3),ctcplcFdFuHpmL(3,3,2),ctcplcFdFuHpmR(3,3,2),ctcplFvFvhhL(6,6,3),  & 
& ctcplFvFvhhR(6,6,3),ctcplcFeFvHpmL(3,6,2),ctcplcFeFvHpmR(3,6,2),ctcplcChaFvSeL(2,6,6), & 
& ctcplcChaFvSeR(2,6,6),ctcplcFdGluSdL(3,6),ctcplcFdGluSdR(3,6),ctcplcFuGluSuL(3,6),     & 
& ctcplcFuGluSuR(3,6),ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),ctcplChiChacVWmL(5,2),& 
& ctcplChiChacVWmR(5,2),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),  & 
& ctcplcChaChaVZR(2,2),ctcplChiChiVZL(5,5),ctcplChiChiVZR(5,5),ctcplcChaChiVWmL(2,5),    & 
& ctcplcChaChiVWmR(2,5),ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3)

Complex(dp),Intent(out) :: ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),ctcplcFdFdVZR(3,3),ctcplcFuFdcVWmL(3,3),         & 
& ctcplcFuFdcVWmR(3,3),ctcplFvFecVWmL(6,3),ctcplFvFecVWmR(6,3),ctcplcFeFeVPL(3,3),       & 
& ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFuFuVGL(3,3),           & 
& ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),ctcplcFdFuVWmL(3,3),          & 
& ctcplcFdFuVWmR(3,3),ctcplcFuFuVZL(3,3),ctcplcFuFuVZR(3,3),ctcplFvFvVZL(6,6),           & 
& ctcplFvFvVZR(6,6),ctcplcFeFvVWmL(3,6),ctcplcFeFvVWmR(3,6),ctcplGluGluVGL,              & 
& ctcplGluGluVGR

Complex(dp),Intent(in) :: GcplAhHpmcHpm(3,2,2),GcplhhHpmcHpm(3,2,2),GcplHpmSucSd(2,6,6),GcplHpmSvImcSe(2,6,6),  & 
& GcplHpmSvRecSe(2,6,6),GcplSdcHpmcSu(6,2,6),GcplSeSvImcHpm(6,6,2),GcplSeSvRecHpm(6,6,2),& 
& GcplAhHpmcVWm(3,2),GcplAhcHpmVWm(3,2),GcplhhHpmcVWm(3,2),GcplhhcHpmVWm(3,2),           & 
& GcplHpmcHpmVP(2,2),GcplHpmcHpmVZ(2,2),GcplHpmcVWmVP(2),GcplHpmcVWmVZ(2),               & 
& GcplcHpmVPVWm(2),GcplcHpmVWmVZ(2),GcplChiChacHpmL(5,2,2),GcplChiChacHpmR(5,2,2),       & 
& GcplcChaChiHpmL(2,5,2),GcplcChaChiHpmR(2,5,2),GcplcFuFdcHpmL(3,3,2),GcplcFuFdcHpmR(3,3,2),& 
& GcplFvFecHpmL(6,3,2),GcplFvFecHpmR(6,3,2),GcplcFdFuHpmL(3,3,2),GcplcFdFuHpmR(3,3,2),   & 
& GcplcFeFvHpmL(3,6,2),GcplcFeFvHpmR(3,6,2)

Real(dp) ::  g1D(311) 
Real(dp) :: p2 
Logical :: TwoLoopRGEsave 
Real(dp) ::MVG,MVP,MVG2,MVP2
Complex(dp) ::  Tad1Loop(9)
Complex(dp) :: MatTad_hh(3,3)=0._dp 
Integer :: i1,i2,i3 

MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

Call OneLoopTadpoleshh(vd,vS,vu,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplcChaChahhL,cplcChaChahhR,   & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,      & 
& cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,Tad1Loop(1:3))

Tad1Loop(1:3) = MatMul(ZH,Tad1Loop(1:3)) 
Tad1Loop(1) = Tad1Loop(1)/vd 
Tad1Loop(2) = Tad1Loop(2)/vu 
Tad1Loop(3) = Tad1Loop(3)/vS 
Do i1=1,3
MatTad_hh(i1,i1) = Tad1Loop(0+ i1) 
End Do 
MatTad_hh = MatMul(MatMul(ZH,MatTad_hh),Transpose(ZH)) 
! Not working!! 
MatTad_hh= 0._dp
!--------------------------
!Sd
!--------------------------
Do i1=1,6
p2 = MSd2(i1)
Call Pi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,MChi2,          & 
& MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,MSe2,MSvIm,            & 
& MSvIm2,MSvRe,MSvRe2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,    & 
& cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,cplHpmSdcHpmcSd,cplSdSdcSdcSd,cplSdSecSdcSe,     & 
& cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvReSvRecSd,cplSdcSdVGVG,cplSdcSdVPVP,             & 
& cplSdcSdcVWmVWm,cplSdcSdVZVZ,kont,PiSd(i1,:,:))

Call DerPi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,             & 
& MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,MSe2,            & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,           & 
& cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,cplHpmSdcHpmcSd,           & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvReSvRecSd,           & 
& cplSdcSdVGVG,cplSdcSdVPVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,kont,DerPiSd(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSd(p2,MSd,MSd2,MAh,MAh2,MFu,MFu2,MCha,MCha2,MFd,MFd2,MChi,             & 
& MChi2,MGlu,MGlu2,Mhh,Mhh2,MSu,MSu2,MHpm,MHpm2,MVZ,MVZ2,MVWm,MVWm2,MSe,MSe2,            & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,           & 
& cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,cplHpmSdcHpmcSd,           & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvReSvRecSd,           & 
& cplSdcSdVGVG,cplSdcSdVPVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,kont,DerPiSdDR(i1,:,:))

p2 =MSd2OS(i1)
Call DerPi1LoopSd(p2,MSdOS,MSd2OS,MAhOS,MAh2OS,MFuOS,MFu2OS,MChaOS,MCha2OS,           & 
& MFdOS,MFd2OS,MChiOS,MChi2OS,MGluOS,MGlu2OS,MhhOS,Mhh2OS,MSuOS,MSu2OS,MHpmOS,           & 
& MHpm2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,MSvReOS,             & 
& MSvRe2OS,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,               & 
& cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSucSdVWm,cplAhAhSdcSd,cplhhhhSdcSd,cplHpmSdcHpmcSd,cplSdSdcSdcSd,cplSdSecSdcSe,     & 
& cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvReSvRecSd,cplSdcSdVGVG,cplSdcSdVPVP,             & 
& cplSdcSdcVWmVWm,cplSdcSdVZVZ,kont,DerPiSdOS(i1,:,:))

DerPiSd(i1,:,:) = DerPiSd(i1,:,:)- DerPiSdDR(i1,:,:) + DerPiSdOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!SvIm
!--------------------------
Do i1=1,6
p2 = MSvIm2(i1)
Call Pi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,               & 
& cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,   & 
& cplSvImSvReVZ,cplAhAhSvImSvIm,cplhhhhSvImSvIm,cplHpmSvImSvImcHpm,cplSdSvImSvImcSd,     & 
& cplSeSvImSvImcSe,cplSuSvImSvImcSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,             & 
& cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,kont,PiSvIm(i1,:,:))

Call DerPi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MSd,MSd2,MSu,MSu2,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,           & 
& cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,   & 
& cplSvImSvReVZ,cplAhAhSvImSvIm,cplhhhhSvImSvIm,cplHpmSvImSvImcHpm,cplSdSvImSvImcSd,     & 
& cplSeSvImSvImcSe,cplSuSvImSvImcSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,             & 
& cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,kont,DerPiSvIm(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSvIm(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MSd,MSd2,MSu,MSu2,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,           & 
& cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,   & 
& cplSvImSvReVZ,cplAhAhSvImSvIm,cplhhhhSvImSvIm,cplHpmSvImSvImcHpm,cplSdSvImSvImcSd,     & 
& cplSeSvImSvImcSe,cplSuSvImSvImcSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,             & 
& cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,kont,DerPiSvImDR(i1,:,:))

p2 =MSvIm2OS(i1)
Call DerPi1LoopSvIm(p2,MSvImOS,MSvIm2OS,MAhOS,MAh2OS,MSvReOS,MSvRe2OS,MFeOS,          & 
& MFe2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MSeOS,MSe2OS,           & 
& MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MSdOS,MSd2OS,MSuOS,MSu2OS,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,cplChiFvSvImL,cplChiFvSvImR,               & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,cplSvImSvReVZ,cplAhAhSvImSvIm, & 
& cplhhhhSvImSvIm,cplHpmSvImSvImcHpm,cplSdSvImSvImcSd,cplSeSvImSvImcSe,cplSuSvImSvImcSu, & 
& cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,            & 
& kont,DerPiSvImOS(i1,:,:))

DerPiSvIm(i1,:,:) = DerPiSvIm(i1,:,:)- DerPiSvImDR(i1,:,:) + DerPiSvImOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!SvRe
!--------------------------
Do i1=1,6
p2 = MSvRe2(i1)
Call Pi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,MCha2,           & 
& MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,MSd,              & 
& MSd2,MSu,MSu2,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,   & 
& cplSvImSvReVZ,cplAhAhSvReSvRe,cplhhhhSvReSvRe,cplHpmSvReSvRecHpm,cplSdSvReSvRecSd,     & 
& cplSeSvReSvRecSe,cplSuSvReSvRecSu,cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,             & 
& cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,kont,PiSvRe(i1,:,:))

Call DerPi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MSd,MSd2,MSu,MSu2,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,           & 
& cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,   & 
& cplSvImSvReVZ,cplAhAhSvReSvRe,cplhhhhSvReSvRe,cplHpmSvReSvRecHpm,cplSdSvReSvRecSd,     & 
& cplSeSvReSvRecSe,cplSuSvReSvRecSu,cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,             & 
& cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,kont,DerPiSvRe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSvRe(p2,MSvIm,MSvIm2,MAh,MAh2,MSvRe,MSvRe2,MFe,MFe2,MCha,              & 
& MCha2,MFv,MFv2,MChi,MChi2,Mhh,Mhh2,MSe,MSe2,MHpm,MHpm2,MVWm,MVWm2,MVZ,MVZ2,            & 
& MSd,MSd2,MSu,MSu2,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,           & 
& cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,   & 
& cplSvImSvReVZ,cplAhAhSvReSvRe,cplhhhhSvReSvRe,cplHpmSvReSvRecHpm,cplSdSvReSvRecSd,     & 
& cplSeSvReSvRecSe,cplSuSvReSvRecSu,cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,             & 
& cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,kont,DerPiSvReDR(i1,:,:))

p2 =MSvRe2OS(i1)
Call DerPi1LoopSvRe(p2,MSvImOS,MSvIm2OS,MAhOS,MAh2OS,MSvReOS,MSvRe2OS,MFeOS,          & 
& MFe2OS,MChaOS,MCha2OS,MFvOS,MFv2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MSeOS,MSe2OS,           & 
& MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MSdOS,MSd2OS,MSuOS,MSu2OS,cplAhSvImSvRe,    & 
& cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,cplChiFvSvReL,cplChiFvSvReR,               & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,cplSvImSvReVZ,cplAhAhSvReSvRe, & 
& cplhhhhSvReSvRe,cplHpmSvReSvRecHpm,cplSdSvReSvRecSd,cplSeSvReSvRecSe,cplSuSvReSvRecSu, & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,            & 
& kont,DerPiSvReOS(i1,:,:))

DerPiSvRe(i1,:,:) = DerPiSvRe(i1,:,:)- DerPiSvReDR(i1,:,:) + DerPiSvReOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Su
!--------------------------
Do i1=1,6
p2 = MSu2(i1)
Call Pi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,               & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,MSe2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplAhAhSucSu,cplhhhhSucSu,cplHpmSucHpmcSu,            & 
& cplSdSucSdcSu,cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,           & 
& cplSucSuVGVG,cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,kont,PiSu(i1,:,:))

Call DerPi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,            & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,MSe2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplAhAhSucSu,cplhhhhSucSu,cplHpmSucHpmcSu,            & 
& cplSdSucSdcSu,cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,           & 
& cplSucSuVGVG,cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,kont,DerPiSu(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSu(p2,MSu,MSu2,MAh,MAh2,MFu,MFu2,MChi,MChi2,MCha,MCha2,MFd,            & 
& MFd2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MVWm,MVWm2,MVZ,MVZ2,MSe,MSe2,             & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplAhAhSucSu,cplhhhhSucSu,cplHpmSucHpmcSu,            & 
& cplSdSucSdcSu,cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,           & 
& cplSucSuVGVG,cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,kont,DerPiSuDR(i1,:,:))

p2 =MSu2OS(i1)
Call DerPi1LoopSu(p2,MSuOS,MSu2OS,MAhOS,MAh2OS,MFuOS,MFu2OS,MChiOS,MChi2OS,           & 
& MChaOS,MCha2OS,MFdOS,MFd2OS,MGluOS,MGlu2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,MSdOS,          & 
& MSd2OS,MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MSeOS,MSe2OS,MSvImOS,MSvIm2OS,MSvReOS,              & 
& MSvRe2OS,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,cplcChaFdcSuR,             & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,             & 
& cplSucSuVP,cplSucSuVZ,cplAhAhSucSu,cplhhhhSucSu,cplHpmSucHpmcSu,cplSdSucSdcSu,         & 
& cplSeSucSecSu,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSucSuVGVG,            & 
& cplSucSuVPVP,cplSucSucVWmVWm,cplSucSuVZVZ,kont,DerPiSuOS(i1,:,:))

DerPiSu(i1,:,:) = DerPiSu(i1,:,:)- DerPiSuDR(i1,:,:) + DerPiSuOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Se
!--------------------------
Do i1=1,6
p2 = MSe2(i1)
Call Pi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,MSd,MSd2,            & 
& MSu,MSu2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,               & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,            & 
& cplSvRecSeVWm,cplAhAhSecSe,cplhhhhSecSe,cplHpmSecHpmcSe,cplSdSecSdcSe,cplSeSecSecSe,   & 
& cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSecSeVPVP,cplSecSecVWmVWm,          & 
& cplSecSeVZVZ,kont,PiSe(i1,:,:))

Call DerPi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,             & 
& MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,               & 
& MSd,MSd2,MSu,MSu2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,      & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,            & 
& cplSvRecSeVWm,cplAhAhSecSe,cplhhhhSecSe,cplHpmSecHpmcSe,cplSdSecSdcSe,cplSeSecSecSe,   & 
& cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSecSeVPVP,cplSecSecVWmVWm,          & 
& cplSecSeVZVZ,kont,DerPiSe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopSe(p2,MSe,MSe2,MAh,MAh2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MChi,             & 
& MChi2,Mhh,Mhh2,MSvIm,MSvIm2,MHpm,MHpm2,MSvRe,MSvRe2,MVZ,MVZ2,MVWm,MVWm2,               & 
& MSd,MSd2,MSu,MSu2,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,      & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,            & 
& cplSvRecSeVWm,cplAhAhSecSe,cplhhhhSecSe,cplHpmSecHpmcSe,cplSdSecSdcSe,cplSeSecSecSe,   & 
& cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSecSeVPVP,cplSecSecVWmVWm,          & 
& cplSecSeVZVZ,kont,DerPiSeDR(i1,:,:))

p2 =MSe2OS(i1)
Call DerPi1LoopSe(p2,MSeOS,MSe2OS,MAhOS,MAh2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,           & 
& MFeOS,MFe2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MSvImOS,MSvIm2OS,MHpmOS,MHpm2OS,              & 
& MSvReOS,MSvRe2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSuOS,MSu2OS,cplAhSecSe,     & 
& cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplhhSecSe,cplHpmSvImcSe,          & 
& cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplAhAhSecSe,          & 
& cplhhhhSecSe,cplHpmSecHpmcSe,cplSdSecSdcSe,cplSeSecSecSe,cplSeSucSecSu,cplSeSvImSvImcSe,& 
& cplSeSvReSvRecSe,cplSecSeVPVP,cplSecSecVWmVWm,cplSecSeVZVZ,kont,DerPiSeOS(i1,:,:))

DerPiSe(i1,:,:) = DerPiSe(i1,:,:)- DerPiSeDR(i1,:,:) + DerPiSeOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!hh
!--------------------------
Do i1=1,3
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,        & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh, & 
& cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh,          & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,     & 
& cplhhhhSvReSvRe,cplhhhhcVWmVWm,cplhhhhVZVZ,kont,Pihh(i1,:,:))

Pihh(i1,:,:) = Pihh(i1,:,:) + MatTad_hh
Call DerPi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,        & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh, & 
& cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh,          & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,     & 
& cplhhhhSvReSvRe,cplhhhhcVWmVWm,cplhhhhVZVZ,kont,DerPihh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1Loophh(p2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MCha,MCha2,MChi,MChi2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,        & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh, & 
& cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh,          & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,     & 
& cplhhhhSvReSvRe,cplhhhhcVWmVWm,cplhhhhVZVZ,kont,DerPihhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1Loophh(p2,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MChaOS,MCha2OS,           & 
& MChiOS,MChi2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MHpmOS,             & 
& MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,        & 
& MSvReOS,MSvRe2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,       & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,cplAhAhhhhh,          & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,     & 
& cplhhhhSvReSvRe,cplhhhhcVWmVWm,cplhhhhVZVZ,kont,DerPihhOS(i1,:,:))

DerPihh(i1,:,:) = DerPihh(i1,:,:)- DerPihhDR(i1,:,:) + DerPihhOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Ah
!--------------------------
Do i1=1,3
p2 = MAh2(i1)
Call Pi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,      & 
& cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplAhAhcVWmVWm, & 
& cplAhAhVZVZ,kont,PiAh(i1,:,:))

Call DerPi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,      & 
& cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplAhAhcVWmVWm, & 
& cplAhAhVZVZ,kont,DerPiAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopAh(p2,MAh,MAh2,Mhh,Mhh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,      & 
& cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplAhAhcVWmVWm, & 
& cplAhAhVZVZ,kont,DerPiAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopAh(p2,MAhOS,MAh2OS,MhhOS,Mhh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,         & 
& MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MHpmOS,               & 
& MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,        & 
& MSvReOS,MSvRe2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,         & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,    & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,       & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplAhAhcVWmVWm,              & 
& cplAhAhVZVZ,kont,DerPiAhOS(i1,:,:))

DerPiAh(i1,:,:) = DerPiAh(i1,:,:)- DerPiAhDR(i1,:,:) + DerPiAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Hpm
!--------------------------
Do i1=1,2
p2 = MHpm2(i1)
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,              & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,               & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,    & 
& cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,      & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,       & 
& cplAhAhHpmcHpm,cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,       & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,& 
& cplHpmcHpmVZVZ,kont,PiHpm(i1,:,:))

Call DerPi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,           & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,               & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,    & 
& cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,      & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,       & 
& cplAhAhHpmcHpm,cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,       & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,& 
& cplHpmcHpmVZVZ,kont,DerPiHpm(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWm,MVWm2,MChi,MChi2,MCha,MCha2,           & 
& MFu,MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,               & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,    & 
& cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,      & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,       & 
& cplAhAhHpmcHpm,cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,       & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,& 
& cplHpmcHpmVZVZ,kont,DerPiHpmDR(i1,:,:))

p2 =MHpm2OS(i1)
Call DerPi1LoopHpm(p2,MHpmOS,MHpm2OS,MAhOS,MAh2OS,MVWmOS,MVWm2OS,MChiOS,              & 
& MChi2OS,MChaOS,MCha2OS,MFuOS,MFu2OS,MFdOS,MFd2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,            & 
& MhhOS,Mhh2OS,MVZOS,MVZ2OS,MSuOS,MSu2OS,MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSeOS,            & 
& MSe2OS,MSvReOS,MSvRe2OS,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,       & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcgZgWmcHpm,cplcgWmgZHpm,      & 
& cplcgWpCgZcHpm,cplcgZgWpCHpm,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,      & 
& cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm,     & 
& cplhhhhHpmcHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,      & 
& cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplHpmcHpmVPVP,cplHpmcHpmcVWmVWm,cplHpmcHpmVZVZ, & 
& kont,DerPiHpmOS(i1,:,:))

DerPiHpm(i1,:,:) = DerPiHpm(i1,:,:)- DerPiHpmDR(i1,:,:) + DerPiHpmOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Chi
!--------------------------
Do i1=1,5
p2 = MChi2(i1)
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,MVWm2,           & 
& Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,MFu2,               & 
& MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,SigmaLChi(i1,:,:),SigmaRChi(i1,:,:)         & 
& ,SigmaSLChi(i1,:,:),SigmaSRChi(i1,:,:))

Call DerSigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,              & 
& MVWm2,Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,              & 
& MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,DerSigmaLChi(i1,:,:),DerSigmaRChi(i1,:,:)   & 
& ,DerSigmaSLChi(i1,:,:),DerSigmaSRChi(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,MHpm,MHpm2,MCha,MCha2,MVWm,              & 
& MVWm2,Mhh,Mhh2,MVZ,MVZ2,MSd,MSd2,MFd,MFd2,MSe,MSe2,MFe,MFe2,MSu,MSu2,MFu,              & 
& MFu2,MSvIm,MSvIm2,MFv,MFv2,MSvRe,MSvRe2,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,DerSigmaLChiDR(i1,:,:),DerSigmaRChiDR(i1,:,:)& 
& ,DerSigmaSLChiDR(i1,:,:),DerSigmaSRChiDR(i1,:,:))

p2 =MChi2OS(i1)
Call DerSigma1LoopChi(p2,MChiOS,MChi2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChaOS,           & 
& MCha2OS,MVWmOS,MVWm2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MSdOS,MSd2OS,MFdOS,MFd2OS,            & 
& MSeOS,MSe2OS,MFeOS,MFe2OS,MSuOS,MSu2OS,MFuOS,MFu2OS,MSvImOS,MSvIm2OS,MFvOS,            & 
& MFv2OS,MSvReOS,MSvRe2OS,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,cplChiChacHpmR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,     & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,DerSigmaLChiOS(i1,:,:),DerSigmaRChiOS(i1,:,:)            & 
& ,DerSigmaSLChiOS(i1,:,:),DerSigmaSRChiOS(i1,:,:))

DerSigmaLChi(i1,:,:) = DerSigmaLChi(i1,:,:) - DerSigmaLChiDR(i1,:,:)! + DerSigmaLChiOS(i1,:,:)
DerSigmaRChi(i1,:,:) = DerSigmaRChi(i1,:,:) - DerSigmaRChiDR(i1,:,:)! + DerSigmaRChiOS(i1,:,:)
DerSigmaSLChi(i1,:,:) = DerSigmaSLChi(i1,:,:) - DerSigmaSLChiDR(i1,:,:)! + DerSigmaSLChiOS(i1,:,:)
DerSigmaSRChi(i1,:,:) = DerSigmaSRChi(i1,:,:) - DerSigmaSRChiDR(i1,:,:)! + DerSigmaSRChiOS(i1,:,:)
DerSigmaLirChi(i1,:,:) =  + DerSigmaLChiOS(i1,:,:)
DerSigmaRirChi(i1,:,:) =  + DerSigmaRChiOS(i1,:,:)
DerSigmaSLirChi(i1,:,:) = + DerSigmaSLChiOS(i1,:,:)
DerSigmaSRirChi(i1,:,:) = + DerSigmaSRChiOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirChi(i1,:,:) =  0._dp
DerSigmaRirChi(i1,:,:) =  0._dp
DerSigmaSLirChi(i1,:,:) = 0._dp
DerSigmaSRirChi(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fv
!--------------------------
Do i1=1,6
p2 = MFv2(i1)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,              & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,           & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,SigmaLFv(i1,:,:),SigmaRFv(i1,:,:)               & 
& ,SigmaSLFv(i1,:,:),SigmaSRFv(i1,:,:))

Call DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,           & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,           & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFv(i1,:,:),DerSigmaRFv(i1,:,:)         & 
& ,DerSigmaSLFv(i1,:,:),DerSigmaSRFv(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MSe,MSe2,MCha,MCha2,MSvIm,MSvIm2,           & 
& MChi,MChi2,MSvRe,MSvRe2,MHpm,MHpm2,MFe,MFe2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,              & 
& cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,           & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,       & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFvDR(i1,:,:),DerSigmaRFvDR(i1,:,:)     & 
& ,DerSigmaSLFvDR(i1,:,:),DerSigmaSRFvDR(i1,:,:))

p2 =MFv2OS(i1)
Call DerSigma1LoopFv(p2,MFvOS,MFv2OS,MAhOS,MAh2OS,MSeOS,MSe2OS,MChaOS,MCha2OS,        & 
& MSvImOS,MSvIm2OS,MChiOS,MChi2OS,MSvReOS,MSvRe2OS,MHpmOS,MHpm2OS,MFeOS,MFe2OS,          & 
& MVWmOS,MVWm2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,           & 
& cplFvChacSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,               & 
& cplFvFvVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,           & 
& cplcFeFvVWmR,DerSigmaLFvOS(i1,:,:),DerSigmaRFvOS(i1,:,:),DerSigmaSLFvOS(i1,:,:)        & 
& ,DerSigmaSRFvOS(i1,:,:))

DerSigmaLFv(i1,:,:) = DerSigmaLFv(i1,:,:) - DerSigmaLFvDR(i1,:,:)! + DerSigmaLFvOS(i1,:,:)
DerSigmaRFv(i1,:,:) = DerSigmaRFv(i1,:,:) - DerSigmaRFvDR(i1,:,:)! + DerSigmaRFvOS(i1,:,:)
DerSigmaSLFv(i1,:,:) = DerSigmaSLFv(i1,:,:) - DerSigmaSLFvDR(i1,:,:)! + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRFv(i1,:,:) = DerSigmaSRFv(i1,:,:) - DerSigmaSRFvDR(i1,:,:)! + DerSigmaSRFvOS(i1,:,:)
DerSigmaLirFv(i1,:,:) =  + DerSigmaLFvOS(i1,:,:)
DerSigmaRirFv(i1,:,:) =  + DerSigmaRFvOS(i1,:,:)
DerSigmaSLirFv(i1,:,:) = + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRirFv(i1,:,:) = + DerSigmaSRFvOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFv(i1,:,:) =  0._dp
DerSigmaRirFv(i1,:,:) =  0._dp
DerSigmaSLirFv(i1,:,:) = 0._dp
DerSigmaSRirFv(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Cha
!--------------------------
Do i1=1,2
p2 =MCha2(i1)
Call Sigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,               & 
& MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,MSvRe2,            & 
& MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,         & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,SigmaLCha(i1,:,:),SigmaRCha(i1,:,:)           & 
& ,SigmaSLCha(i1,:,:),SigmaSRCha(i1,:,:))

Call DerSigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,            & 
& MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,MSvRe2,            & 
& MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,         & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,DerSigmaLCha(i1,:,:),DerSigmaRCha(i1,:,:)     & 
& ,DerSigmaSLCha(i1,:,:),DerSigmaSRCha(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopCha(p2,MCha,MCha2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,            & 
& MChi,MChi2,MVWm,MVWm2,MSu,MSu2,MFd,MFd2,MSvIm,MSvIm2,MFe,MFe2,MSvRe,MSvRe2,            & 
& MSe,MSe2,MFv,MFv2,MFu,MFu2,MSd,MSd2,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,         & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,DerSigmaLChaDR(i1,:,:),DerSigmaRChaDR(i1,:,:) & 
& ,DerSigmaSLChaDR(i1,:,:),DerSigmaSRChaDR(i1,:,:))

p2 =MCha2OS(i1)
Call DerSigma1LoopCha(p2,MChaOS,MCha2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,              & 
& MVZ2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,MVWmOS,MVWm2OS,MSuOS,MSu2OS,MFdOS,MFd2OS,         & 
& MSvImOS,MSvIm2OS,MFeOS,MFe2OS,MSvReOS,MSvRe2OS,MSeOS,MSe2OS,MFvOS,MFv2OS,              & 
& MFuOS,MFu2OS,MSdOS,MSd2OS,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,     & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,  & 
& cplcChacFuSdR,DerSigmaLChaOS(i1,:,:),DerSigmaRChaOS(i1,:,:),DerSigmaSLChaOS(i1,:,:)    & 
& ,DerSigmaSRChaOS(i1,:,:))

DerSigmaLCha(i1,:,:) = DerSigmaLCha(i1,:,:) - DerSigmaLChaDR(i1,:,:)! + DerSigmaLChaOS(i1,:,:)
DerSigmaRCha(i1,:,:) = DerSigmaRCha(i1,:,:) - DerSigmaRChaDR(i1,:,:)! + DerSigmaRChaOS(i1,:,:)
DerSigmaSLCha(i1,:,:) = DerSigmaSLCha(i1,:,:) - DerSigmaSLChaDR(i1,:,:)! + DerSigmaSLChaOS(i1,:,:)
DerSigmaSRCha(i1,:,:) = DerSigmaSRCha(i1,:,:) - DerSigmaSRChaDR(i1,:,:)! + DerSigmaSRChaOS(i1,:,:)
DerSigmaLirCha(i1,:,:) = + DerSigmaLChaOS(i1,:,:)
DerSigmaRirCha(i1,:,:) = + DerSigmaRChaOS(i1,:,:)
DerSigmaSLirCha(i1,:,:) = + DerSigmaSLChaOS(i1,:,:)
DerSigmaSRirCha(i1,:,:) = + DerSigmaSRChaOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirCha(i1,:,:) = 0._dp
DerSigmaRirCha(i1,:,:) = 0._dp
DerSigmaSLirCha(i1,:,:) = 0._dp
DerSigmaSRirCha(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fe
!--------------------------
Do i1=1,3
p2 =MFe2(i1)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,MSvRe2,          & 
& MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& SigmaLFe(i1,:,:),SigmaRFe(i1,:,:),SigmaSLFe(i1,:,:),SigmaSRFe(i1,:,:))

Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,              & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,           & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& DerSigmaLFe(i1,:,:),DerSigmaRFe(i1,:,:),DerSigmaSLFe(i1,:,:),DerSigmaSRFe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,              & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,           & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& DerSigmaLFeDR(i1,:,:),DerSigmaRFeDR(i1,:,:),DerSigmaSLFeDR(i1,:,:),DerSigmaSRFeDR(i1,:,:))

p2 =MFe2OS(i1)
Call DerSigma1LoopFe(p2,MFeOS,MFe2OS,MAhOS,MAh2OS,MSvImOS,MSvIm2OS,MChaOS,            & 
& MCha2OS,MSvReOS,MSvRe2OS,MSeOS,MSe2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MVZOS,               & 
& MVZ2OS,MHpmOS,MHpm2OS,MFvOS,MFv2OS,MVWmOS,MVWm2OS,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,              & 
& cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,DerSigmaLFeOS(i1,:,:)  & 
& ,DerSigmaRFeOS(i1,:,:),DerSigmaSLFeOS(i1,:,:),DerSigmaSRFeOS(i1,:,:))

DerSigmaLFe(i1,:,:) = DerSigmaLFe(i1,:,:) - DerSigmaLFeDR(i1,:,:)! + DerSigmaLFeOS(i1,:,:)
DerSigmaRFe(i1,:,:) = DerSigmaRFe(i1,:,:) - DerSigmaRFeDR(i1,:,:)! + DerSigmaRFeOS(i1,:,:)
DerSigmaSLFe(i1,:,:) = DerSigmaSLFe(i1,:,:) - DerSigmaSLFeDR(i1,:,:)! + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRFe(i1,:,:) = DerSigmaSRFe(i1,:,:) - DerSigmaSRFeDR(i1,:,:)! + DerSigmaSRFeOS(i1,:,:)
DerSigmaLirFe(i1,:,:) = + DerSigmaLFeOS(i1,:,:)
DerSigmaRirFe(i1,:,:) = + DerSigmaRFeOS(i1,:,:)
DerSigmaSLirFe(i1,:,:) = + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRirFe(i1,:,:) = + DerSigmaSRFeOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFe(i1,:,:) = 0._dp
DerSigmaRirFe(i1,:,:) = 0._dp
DerSigmaSLirFe(i1,:,:) = 0._dp
DerSigmaSRirFe(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fd
!--------------------------
Do i1=1,3
p2 =MFd2(i1)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,             & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,          & 
& cplcFdGluSdR,SigmaLFd(i1,:,:),SigmaRFd(i1,:,:),SigmaSLFd(i1,:,:),SigmaSRFd(i1,:,:))

Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,               & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,          & 
& cplcFdGluSdR,DerSigmaLFd(i1,:,:),DerSigmaRFd(i1,:,:),DerSigmaSLFd(i1,:,:)              & 
& ,DerSigmaSRFd(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,               & 
& MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,          & 
& cplcFdGluSdR,DerSigmaLFdDR(i1,:,:),DerSigmaRFdDR(i1,:,:),DerSigmaSLFdDR(i1,:,:)        & 
& ,DerSigmaSRFdDR(i1,:,:))

p2 =MFd2OS(i1)
Call DerSigma1LoopFd(p2,MFdOS,MFd2OS,MAhOS,MAh2OS,MSuOS,MSu2OS,MChaOS,MCha2OS,        & 
& MSdOS,MSd2OS,MChiOS,MChi2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MHpmOS,MHpm2OS,MFuOS,            & 
& MFu2OS,MVWmOS,MVWm2OS,MGluOS,MGlu2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFdChaSuL,             & 
& cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,DerSigmaLFdOS(i1,:,:) & 
& ,DerSigmaRFdOS(i1,:,:),DerSigmaSLFdOS(i1,:,:),DerSigmaSRFdOS(i1,:,:))

DerSigmaLFd(i1,:,:) = DerSigmaLFd(i1,:,:) - DerSigmaLFdDR(i1,:,:)! + DerSigmaLFdOS(i1,:,:)
DerSigmaRFd(i1,:,:) = DerSigmaRFd(i1,:,:) - DerSigmaRFdDR(i1,:,:)! + DerSigmaRFdOS(i1,:,:)
DerSigmaSLFd(i1,:,:) = DerSigmaSLFd(i1,:,:) - DerSigmaSLFdDR(i1,:,:)! + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRFd(i1,:,:) = DerSigmaSRFd(i1,:,:) - DerSigmaSRFdDR(i1,:,:)! + DerSigmaSRFdOS(i1,:,:)
DerSigmaLirFd(i1,:,:) = + DerSigmaLFdOS(i1,:,:)
DerSigmaRirFd(i1,:,:) = + DerSigmaRFdOS(i1,:,:)
DerSigmaSLirFd(i1,:,:) = + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRirFd(i1,:,:) = + DerSigmaSRFdOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFd(i1,:,:) = 0._dp
DerSigmaRirFd(i1,:,:) = 0._dp
DerSigmaSLirFd(i1,:,:) = 0._dp
DerSigmaSRirFd(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fu
!--------------------------
Do i1=1,3
p2 =MFu2(i1)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,MFd,            & 
& MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,           & 
& cplcChacFuSdR,SigmaLFu(i1,:,:),SigmaRFu(i1,:,:),SigmaSLFu(i1,:,:),SigmaSRFu(i1,:,:))

Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,             & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,           & 
& cplcChacFuSdR,DerSigmaLFu(i1,:,:),DerSigmaRFu(i1,:,:),DerSigmaSLFu(i1,:,:)             & 
& ,DerSigmaSRFu(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,             & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MGlu,MGlu2,MCha,MCha2,MSd,MSd2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,           & 
& cplcChacFuSdR,DerSigmaLFuDR(i1,:,:),DerSigmaRFuDR(i1,:,:),DerSigmaSLFuDR(i1,:,:)       & 
& ,DerSigmaSRFuDR(i1,:,:))

p2 =MFu2OS(i1)
Call DerSigma1LoopFu(p2,MFuOS,MFu2OS,MAhOS,MAh2OS,MSuOS,MSu2OS,MChiOS,MChi2OS,        & 
& MHpmOS,MHpm2OS,MFdOS,MFd2OS,MVWmOS,MVWm2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MGluOS,           & 
& MGlu2OS,MChaOS,MCha2OS,MSdOS,MSd2OS,cplcFuFuAhL,cplcFuFuAhR,cplcFuChiSuL,              & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,      & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,DerSigmaLFuOS(i1,:,:)& 
& ,DerSigmaRFuOS(i1,:,:),DerSigmaSLFuOS(i1,:,:),DerSigmaSRFuOS(i1,:,:))

DerSigmaLFu(i1,:,:) = DerSigmaLFu(i1,:,:) - DerSigmaLFuDR(i1,:,:)! + DerSigmaLFuOS(i1,:,:)
DerSigmaRFu(i1,:,:) = DerSigmaRFu(i1,:,:) - DerSigmaRFuDR(i1,:,:)! + DerSigmaRFuOS(i1,:,:)
DerSigmaSLFu(i1,:,:) = DerSigmaSLFu(i1,:,:) - DerSigmaSLFuDR(i1,:,:)! + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRFu(i1,:,:) = DerSigmaSRFu(i1,:,:) - DerSigmaSRFuDR(i1,:,:)! + DerSigmaSRFuOS(i1,:,:)
DerSigmaLirFu(i1,:,:) = + DerSigmaLFuOS(i1,:,:)
DerSigmaRirFu(i1,:,:) = + DerSigmaRFuOS(i1,:,:)
DerSigmaSLirFu(i1,:,:) = + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRirFu(i1,:,:) = + DerSigmaSRFuOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFu(i1,:,:) = 0._dp
DerSigmaRirFu(i1,:,:) = 0._dp
DerSigmaSLirFu(i1,:,:) = 0._dp
DerSigmaSRirFu(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Glu
!--------------------------
p2 = MGlu2
Call Sigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,cplGluFdcSdL,    & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,SigmaLGlu,SigmaRGlu,SigmaSLGlu,SigmaSRGlu)

Call DerSigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,DerSigmaLGlu,DerSigmaRGlu,         & 
& DerSigmaSLGlu,DerSigmaSRGlu)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopGlu(p2,MSd,MSd2,MFd,MFd2,MSu,MSu2,MFu,MFu2,MGlu,MGlu2,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,DerSigmaLGluDR,DerSigmaRGluDR,     & 
& DerSigmaSLGluDR,DerSigmaSRGluDR)

p2 = MGlu2OS
Call DerSigma1LoopGlu(p2,MSdOS,MSd2OS,MFdOS,MFd2OS,MSuOS,MSu2OS,MFuOS,MFu2OS,         & 
& MGluOS,MGlu2OS,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,       & 
& cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,DerSigmaLGluOS,       & 
& DerSigmaRGluOS,DerSigmaSLGluOS,DerSigmaSRGluOS)

DerSigmaLGlu = DerSigmaLGlu - DerSigmaLGluDR !+ DerSigmaLGluOS
DerSigmaRGlu = DerSigmaRGlu - DerSigmaRGluDR !+ DerSigmaRGluOS
DerSigmaSLGlu = DerSigmaSLGlu - DerSigmaSLGluDR !+ DerSigmaSLGluOS
DerSigmaSRGlu = DerSigmaSRGlu - DerSigmaSRGluDR !+ DerSigmaSRGluOS
DerSigmaLirGlu = + DerSigmaLGluOS
DerSigmaRirGlu = + DerSigmaRGluOS
DerSigmaSLirGlu = + DerSigmaSLGluOS
DerSigmaSRirGlu = + DerSigmaSRGluOS
IRdivonly=.False. 
Else 
DerSigmaLirGlu = 0._dp
DerSigmaRirGlu = 0._dp
DerSigmaSLirGlu = 0._dp
DerSigmaSRirGlu = 0._dp 
End if 
!--------------------------
!VG
!--------------------------
p2 = MVG2
Call Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,cplcFdFdVGL,         & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,cplGluGluVGR,              & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,   & 
& cplVGVGVGVG3,kont,PiVG)

Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,cplcFdFdVGL,      & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,cplGluGluVGR,              & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,   & 
& cplVGVGVGVG3,kont,DerPiVG)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MSd,MSd2,MSu,MSu2,cplcFdFdVGL,      & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplGluGluVGL,cplGluGluVGR,              & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,   & 
& cplVGVGVGVG3,kont,DerPiVGDR)

p2 = 0.
Call DerPi1LoopVG(p2,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,MGlu2OS,MSdOS,MSd2OS,           & 
& MSuOS,MSu2OS,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,               & 
& cplGluGluVGL,cplGluGluVGR,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplSdcSdVGVG,cplSucSuVGVG,   & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,DerPiVGOS)

DerPiVG = DerPiVG-DerPiVGDR + DerPiVGOS
IRdivonly=.False. 
End if 
!--------------------------
!VP
!--------------------------
p2 = MVP2
Call Pi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,              & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVP)

Call DerPi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,           & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,           & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPDR)

p2 = 0.
Call DerPi1LoopVP(p2,MChaOS,MCha2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,           & 
& MHpmOS,MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,GcplHpmcHpmVP,GcplHpmcVWmVP,cplSdcSdVP,        & 
& cplSecSeVP,cplSucSuVP,cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,           & 
& cplSucSuVPVP,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPOS)

DerPiVP = DerPiVP-DerPiVPDR + DerPiVPOS
IRdivonly=.False. 
End if 
!--------------------------
!VZ
!--------------------------
p2 = MVZ2
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,PiVZ)

Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,DerPiVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,          & 
& cplcVWmVWmVZVZ3,kont,DerPiVZDR)

p2 = MVZ2OS
Call DerPi1LoopVZ(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,         & 
& MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MHpmOS,               & 
& MHpm2OS,MVWmOS,MVWm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvReOS,MSvRe2OS,        & 
& MSvImOS,MSvIm2OS,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,      & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,GcplHpmcHpmVZ,             & 
& GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,             & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,         & 
& cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,       & 
& kont,DerPiVZOS)

DerPiVZ = DerPiVZ-DerPiVZDR + DerPiVZOS
IRdivonly=.False. 
End if 
!--------------------------
!VWm
!--------------------------
p2 = MVWm2
Call Pi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,MFd,            & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,MSvIm,           & 
& MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,               & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,PiVWm)

Call DerPi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,             & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,         & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,DerPiVWm)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWm(p2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MSu,MSu2,MSd,MSd2,             & 
& MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,         & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,    & 
& cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,      & 
& cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,DerPiVWmDR)

p2 = MVWm2OS
Call DerPi1LoopVWm(p2,MHpmOS,MHpm2OS,MAhOS,MAh2OS,MChiOS,MChi2OS,MChaOS,              & 
& MCha2OS,MFuOS,MFu2OS,MFdOS,MFd2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MhhOS,Mhh2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,MSuOS,MSu2OS,MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSeOS,          & 
& MSe2OS,MSvReOS,MSvRe2OS,GcplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgWpCgZcVWm,GcplhhHpmcVWm,cplhhcVWmVWm,GcplHpmcVWmVP,GcplHpmcVWmVZ,cplSdcSucVWm,    & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm,cplhhhhcVWmVWm,   & 
& cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvImSvImcVWmVWm,  & 
& cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3, & 
& kont,DerPiVWmOS)

DerPiVWm = DerPiVWm-DerPiVWmDR + DerPiVWmOS
IRdivonly=.False. 
End if 
!--------------------------
! Additional Self-Energies for Photon
!--------------------------
p2 = 0._dp
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,              & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPlight0)

Call DerPi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,           & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPlight0)

OnlyLightStates = .False. 
p2 = 0._dp
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,              & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPheavy0)

Call DerPi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,           & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPheavy0)

OnlyHeavyStates = .False. 
p2 = MVZ2
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,              & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPlightMZ)

Call DerPi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,           & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPlightMZ)

OnlyLightStates = .False. 
p2 = MVZ2
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,              & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,PiVPheavyMZ)

Call DerPi1LoopVP(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MVWm,           & 
& MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm3,    & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,kont,DerPiVPheavyMZ)

OnlyHeavyStates = .False. 
!--------------------------
!VP
!--------------------------
p2 = MVZ2
Call Pi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MSd,             & 
& MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,           & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,             & 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,PiVPVZ)

Call DerPi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,             & 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,DerPiVPVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,             & 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,DerPiVPVZDR)

p2 =MVZ2OS
Call DerPi1LoopVPVZ(p2,MChaOS,MCha2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,         & 
& MHpmOS,MHpm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MVWmOS,MVWm2OS,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,          & 
& cplcgWpCgWpCVZ,GcplcHpmVPVWm,GcplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,               & 
& cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVWmVZ,GcplHpmcHpmVP,cplHpmcHpmVPVZ,             & 
& GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,          & 
& cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,kont,            & 
& DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
p2 = 0._dp 
Call Pi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,MSd,             & 
& MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,           & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,             & 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,PiVZVP)

Call DerPi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,             & 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,DerPiVZVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MCha,MCha2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MVWm,MVWm2,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,       & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcHpmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,             & 
& cplcVWmVWmVZ,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVPVZ,cplSucSuVZ,kont,DerPiVPVZDR)

p2 = 0._dp 
Call DerPi1LoopVPVZ(p2,MChaOS,MCha2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,         & 
& MHpmOS,MHpm2OS,MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MVWmOS,MVWm2OS,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,          & 
& cplcgWpCgWpCVZ,GcplcHpmVPVWm,GcplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVPVWmVZ1,               & 
& cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmVWmVZ,GcplHpmcHpmVP,cplHpmcHpmVPVZ,             & 
& GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVPVZ,cplSdcSdVZ,          & 
& cplSecSeVP,cplSecSeVPVZ,cplSecSeVZ,cplSucSuVP,cplSucSuVPVZ,cplSucSuVZ,kont,            & 
& DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
Do i1=1,3
p2 = Mhh2(i1)
Call Pi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,PiVZhh(i1,:,:))

Call DerPi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1LoopVZhh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,      & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,GcplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,GcplhhcHpmVWm,cplhhcVWmVWm,GcplhhHpmcHpm,             & 
& GcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,GcplHpmcHpmVZ,            & 
& GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhhOS(i1,:,:))

DerPiVZhh(i1,:,:) = DerPiVZhh(i1,:,:)- DerPiVZhhDR(i1,:,:) + DerPiVZhhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZ2
Call Pi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,PihhVZ)

Call DerPi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPihhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhhDR)

p2 =MVZ2OS
Call DerPi1LoopVZhh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplChiChihhL,      & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,GcplcHpmVWmVZ,cplcVWmVWmVZ,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,GcplhhcHpmVWm,cplhhcVWmVWm,GcplhhHpmcHpm,             & 
& GcplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvRe,GcplHpmcHpmVZ,            & 
& GcplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZhhOS)

DerPiVZhh = DerPiVZhh- DerPiVZhhDR + DerPiVZhhOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
Do i1=1,3
p2 = MAh2(i1)
Call Pi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,       & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,PiVZAh(i1,:,:))

Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,       & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,       & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,cplAhAhhh,GcplAhcHpmVWm,cplAhhhVZ,GcplAhHpmcHpm,           & 
& GcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,            & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,GcplcHpmVWmVZ,      & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,GcplHpmcHpmVZ,GcplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZAhOS(i1,:,:))

DerPiVZAh(i1,:,:) = DerPiVZAh(i1,:,:)- DerPiVZAhDR(i1,:,:) + DerPiVZAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZ2
Call Pi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,             & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,       & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,PiAhVZ)

Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,       & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiAhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,        & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,cplcHpmVWmVZ,       & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,       & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZAhDR)

p2 =MVZ2OS
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,              & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,cplAhAhhh,GcplAhcHpmVWm,cplAhhhVZ,GcplAhHpmcHpm,           & 
& GcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvRe,cplcChaChaAhL,            & 
& cplcChaChaAhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmAh,cplcgWmgWmVZ,cplcgWpCgWpCAh,          & 
& cplcgWpCgWpCVZ,cplChiChiAhL,cplChiChiAhR,cplChiChiVZL,cplChiChiVZR,GcplcHpmVWmVZ,      & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,GcplHpmcHpmVZ,GcplHpmcVWmVZ,     & 
& cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,kont,DerPiVZAhOS)

DerPiVZAh = DerPiVZAh- DerPiVZAhDR + DerPiVZAhOS
IRdivonly=.False. 
End if
!--------------------------
!VWm
!--------------------------
Do i1=1,2
p2 = MHpm2(i1)
Call Pi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,  & 
& cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,        & 
& cplSvImcSeVWm,cplSvRecSeVWm,kont,PiVWmHpm(i1,:,:))

Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,  & 
& cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,        & 
& cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpm(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,  & 
& cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,        & 
& cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpmDR(i1,:,:))

p2 =MHpm2OS(i1)
Call DerPi1LoopVWmHpm(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,            & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,GcplAhcHpmVWm,GcplAhHpmcHpm,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,GcplcFuFdcHpmL,GcplcFuFdcHpmR,     & 
& cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,  & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,GcplcHpmVWmVZ,cplcVWmVPVWm,              & 
& cplcVWmVWmVZ,GcplFvFecHpmL,GcplFvFecHpmR,GcplhhcHpmVWm,cplhhcVWmVWm,GcplhhHpmcHpm,     & 
& GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplSdcHpmcSu,GcplSeSvImcHpm,GcplSeSvRecHpm,               & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpmOS(i1,:,:))

DerPiVWmHpm(i1,:,:) = DerPiVWmHpm(i1,:,:)- DerPiVWmHpmDR(i1,:,:) + DerPiVWmHpmOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVWm2
Call Pi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,  & 
& cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,        & 
& cplSvImcSeVWm,cplSvRecSeVWm,kont,PiHpmVWm)

Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,  & 
& cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,        & 
& cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiHpmVWm)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWmHpm(p2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,         & 
& MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,cplAhcHpmVWm,cplAhHpmcHpm,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,  & 
& cplcgZgWpCVWm,cplChiChacHpmL,cplChiChacHpmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,    & 
& cplcVWmVWmVZ,cplFvFecHpmL,cplFvFecHpmR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhHpmcHpm,         & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVWm,        & 
& cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpmDR)

p2 =MVWm2OS
Call DerPi1LoopVWmHpm(p2,MAhOS,MAh2OS,MChaOS,MCha2OS,MChiOS,MChi2OS,MFdOS,            & 
& MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpmOS,MHpm2OS,             & 
& MSdOS,MSd2OS,MSeOS,MSe2OS,MSuOS,MSu2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,              & 
& MVWmOS,MVWm2OS,MVZOS,MVZ2OS,GcplAhcHpmVWm,GcplAhHpmcHpm,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,GcplcFuFdcHpmL,GcplcFuFdcHpmR,     & 
& cplcgAgWpCVWm,cplcgWmgZVWm,cplcgWpCgAcHpm,cplcgWpCgZcHpm,cplcgZgWmcHpm,cplcgZgWpCVWm,  & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,GcplcHpmVWmVZ,cplcVWmVPVWm,              & 
& cplcVWmVWmVZ,GcplFvFecHpmL,GcplFvFecHpmR,GcplhhcHpmVWm,cplhhcVWmVWm,GcplhhHpmcHpm,     & 
& GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplSdcHpmcSu,GcplSeSvImcHpm,GcplSeSvRecHpm,               & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,kont,DerPiVWmHpmOS)

DerPiVWmHpm = DerPiVWmHpm- DerPiVWmHpmDR + DerPiVWmHpmOS
IRdivonly=.False. 
End if
! -----------------------------------------------------------
! Calculate now all wave-function renormalisation constants 
! -----------------------------------------------------------


!  ######    VG    ###### 
ZfVG = -DerPiVG


!  ######    fG    ###### 
ZffG = -SigmaRGlu + &
& -MGlu*(MGlu*DerSigmaRGlu+MGlu*DerSigmaLGlu+DerSigmaSRGlu+DerSigmaSLGlu)
If (OSkinematics) Then 
ZffG = ZffG &
& + -MGluOS*(MGluOS*DerSigmaRirGlu+MGluOS*DerSigmaLirGlu+(DerSigmaSRirGlu+DerSigmaSLirGlu))
Else 
ZffG = ZffG &
& + -MGlu*(MGlu*DerSigmaRirGlu+MGlu*DerSigmaLirGlu+(DerSigmaSRirGlu+DerSigmaSLirGlu))
End if 


!  ######    VP    ###### 
ZfVP = -DerPiVP


!  ######    VZ    ###### 
ZfVZ = -DerPiVZ


!  ######    VWm    ###### 
ZfVWm = -DerPiVWm


!  ######    Sd    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSd(i1).eq.MSd(i2))) Then 
       ZfSd(i1,i2) = -DerPiSd(i1,i1,i2)
   Else 
       ZfSd(i1,i2) = 2._dp/(MSd2(i1)-MSd2(i2))*PiSd(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    SvIm    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSvIm(i1).eq.MSvIm(i2))) Then 
       ZfSvIm(i1,i2) = -DerPiSvIm(i1,i1,i2)
   Else 
       ZfSvIm(i1,i2) = 2._dp/(MSvIm2(i1)-MSvIm2(i2))*PiSvIm(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    SvRe    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSvRe(i1).eq.MSvRe(i2))) Then 
       ZfSvRe(i1,i2) = -DerPiSvRe(i1,i1,i2)
   Else 
       ZfSvRe(i1,i2) = 2._dp/(MSvRe2(i1)-MSvRe2(i2))*PiSvRe(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Su    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSu(i1).eq.MSu(i2))) Then 
       ZfSu(i1,i2) = -DerPiSu(i1,i1,i2)
   Else 
       ZfSu(i1,i2) = 2._dp/(MSu2(i1)-MSu2(i2))*PiSu(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Se    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MSe(i1).eq.MSe(i2))) Then 
       ZfSe(i1,i2) = -DerPiSe(i1,i1,i2)
   Else 
       ZfSe(i1,i2) = 2._dp/(MSe2(i1)-MSe2(i2))*PiSe(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    hh    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(Mhh(i1).eq.Mhh(i2))) Then 
       Zfhh(i1,i2) = -DerPihh(i1,i1,i2)
   Else 
       Zfhh(i1,i2) = 2._dp/(Mhh2(i1)-Mhh2(i2))*Pihh(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Ah    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MAh(i1).eq.MAh(i2))) Then 
       ZfAh(i1,i2) = -DerPiAh(i1,i1,i2)
   Else 
       ZfAh(i1,i2) = 2._dp/(MAh2(i1)-MAh2(i2))*PiAh(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Hpm    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(MHpm(i1).eq.MHpm(i2))) Then 
       ZfHpm(i1,i2) = -DerPiHpm(i1,i1,i2)
   Else 
       ZfHpm(i1,i2) = 2._dp/(MHpm2(i1)-MHpm2(i2))*PiHpm(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    L0    ###### 
Do i1=1,5
  Do i2=1,5
   If ((i1.eq.i2).or.(MChi(i1).eq.MChi(i2))) Then 
     ZfL0(i1,i2) = -SigmaRChi(i2,i1,i2) &
      & -MChi2(i1)*(DerSigmaRChi(i2,i1,i2) + DerSigmaLChi(i2,i1,i2))&
      & -MChi(i1)*(DerSigmaSRChi(i2,i1,i2)+DerSigmaSLChi(i2,i1,i2))
     If (OSkinematics) Then 
     ZfL0(i1,i2) = ZfL0(i1,i2) &
      & -MChi2OS(i1)*(DerSigmaRirChi(i2,i1,i2) + DerSigmaLirChi(i2,i1,i2))&
      & -MChiOS(i1)*(DerSigmaSRirChi(i2,i1,i2)+DerSigmaSLirChi(i2,i1,i2))
     Else 
     ZfL0(i1,i2) = ZfL0(i1,i2) &
      & -MChi2(i1)*(DerSigmaRirChi(i2,i1,i2) + DerSigmaLirChi(i2,i1,i2))&
      & -MChi(i1)*(DerSigmaSRirChi(i2,i1,i2)+DerSigmaSLirChi(i2,i1,i2))
     End if 
   Else 
     ZfL0(i1,i2) = 2._dp/(MChi2(i1) - MChi2(i2))* &
      & (MChi2(i2)*SigmaRChi(i2,i1,i2) + MChi(i1)*MChi(i2)*SigmaLChi(i2,i1,i2) + MChi(i1)*SigmaSRChi(i2,i1,i2) + MChi(i2)*SigmaSLChi(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FV    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFv(i1).eq.MFv(i2))) Then 
     ZfFV(i1,i2) = -SigmaRFv(i2,i1,i2) &
      & -MFv2(i1)*(DerSigmaRFv(i2,i1,i2) + DerSigmaLFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRFv(i2,i1,i2)+DerSigmaSLFv(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFV(i1,i2) = ZfFV(i1,i2) &
      & -MFv2OS(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFvOS(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     Else 
     ZfFV(i1,i2) = ZfFV(i1,i2) &
      & -MFv2(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     End if 
   Else 
     ZfFV(i1,i2) = 2._dp/(MFv2(i1) - MFv2(i2))* &
      & (MFv2(i2)*SigmaRFv(i2,i1,i2) + MFv(i1)*MFv(i2)*SigmaLFv(i2,i1,i2) + MFv(i1)*SigmaSRFv(i2,i1,i2) + MFv(i2)*SigmaSLFv(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    Lm    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(MCha(i1).eq.MCha(i2))) Then 
     ZfLm(i1,i2) = -SigmaRCha(i2,i1,i2) &
      & -MCha2(i1)*(DerSigmaRCha(i2,i1,i2) + DerSigmaLCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSRCha(i2,i1,i2)+DerSigmaSLCha(i2,i1,i2))
     If (OSkinematics) Then 
     ZfLm(i1,i2) = ZfLm(i1,i2) &
      & -MCha2OS(i1)*(DerSigmaRirCha(i2,i1,i2) + DerSigmaLirCha(i2,i1,i2))&
      & -MChaOS(i1)*(DerSigmaSRirCha(i2,i1,i2)+DerSigmaSLirCha(i2,i1,i2))
     Else 
     ZfLm(i1,i2) = ZfLm(i1,i2) &
      & -MCha2(i1)*(DerSigmaRirCha(i2,i1,i2) + DerSigmaLirCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSRirCha(i2,i1,i2)+DerSigmaSLirCha(i2,i1,i2))
     End if 
   Else 
     ZfLm(i1,i2) = 2._dp/(MCha2(i1) - MCha2(i2))* &
      & (MCha2(i2)*SigmaRCha(i2,i1,i2) + MCha(i1)*MCha(i2)*SigmaLCha(i2,i1,i2) + MCha(i1)*SigmaSRCha(i2,i1,i2) + MCha(i2)*SigmaSLCha(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    Lp    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(MCha(i1).eq.MCha(i2))) Then 
     ZfLp(i1,i2) = -SigmaLCha(i2,i1,i2) &
      & -MCha2(i1)*(DerSigmaLCha(i2,i1,i2) + DerSigmaRCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSLCha(i2,i1,i2)+DerSigmaSRCha(i2,i1,i2))
     If (OSkinematics) Then 
     ZfLp(i1,i2) = ZfLp(i1,i2) &
      & -MCha2OS(i1)*(DerSigmaLirCha(i2,i1,i2) + DerSigmaRirCha(i2,i1,i2))&
      & -MChaOS(i1)*(DerSigmaSLirCha(i2,i1,i2)+DerSigmaSRirCha(i2,i1,i2))
     Else 
     ZfLp(i1,i2) = ZfLp(i1,i2) &
      & -MCha2(i1)*(DerSigmaLirCha(i2,i1,i2) + DerSigmaRirCha(i2,i1,i2))&
      & -MCha(i1)*(DerSigmaSLirCha(i2,i1,i2)+DerSigmaSRirCha(i2,i1,i2))
     End if 
   Else 
     ZfLp(i1,i2) = 2._dp/(MCha2(i1) - MCha2(i2))* &
      & (MCha2(i2)*SigmaLCha(i2,i1,i2) + MCha(i1)*MCha(i2)*SigmaRCha(i2,i1,i2) + MCha(i1)*SigmaSLCha(i2,i1,i2) + MCha(i2)*SigmaSRCha(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FEL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfFEL(i1,i2) = -SigmaRFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaRFe(i2,i1,i2) + DerSigmaLFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRFe(i2,i1,i2)+DerSigmaSLFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFEL(i1,i2) = ZfFEL(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     Else 
     ZfFEL(i1,i2) = ZfFEL(i1,i2) &
      & -MFe2(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     End if 
   Else 
     ZfFEL(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*SigmaSRFe(i2,i1,i2) + MFe(i2)*SigmaSLFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FER    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfFER(i1,i2) = -SigmaLFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaLFe(i2,i1,i2) + DerSigmaRFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLFe(i2,i1,i2)+DerSigmaSRFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFER(i1,i2) = ZfFER(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     Else 
     ZfFER(i1,i2) = ZfFER(i1,i2) &
      & -MFe2(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     End if 
   Else 
     ZfFER(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*SigmaSLFe(i2,i1,i2) + MFe(i2)*SigmaSRFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FDL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfFDL(i1,i2) = -SigmaRFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaRFd(i2,i1,i2) + DerSigmaLFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRFd(i2,i1,i2)+DerSigmaSLFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFDL(i1,i2) = ZfFDL(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     Else 
     ZfFDL(i1,i2) = ZfFDL(i1,i2) &
      & -MFd2(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     End if 
   Else 
     ZfFDL(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*SigmaSRFd(i2,i1,i2) + MFd(i2)*SigmaSLFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FDR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfFDR(i1,i2) = -SigmaLFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaLFd(i2,i1,i2) + DerSigmaRFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLFd(i2,i1,i2)+DerSigmaSRFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFDR(i1,i2) = ZfFDR(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     Else 
     ZfFDR(i1,i2) = ZfFDR(i1,i2) &
      & -MFd2(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     End if 
   Else 
     ZfFDR(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*SigmaSLFd(i2,i1,i2) + MFd(i2)*SigmaSRFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FUL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfFUL(i1,i2) = -SigmaRFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaRFu(i2,i1,i2) + DerSigmaLFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRFu(i2,i1,i2)+DerSigmaSLFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFUL(i1,i2) = ZfFUL(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     Else 
     ZfFUL(i1,i2) = ZfFUL(i1,i2) &
      & -MFu2(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     End if 
   Else 
     ZfFUL(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*SigmaSRFu(i2,i1,i2) + MFu(i2)*SigmaSLFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FUR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfFUR(i1,i2) = -SigmaLFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaLFu(i2,i1,i2) + DerSigmaRFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLFu(i2,i1,i2)+DerSigmaSRFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFUR(i1,i2) = ZfFUR(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     Else 
     ZfFUR(i1,i2) = ZfFUR(i1,i2) &
      & -MFu2(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     End if 
   Else 
     ZfFUR(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*SigmaSLFu(i2,i1,i2) + MFu(i2)*SigmaSRFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    VPVZ    ###### 
ZfVPVZ = 2._dp*PiVPVZ/(MVP2-MVZ2 )
ZfVZVP = 2._dp*PiVZVP/(MVZ2-MVP2 )
! -----------------------------------------------------------
! Setting the Counter-Terms 
! -----------------------------------------------------------
! ----------- getting the divergent pieces ---------

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG311(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,            & 
& Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,g1D)

TwoLoopRGEsave=TwoLoopRGE 
TwoLoopRGE=.False. 
Call rge311(311,0._dp,g1D,g1D) 
TwoLoopRGE=TwoLoopRGEsave 
Call GToParameters311(g1D,dg1,dg2,dg3,dYd,dYe,dlam,dkap,dlamN,dYu,dYv,dTd,            & 
& dTe,dTlam,dTk,dTLN,dTu,dTv,dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dmv2,dms2,             & 
& dM1,dM2,dM3,dvd,dvu,dvS)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
dg1 = Sqrt(3._dp/5._dp)*dg1 
! ----------------------- 
 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
dg1 = 0.5_dp*divergence*dg1 
dg2 = 0.5_dp*divergence*dg2 
dg3 = 0.5_dp*divergence*dg3 
dYd = 0.5_dp*divergence*dYd 
dTd = 0.5_dp*divergence*dTd 
dYe = 0.5_dp*divergence*dYe 
dTe = 0.5_dp*divergence*dTe 
dlam = 0.5_dp*divergence*dlam 
dTlam = 0.5_dp*divergence*dTlam 
dkap = 0.5_dp*divergence*dkap 
dTk = 0.5_dp*divergence*dTk 
dlamN = 0.5_dp*divergence*dlamN 
dTLN = 0.5_dp*divergence*dTLN 
dYu = 0.5_dp*divergence*dYu 
dTu = 0.5_dp*divergence*dTu 
dYv = 0.5_dp*divergence*dYv 
dTv = 0.5_dp*divergence*dTv 
dmq2 = 0.5_dp*divergence*dmq2 
dml2 = 0.5_dp*divergence*dml2 
dmHd2 = 0.5_dp*divergence*dmHd2 
dmHu2 = 0.5_dp*divergence*dmHu2 
dmd2 = 0.5_dp*divergence*dmd2 
dmu2 = 0.5_dp*divergence*dmu2 
dme2 = 0.5_dp*divergence*dme2 
dmv2 = 0.5_dp*divergence*dmv2 
dms2 = 0.5_dp*divergence*dms2 
dM1 = 0.5_dp*divergence*dM1 
dM2 = 0.5_dp*divergence*dM2 
dM3 = 0.5_dp*divergence*dM3 
dvd = 0.5_dp*divergence*dvd 
dvu = 0.5_dp*divergence*dvu 
dvS = 0.5_dp*divergence*dvS 
dpG = 0._dp 
dZD = 0._dp 
dZVI = 0._dp 
dZVR = 0._dp 
dZU = 0._dp 
dZE = 0._dp 
dZH = 0._dp 
dZA = 0._dp 
dZP = 0._dp 
dZN = 0._dp 
dUV = 0._dp 
dUM = 0._dp 
dUP = 0._dp 
dZEL = 0._dp 
dZER = 0._dp 
dZDL = 0._dp 
dZDR = 0._dp 
dZUL = 0._dp 
dZUR = 0._dp 
dSinTW = 0._dp 
dCosTW = 0._dp 
dTanTW = 0._dp 
If (CTinLoopDecays) Then 
End if 
 
dUM = 0.25_dp*MatMul(ZfLm- Conjg(Transpose(ZfLm)),UM)
dUP = 0.25_dp*MatMul(ZfLp- Conjg(Transpose(ZfLp)),UP)
dUV = 0.25_dp*MatMul(ZfFV- Conjg(Transpose(ZfFV)),UV)
dZA = 0.25_dp*MatMul(ZfAh- Conjg(Transpose(ZfAh)),ZA)
dZD = 0.25_dp*MatMul(ZfSd- Conjg(Transpose(ZfSd)),ZD)
dZDL = 0.25_dp*MatMul(ZfFDL- Conjg(Transpose(ZfFDL)),ZDL)
dZDR = 0.25_dp*MatMul(ZfFDR- Conjg(Transpose(ZfFDR)),ZDR)
dZE = 0.25_dp*MatMul(ZfSe- Conjg(Transpose(ZfSe)),ZE)
dZEL = 0.25_dp*MatMul(ZfFEL- Conjg(Transpose(ZfFEL)),ZEL)
dZER = 0.25_dp*MatMul(ZfFER- Conjg(Transpose(ZfFER)),ZER)
dZH = 0.25_dp*MatMul(Zfhh- Conjg(Transpose(Zfhh)),ZH)
dZN = 0.25_dp*MatMul(ZfL0- Conjg(Transpose(ZfL0)),ZN)
dZP = 0.25_dp*MatMul(ZfHpm- Conjg(Transpose(ZfHpm)),ZP)
dZU = 0.25_dp*MatMul(ZfSu- Conjg(Transpose(ZfSu)),ZU)
dZUL = 0.25_dp*MatMul(ZfFUL- Conjg(Transpose(ZfFUL)),ZUL)
dZUR = 0.25_dp*MatMul(ZfFUR- Conjg(Transpose(ZfFUR)),ZUR)
dZVI = 0.25_dp*MatMul(ZfSvIm- Conjg(Transpose(ZfSvIm)),ZVI)
dZVR = 0.25_dp*MatMul(ZfSvRe- Conjg(Transpose(ZfSvRe)),ZVR)


! -----------------------------------------------------------
! Calculating the CT vertices 
! -----------------------------------------------------------
Call CalculateCouplingCT(lam,Tlam,kap,Tk,vd,vu,vS,ZA,g1,g2,ZH,ZP,Yd,Td,               & 
& ZD,Ye,Te,ZE,Yu,Tu,ZU,lamN,TLN,Yv,Tv,ZVI,ZVR,TW,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,            & 
& ZUL,ZUR,UV,pG,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dZA,dg1,dg2,dZH,dZP,dYd,dTd,             & 
& dZD,dYe,dTe,dZE,dYu,dTu,dZU,dlamN,dTLN,dYv,dTv,dZVI,dZVR,dSinTW,dCosTW,dTanTW,         & 
& dg3,dUM,dUP,dZN,dZDL,dZDR,dZEL,dZER,dZUL,dZUR,dUV,dpG,ctcplAhAhAh,ctcplAhAhhh,         & 
& ctcplAhhhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvImSvIm,     & 
& ctcplAhSvImSvRe,ctcplAhSvReSvRe,ctcplhhhhhh,ctcplhhHpmcHpm,ctcplhhSdcSd,               & 
& ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,ctcplhhSvImSvRe,ctcplhhSvReSvRe,             & 
& ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,ctcplSdcHpmcSu,ctcplSeSvImcHpm,          & 
& ctcplSeSvRecHpm,ctcplAhhhVZ,ctcplAhHpmcVWm,ctcplAhcHpmVWm,ctcplhhHpmcVWm,              & 
& ctcplhhcHpmVWm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,   & 
& ctcplSdcSucVWm,ctcplSeSvImcVWm,ctcplSeSvRecVWm,ctcplSecSeVP,ctcplSecSeVZ,              & 
& ctcplSucSuVG,ctcplSucSuVP,ctcplSucSdVWm,ctcplSucSuVZ,ctcplSvImSvReVZ,ctcplSvImcSeVWm,  & 
& ctcplSvRecSeVWm,ctcplhhcVWmVWm,ctcplhhVZVZ,ctcplHpmcVWmVP,ctcplHpmcVWmVZ,              & 
& ctcplcHpmVPVWm,ctcplcHpmVWmVZ,ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,               & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplChiChiAhL,ctcplChiChiAhR,ctcplcFdFdAhL,           & 
& ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,    & 
& ctcplFvFvAhR,ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChaFucSdL,ctcplChaFucSdR,          & 
& ctcplFvChacSeL,ctcplFvChacSeR,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcFdChaSuL,          & 
& ctcplcFdChaSuR,ctcplcFeChaSvImL,ctcplcFeChaSvImR,ctcplcFeChaSvReL,ctcplcFeChaSvReR,    & 
& ctcplChiChihhL,ctcplChiChihhR,ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,            & 
& ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,ctcplChiFvSvImL,ctcplChiFvSvImR,          & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcFdChiSdL,      & 
& ctcplcFdChiSdR,ctcplcFeChiSeL,ctcplcFeChiSeR,ctcplcFuChiSuL,ctcplcFuChiSuR,            & 
& ctcplGluFdcSdL,ctcplGluFdcSdR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcChaFdcSuL,             & 
& ctcplcChaFdcSuR,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,ctcplFvFecHpmL,ctcplFvFecHpmR,         & 
& ctcplcFeFehhL,ctcplcFeFehhR,ctcplcChaFeSvImL,ctcplcChaFeSvImR,ctcplcChaFeSvReL,        & 
& ctcplcChaFeSvReR,ctcplGluFucSuL,ctcplGluFucSuR,ctcplcFuFuhhL,ctcplcFuFuhhR,            & 
& ctcplcFdFuHpmL,ctcplcFdFuHpmR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvHpmL,ctcplcFeFvHpmR, & 
& ctcplcChaFvSeL,ctcplcChaFvSeR,ctcplcFdGluSdL,ctcplcFdGluSdR,ctcplcFuGluSuL,            & 
& ctcplcFuGluSuR,ctcplcChacFuSdL,ctcplcChacFuSdR,ctcplChiChacVWmL,ctcplChiChacVWmR,      & 
& ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplChiChiVZL,        & 
& ctcplChiChiVZR,ctcplcChaChiVWmL,ctcplcChaChiVWmR,ctcplcFdFdVGL,ctcplcFdFdVGR,          & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFuFdcVWmL,               & 
& ctcplcFuFdcVWmR,ctcplFvFecVWmL,ctcplFvFecVWmR,ctcplcFeFeVPL,ctcplcFeFeVPR,             & 
& ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFdFuVWmL,ctcplcFdFuVWmR,ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplFvFvVZL,ctcplFvFvVZR,   & 
& ctcplcFeFvVWmL,ctcplcFeFvVWmR,ctcplGluGluVGL,ctcplGluGluVGR)

End Subroutine WaveFunctionRenormalisation 
Subroutine CalculateOneLoopDecays(gP1LSvRe,gP1LSvIm,gP1LHpm,gP1Lhh,gP1LAh,            & 
& gP1LSu,gP1LSd,gP1LSe,gP1LGlu,gP1LCha,gP1LChi,gP1LFv,MSdOS,MSd2OS,MSvImOS,              & 
& MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,         & 
& MHpmOS,MHpm2OS,MChiOS,MChi2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,          & 
& MFd2OS,MFuOS,MFu2OS,MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,             & 
& ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,            & 
& ZULOS,ZUROS,vd,vu,vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,              & 
& Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,epsI,deltaM,kont)

Implicit None 
Real(dp), Intent(in) :: epsI, deltaM 
Integer, Intent(inout) :: kont 
Real(dp) :: MLambda, em, gs, vSM, sinW2, g1SM, g2SM 
Integer :: divset, i1 
Complex(dp) :: divvalue, YuSM(3,3), YdSM(3,3), YeSM(3,3) 
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Real(dp),Intent(inout) :: vd,vu,vS

Real(dp) :: dg1,dg2,dg3,dmHd2,dmHu2,dms2,dvd,dvu,dvS,dZH(3,3),dZA(3,3),dZP(2,2),dSinTW,           & 
& dCosTW,dTanTW

Complex(dp) :: dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dlam,dTlam,dkap,dTk,dlamN(3,3),dTLN(3,3),         & 
& dYu(3,3),dTu(3,3),dYv(3,3),dTv(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),           & 
& dme2(3,3),dmv2(3,3),dM1,dM2,dM3,dpG,dZD(6,6),dZVI(6,6),dZVR(6,6),dZU(6,6),             & 
& dZE(6,6),dZN(5,5),dUV(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3),dZDL(3,3),            & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd(6,6),ZfSvIm(6,6),ZfSvRe(6,6),ZfSu(6,6),ZfSe(6,6),      & 
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

Real(dp) :: p2, q2, q2_save 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: cplAhAhAhAh1(3,3,3,3),cplAhAhAhhh1(3,3,3,3),cplAhAhhhhh1(3,3,3,3),cplAhAhHpmcHpm1(3,3,2,2),& 
& cplAhAhSdcSdaa(3,3,6,6),cplAhAhSecSe1(3,3,6,6),cplAhAhSucSuaa(3,3,6,6),cplAhAhSvImSvIm1(3,3,6,6),& 
& cplAhAhSvImSvRe1(3,3,6,6),cplAhAhSvReSvRe1(3,3,6,6),cplAhhhhhhh1(3,3,3,3),             & 
& cplAhhhHpmcHpm1(3,3,2,2),cplAhhhSdcSdaa(3,3,6,6),cplAhhhSecSe1(3,3,6,6),               & 
& cplAhhhSucSuaa(3,3,6,6),cplAhhhSvImSvIm1(3,3,6,6),cplAhhhSvImSvRe1(3,3,6,6),           & 
& cplAhhhSvReSvRe1(3,3,6,6),cplAhHpmSucSdaa(3,2,6,6),cplAhHpmSvImcSe1(3,2,6,6),          & 
& cplAhHpmSvRecSe1(3,2,6,6),cplAhSdcHpmcSuaa(3,6,2,6),cplAhSeSvImcHpm1(3,6,6,2),         & 
& cplAhSeSvRecHpm1(3,6,6,2),cplhhhhhhhh1(3,3,3,3),cplhhhhHpmcHpm1(3,3,2,2),              & 
& cplhhhhSdcSdaa(3,3,6,6),cplhhhhSecSe1(3,3,6,6),cplhhhhSucSuaa(3,3,6,6),cplhhhhSvImSvIm1(3,3,6,6),& 
& cplhhhhSvImSvRe1(3,3,6,6),cplhhhhSvReSvRe1(3,3,6,6),cplhhHpmSucSdaa(3,2,6,6),          & 
& cplhhHpmSvImcSe1(3,2,6,6),cplhhHpmSvRecSe1(3,2,6,6),cplhhSdcHpmcSuaa(3,6,2,6),         & 
& cplhhSeSvImcHpm1(3,6,6,2),cplhhSeSvRecHpm1(3,6,6,2),cplHpmHpmcHpmcHpm1(2,2,2,2),       & 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),       & 
& cplHpmSvImSvImcHpm1(2,6,6,2),cplHpmSvImSvRecHpm1(2,6,6,2),cplHpmSvReSvRecHpm1(2,6,6,2),& 
& cplSdSdcSdcSdabba(6,6,6,6),cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),        & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),     & 
& cplSdSvImcSecSuaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),cplSdSvRecSecSuaa(6,6,6,6),     & 
& cplSeSecSecSe1(6,6,6,6),cplSeSuSvImcSdaa(6,6,6,6),cplSeSuSvRecSdaa(6,6,6,6),           & 
& cplSeSucSecSuaa(6,6,6,6),cplSeSvImSvImcSe1(6,6,6,6),cplSeSvImSvRecSe1(6,6,6,6),        & 
& cplSeSvReSvRecSe1(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),cplSuSucSucSuabab(6,6,6,6),      & 
& cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6),   & 
& cplSvImSvImSvImSvIm1(6,6,6,6),cplSvImSvImSvImSvRe1(6,6,6,6),cplSvImSvImSvReSvRe1(6,6,6,6),& 
& cplSvImSvReSvReSvRe1(6,6,6,6),cplSvReSvReSvReSvRe1(6,6,6,6),cplAhAhcVWmVWm1(3,3),      & 
& cplAhAhVZVZ1(3,3),cplAhHpmcVWmVP1(3,2),cplAhHpmcVWmVZ1(3,2),cplAhcHpmVPVWm1(3,2),      & 
& cplAhcHpmVWmVZ1(3,2),cplhhhhcVWmVWm1(3,3),cplhhhhVZVZ1(3,3),cplhhHpmcVWmVP1(3,2),      & 
& cplhhHpmcVWmVZ1(3,2),cplhhcHpmVPVWm1(3,2),cplhhcHpmVWmVZ1(3,2),cplHpmcHpmVPVP1(2,2),   & 
& cplHpmcHpmVPVZ1(2,2),cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVZVZ1(2,2),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSdcSdVGVPLamct3ct2ct1(6,6),          & 
& cplSdcSdVGVZLamct3ct2ct1(6,6),cplSdcSucVWmVGLamct4ct2ct1(6,6),cplSdcSdVPVPaa(6,6),     & 
& cplSdcSdVPVZaa(6,6),cplSdcSucVWmVPaa(6,6),cplSdcSdcVWmVWmaa(6,6),cplSdcSdVZVZaa(6,6),  & 
& cplSdcSucVWmVZaa(6,6),cplSeSvImcVWmVP1(6,6),cplSeSvImcVWmVZ1(6,6),cplSeSvRecVWmVP1(6,6),& 
& cplSeSvRecVWmVZ1(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSecSecVWmVWm1(6,6),     & 
& cplSecSeVZVZ1(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),& 
& cplSucSuVGVPLamct3ct2ct1(6,6),cplSucSdVGVWmLamct3ct2ct1(6,6),cplSucSuVGVZLamct3ct2ct1(6,6),& 
& cplSucSuVPVPaa(6,6),cplSucSdVPVWmaa(6,6),cplSucSuVPVZaa(6,6),cplSucSdVWmVZaa(6,6),     & 
& cplSucSucVWmVWmaa(6,6),cplSucSuVZVZaa(6,6),cplSvImSvImcVWmVWm1(6,6),cplSvImSvImVZVZ1(6,6),& 
& cplSvImcSeVPVWm1(6,6),cplSvImcSeVWmVZ1(6,6),cplSvReSvRecVWmVWm1(6,6),cplSvReSvReVZVZ1(6,6)

Complex(dp) :: cplSvRecSeVPVWm1(6,6),cplSvRecSeVWmVZ1(6,6),cplVGVGVGVG1Q,cplVGVGVGVG2Q,               & 
& cplVGVGVGVG3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWmVZ1Q,     & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,             & 
& cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q

Complex(dp) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhHpmcHpm(3,2,2),               & 
& cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),            & 
& cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),        & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),     & 
& cplHpmSvRecSe(2,6,6),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),    & 
& cplAhAhAhAh(3,3,3,3),cplAhAhAhhh(3,3,3,3),cplAhAhhhhh(3,3,3,3),cplAhAhHpmcHpm(3,3,2,2),& 
& cplAhAhSdcSd(3,3,6,6),cplAhAhSecSe(3,3,6,6),cplAhAhSucSu(3,3,6,6),cplAhAhSvImSvIm(3,3,6,6),& 
& cplAhAhSvImSvRe(3,3,6,6),cplAhAhSvReSvRe(3,3,6,6),cplAhhhhhhh(3,3,3,3),cplAhhhHpmcHpm(3,3,2,2),& 
& cplAhhhSdcSd(3,3,6,6),cplAhhhSecSe(3,3,6,6),cplAhhhSucSu(3,3,6,6),cplAhhhSvImSvIm(3,3,6,6),& 
& cplAhhhSvImSvRe(3,3,6,6),cplAhhhSvReSvRe(3,3,6,6),cplAhHpmSucSd(3,2,6,6),              & 
& cplAhHpmSvImcSe(3,2,6,6),cplAhHpmSvRecSe(3,2,6,6),cplAhSdcHpmcSu(3,6,2,6),             & 
& cplAhSeSvImcHpm(3,6,6,2),cplAhSeSvRecHpm(3,6,6,2),cplhhhhhhhh(3,3,3,3),cplhhhhHpmcHpm(3,3,2,2),& 
& cplhhhhSdcSd(3,3,6,6),cplhhhhSecSe(3,3,6,6),cplhhhhSucSu(3,3,6,6),cplhhhhSvImSvIm(3,3,6,6),& 
& cplhhhhSvImSvRe(3,3,6,6),cplhhhhSvReSvRe(3,3,6,6),cplhhHpmSucSd(3,2,6,6),              & 
& cplhhHpmSvImcSe(3,2,6,6),cplhhHpmSvRecSe(3,2,6,6),cplhhSdcHpmcSu(3,6,2,6),             & 
& cplhhSeSvImcHpm(3,6,6,2),cplhhSeSvRecHpm(3,6,6,2),cplHpmHpmcHpmcHpm(2,2,2,2),          & 
& cplHpmSdcHpmcSd(2,6,2,6),cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),            & 
& cplHpmSvImSvImcHpm(2,6,6,2),cplHpmSvImSvRecHpm(2,6,6,2),cplHpmSvReSvRecHpm(2,6,6,2),   & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSdSvImSvImcSd(6,6,6,6),& 
& cplSdSvImcSecSu(6,6,6,6),cplSdSvReSvRecSd(6,6,6,6),cplSdSvRecSecSu(6,6,6,6),           & 
& cplSeSecSecSe(6,6,6,6),cplSeSuSvImcSd(6,6,6,6),cplSeSuSvRecSd(6,6,6,6),cplSeSucSecSu(6,6,6,6),& 
& cplSeSvImSvImcSe(6,6,6,6),cplSeSvImSvRecSe(6,6,6,6),cplSeSvReSvRecSe(6,6,6,6),         & 
& cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),cplSuSvImSvRecSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvImSvRe(6,6,6,6),   & 
& cplSvImSvImSvReSvRe(6,6,6,6),cplSvImSvReSvReSvRe(6,6,6,6),cplSvReSvReSvReSvRe(6,6,6,6),& 
& cplAhhhVZ(3,3),cplAhHpmcVWm(3,2),cplAhcHpmVWm(3,2),cplhhHpmcVWm(3,2),cplhhcHpmVWm(3,2),& 
& cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),   & 
& cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),               & 
& cplSecSeVZ(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),      & 
& cplSvImSvReVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),cplhhcVWmVWm(3),              & 
& cplhhVZVZ(3),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),          & 
& cplAhAhcVWmVWm(3,3),cplAhAhVZVZ(3,3),cplAhHpmcVWmVP(3,2),cplAhHpmcVWmVZ(3,2),          & 
& cplAhcHpmVPVWm(3,2),cplAhcHpmVWmVZ(3,2),cplhhhhcVWmVWm(3,3),cplhhhhVZVZ(3,3),          & 
& cplhhHpmcVWmVP(3,2),cplhhHpmcVWmVZ(3,2),cplhhcHpmVPVWm(3,2),cplhhcHpmVWmVZ(3,2),       & 
& cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVZVZ(2,2),    & 
& cplSdcSdVGVG(6,6),cplSdcSdVGVP(6,6),cplSdcSdVGVZ(6,6),cplSdcSucVWmVG(6,6)

Complex(dp) :: cplSdcSdVPVP(6,6),cplSdcSdVPVZ(6,6),cplSdcSucVWmVP(6,6),cplSdcSdcVWmVWm(6,6),          & 
& cplSdcSdVZVZ(6,6),cplSdcSucVWmVZ(6,6),cplSeSvImcVWmVP(6,6),cplSeSvImcVWmVZ(6,6),       & 
& cplSeSvRecVWmVP(6,6),cplSeSvRecVWmVZ(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),         & 
& cplSecSecVWmVWm(6,6),cplSecSeVZVZ(6,6),cplSucSuVGVG(6,6),cplSucSuVGVP(6,6),            & 
& cplSucSdVGVWm(6,6),cplSucSuVGVZ(6,6),cplSucSuVPVP(6,6),cplSucSdVPVWm(6,6),             & 
& cplSucSuVPVZ(6,6),cplSucSdVWmVZ(6,6),cplSucSucVWmVWm(6,6),cplSucSuVZVZ(6,6),           & 
& cplSvImSvImcVWmVWm(6,6),cplSvImSvImVZVZ(6,6),cplSvImcSeVPVWm(6,6),cplSvImcSeVWmVZ(6,6),& 
& cplSvReSvRecVWmVWm(6,6),cplSvReSvReVZVZ(6,6),cplSvRecSeVPVWm(6,6),cplSvRecSeVWmVZ(6,6),& 
& cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),         & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),       & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),       & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),   & 
& cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),         & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),             & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),           & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),              & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3), & 
& cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),   & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1

Complex(dp) :: cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,         & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm, & 
& cplcgWmgWmAh(3),cplcgWpCgWpCAh(3),cplcgZgAhh(3),cplcgWmgAHpm(2),cplcgWpCgAcHpm(2),     & 
& cplcgWmgWmhh(3),cplcgZgWmcHpm(2),cplcgWpCgWpChh(3),cplcgZgWpCHpm(2),cplcgZgZhh(3),     & 
& cplcgWmgZHpm(2),cplcgWpCgZcHpm(2)

Complex(dp) :: ctcplAhAhAh(3,3,3),ctcplAhAhhh(3,3,3),ctcplAhhhhh(3,3,3),ctcplAhHpmcHpm(3,2,2),       & 
& ctcplAhSdcSd(3,6,6),ctcplAhSecSe(3,6,6),ctcplAhSucSu(3,6,6),ctcplAhSvImSvIm(3,6,6),    & 
& ctcplAhSvImSvRe(3,6,6),ctcplAhSvReSvRe(3,6,6),ctcplhhhhhh(3,3,3),ctcplhhHpmcHpm(3,2,2),& 
& ctcplhhSdcSd(3,6,6),ctcplhhSecSe(3,6,6),ctcplhhSucSu(3,6,6),ctcplhhSvImSvIm(3,6,6),    & 
& ctcplhhSvImSvRe(3,6,6),ctcplhhSvReSvRe(3,6,6),ctcplHpmSucSd(2,6,6),ctcplHpmSvImcSe(2,6,6),& 
& ctcplHpmSvRecSe(2,6,6),ctcplSdcHpmcSu(6,2,6),ctcplSeSvImcHpm(6,6,2),ctcplSeSvRecHpm(6,6,2),& 
& ctcplAhhhVZ(3,3),ctcplAhHpmcVWm(3,2),ctcplAhcHpmVWm(3,2),ctcplhhHpmcVWm(3,2),          & 
& ctcplhhcHpmVWm(3,2),ctcplHpmcHpmVP(2,2),ctcplHpmcHpmVZ(2,2),ctcplSdcSdVG(6,6),         & 
& ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSucVWm(6,6),ctcplSeSvImcVWm(6,6),          & 
& ctcplSeSvRecVWm(6,6),ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSucSuVG(6,6),            & 
& ctcplSucSuVP(6,6),ctcplSucSdVWm(6,6),ctcplSucSuVZ(6,6),ctcplSvImSvReVZ(6,6),           & 
& ctcplSvImcSeVWm(6,6),ctcplSvRecSeVWm(6,6),ctcplhhcVWmVWm(3),ctcplhhVZVZ(3),            & 
& ctcplHpmcVWmVP(2),ctcplHpmcVWmVZ(2),ctcplcHpmVPVWm(2),ctcplcHpmVWmVZ(2),               & 
& ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcChaChaAhL(2,2,3),ctcplcChaChaAhR(2,2,3),& 
& ctcplChiChiAhL(5,5,3),ctcplChiChiAhR(5,5,3),ctcplcFdFdAhL(3,3,3),ctcplcFdFdAhR(3,3,3), & 
& ctcplcFeFeAhL(3,3,3),ctcplcFeFeAhR(3,3,3),ctcplcFuFuAhL(3,3,3),ctcplcFuFuAhR(3,3,3),   & 
& ctcplFvFvAhL(6,6,3),ctcplFvFvAhR(6,6,3),ctcplChiChacHpmL(5,2,2),ctcplChiChacHpmR(5,2,2),& 
& ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6),ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6),& 
& ctcplcChaChahhL(2,2,3),ctcplcChaChahhR(2,2,3),ctcplcFdChaSuL(3,2,6),ctcplcFdChaSuR(3,2,6),& 
& ctcplcFeChaSvImL(3,2,6),ctcplcFeChaSvImR(3,2,6),ctcplcFeChaSvReL(3,2,6),               & 
& ctcplcFeChaSvReR(3,2,6),ctcplChiChihhL(5,5,3),ctcplChiChihhR(5,5,3),ctcplChiFdcSdL(5,3,6),& 
& ctcplChiFdcSdR(5,3,6),ctcplChiFecSeL(5,3,6),ctcplChiFecSeR(5,3,6),ctcplChiFucSuL(5,3,6),& 
& ctcplChiFucSuR(5,3,6),ctcplChiFvSvImL(5,6,6),ctcplChiFvSvImR(5,6,6),ctcplChiFvSvReL(5,6,6),& 
& ctcplChiFvSvReR(5,6,6),ctcplcChaChiHpmL(2,5,2),ctcplcChaChiHpmR(2,5,2),ctcplcFdChiSdL(3,5,6),& 
& ctcplcFdChiSdR(3,5,6),ctcplcFeChiSeL(3,5,6),ctcplcFeChiSeR(3,5,6),ctcplcFuChiSuL(3,5,6),& 
& ctcplcFuChiSuR(3,5,6),ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6),ctcplcFdFdhhL(3,3,3),    & 
& ctcplcFdFdhhR(3,3,3),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),ctcplcFuFdcHpmL(3,3,2),& 
& ctcplcFuFdcHpmR(3,3,2),ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2),ctcplcFeFehhL(3,3,3),& 
& ctcplcFeFehhR(3,3,3),ctcplcChaFeSvImL(2,3,6),ctcplcChaFeSvImR(2,3,6),ctcplcChaFeSvReL(2,3,6),& 
& ctcplcChaFeSvReR(2,3,6),ctcplGluFucSuL(3,6),ctcplGluFucSuR(3,6),ctcplcFuFuhhL(3,3,3),  & 
& ctcplcFuFuhhR(3,3,3),ctcplcFdFuHpmL(3,3,2),ctcplcFdFuHpmR(3,3,2),ctcplFvFvhhL(6,6,3),  & 
& ctcplFvFvhhR(6,6,3),ctcplcFeFvHpmL(3,6,2),ctcplcFeFvHpmR(3,6,2),ctcplcChaFvSeL(2,6,6), & 
& ctcplcChaFvSeR(2,6,6),ctcplcFdGluSdL(3,6),ctcplcFdGluSdR(3,6),ctcplcFuGluSuL(3,6),     & 
& ctcplcFuGluSuR(3,6),ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),ctcplChiChacVWmL(5,2),& 
& ctcplChiChacVWmR(5,2),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),  & 
& ctcplcChaChaVZR(2,2),ctcplChiChiVZL(5,5),ctcplChiChiVZR(5,5),ctcplcChaChiVWmL(2,5),    & 
& ctcplcChaChiVWmR(2,5),ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3)

Complex(dp) :: ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),ctcplcFdFdVZR(3,3),ctcplcFuFdcVWmL(3,3),         & 
& ctcplcFuFdcVWmR(3,3),ctcplFvFecVWmL(6,3),ctcplFvFecVWmR(6,3),ctcplcFeFeVPL(3,3),       & 
& ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFuFuVGL(3,3),           & 
& ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),ctcplcFdFuVWmL(3,3),          & 
& ctcplcFdFuVWmR(3,3),ctcplcFuFuVZL(3,3),ctcplcFuFuVZR(3,3),ctcplFvFvVZL(6,6),           & 
& ctcplFvFvVZR(6,6),ctcplcFeFvVWmL(3,6),ctcplcFeFvVWmR(3,6),ctcplGluGluVGL,              & 
& ctcplGluGluVGR

Complex(dp) :: ZRUZD(6,6),ZRUZVI(6,6),ZRUZVR(6,6),ZRUZU(6,6),ZRUZE(6,6),ZRUZH(3,3),ZRUZA(3,3),       & 
& ZRUZP(2,2),ZRUZN(5,5),ZRUUV(6,6),ZRUUM(2,2),ZRUUP(2,2),ZRUZEL(3,3),ZRUZER(3,3),        & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Complex(dp) :: ZcplAhAhAh(3,3,3),ZcplAhAhhh(3,3,3),ZcplAhhhhh(3,3,3),ZcplAhHpmcHpm(3,2,2),           & 
& ZcplAhSdcSd(3,6,6),ZcplAhSecSe(3,6,6),ZcplAhSucSu(3,6,6),ZcplAhSvImSvIm(3,6,6),        & 
& ZcplAhSvImSvRe(3,6,6),ZcplAhSvReSvRe(3,6,6),Zcplhhhhhh(3,3,3),ZcplhhHpmcHpm(3,2,2),    & 
& ZcplhhSdcSd(3,6,6),ZcplhhSecSe(3,6,6),ZcplhhSucSu(3,6,6),ZcplhhSvImSvIm(3,6,6),        & 
& ZcplhhSvImSvRe(3,6,6),ZcplhhSvReSvRe(3,6,6),ZcplHpmSucSd(2,6,6),ZcplHpmSvImcSe(2,6,6), & 
& ZcplHpmSvRecSe(2,6,6),ZcplSdcHpmcSu(6,2,6),ZcplSeSvImcHpm(6,6,2),ZcplSeSvRecHpm(6,6,2),& 
& ZcplAhAhAhAh(3,3,3,3),ZcplAhAhAhhh(3,3,3,3),ZcplAhAhhhhh(3,3,3,3),ZcplAhAhHpmcHpm(3,3,2,2),& 
& ZcplAhAhSdcSd(3,3,6,6),ZcplAhAhSecSe(3,3,6,6),ZcplAhAhSucSu(3,3,6,6),ZcplAhAhSvImSvIm(3,3,6,6),& 
& ZcplAhAhSvImSvRe(3,3,6,6),ZcplAhAhSvReSvRe(3,3,6,6),ZcplAhhhhhhh(3,3,3,3),             & 
& ZcplAhhhHpmcHpm(3,3,2,2),ZcplAhhhSdcSd(3,3,6,6),ZcplAhhhSecSe(3,3,6,6),ZcplAhhhSucSu(3,3,6,6),& 
& ZcplAhhhSvImSvIm(3,3,6,6),ZcplAhhhSvImSvRe(3,3,6,6),ZcplAhhhSvReSvRe(3,3,6,6),         & 
& ZcplAhHpmSucSd(3,2,6,6),ZcplAhHpmSvImcSe(3,2,6,6),ZcplAhHpmSvRecSe(3,2,6,6),           & 
& ZcplAhSdcHpmcSu(3,6,2,6),ZcplAhSeSvImcHpm(3,6,6,2),ZcplAhSeSvRecHpm(3,6,6,2),          & 
& Zcplhhhhhhhh(3,3,3,3),ZcplhhhhHpmcHpm(3,3,2,2),ZcplhhhhSdcSd(3,3,6,6),ZcplhhhhSecSe(3,3,6,6),& 
& ZcplhhhhSucSu(3,3,6,6),ZcplhhhhSvImSvIm(3,3,6,6),ZcplhhhhSvImSvRe(3,3,6,6),            & 
& ZcplhhhhSvReSvRe(3,3,6,6),ZcplhhHpmSucSd(3,2,6,6),ZcplhhHpmSvImcSe(3,2,6,6),           & 
& ZcplhhHpmSvRecSe(3,2,6,6),ZcplhhSdcHpmcSu(3,6,2,6),ZcplhhSeSvImcHpm(3,6,6,2),          & 
& ZcplhhSeSvRecHpm(3,6,6,2),ZcplHpmHpmcHpmcHpm(2,2,2,2),ZcplHpmSdcHpmcSd(2,6,2,6),       & 
& ZcplHpmSecHpmcSe(2,6,2,6),ZcplHpmSucHpmcSu(2,6,2,6),ZcplHpmSvImSvImcHpm(2,6,6,2),      & 
& ZcplHpmSvImSvRecHpm(2,6,6,2),ZcplHpmSvReSvRecHpm(2,6,6,2),ZcplSdSdcSdcSd(6,6,6,6),     & 
& ZcplSdSecSdcSe(6,6,6,6),ZcplSdSucSdcSu(6,6,6,6),ZcplSdSvImSvImcSd(6,6,6,6),            & 
& ZcplSdSvImcSecSu(6,6,6,6),ZcplSdSvReSvRecSd(6,6,6,6),ZcplSdSvRecSecSu(6,6,6,6),        & 
& ZcplSeSecSecSe(6,6,6,6),ZcplSeSuSvImcSd(6,6,6,6),ZcplSeSuSvRecSd(6,6,6,6),             & 
& ZcplSeSucSecSu(6,6,6,6),ZcplSeSvImSvImcSe(6,6,6,6),ZcplSeSvImSvRecSe(6,6,6,6),         & 
& ZcplSeSvReSvRecSe(6,6,6,6),ZcplSuSucSucSu(6,6,6,6),ZcplSuSvImSvImcSu(6,6,6,6),         & 
& ZcplSuSvImSvRecSu(6,6,6,6),ZcplSuSvReSvRecSu(6,6,6,6),ZcplSvImSvImSvImSvIm(6,6,6,6),   & 
& ZcplSvImSvImSvImSvRe(6,6,6,6),ZcplSvImSvImSvReSvRe(6,6,6,6),ZcplSvImSvReSvReSvRe(6,6,6,6),& 
& ZcplSvReSvReSvReSvRe(6,6,6,6),ZcplAhhhVZ(3,3),ZcplAhHpmcVWm(3,2),ZcplAhcHpmVWm(3,2),   & 
& ZcplhhHpmcVWm(3,2),ZcplhhcHpmVWm(3,2),ZcplHpmcHpmVP(2,2),ZcplHpmcHpmVZ(2,2),           & 
& ZcplSdcSdVG(6,6),ZcplSdcSdVP(6,6),ZcplSdcSdVZ(6,6),ZcplSdcSucVWm(6,6),ZcplSeSvImcVWm(6,6),& 
& ZcplSeSvRecVWm(6,6),ZcplSecSeVP(6,6),ZcplSecSeVZ(6,6),ZcplSucSuVG(6,6),ZcplSucSuVP(6,6),& 
& ZcplSucSdVWm(6,6),ZcplSucSuVZ(6,6),ZcplSvImSvReVZ(6,6),ZcplSvImcSeVWm(6,6),            & 
& ZcplSvRecSeVWm(6,6),ZcplhhcVWmVWm(3),ZcplhhVZVZ(3),ZcplHpmcVWmVP(2),ZcplHpmcVWmVZ(2),  & 
& ZcplcHpmVPVWm(2),ZcplcHpmVWmVZ(2),ZcplAhAhcVWmVWm(3,3),ZcplAhAhVZVZ(3,3),              & 
& ZcplAhHpmcVWmVP(3,2),ZcplAhHpmcVWmVZ(3,2),ZcplAhcHpmVPVWm(3,2),ZcplAhcHpmVWmVZ(3,2),   & 
& ZcplhhhhcVWmVWm(3,3),ZcplhhhhVZVZ(3,3),ZcplhhHpmcVWmVP(3,2),ZcplhhHpmcVWmVZ(3,2),      & 
& ZcplhhcHpmVPVWm(3,2),ZcplhhcHpmVWmVZ(3,2),ZcplHpmcHpmVPVP(2,2),ZcplHpmcHpmVPVZ(2,2)

Complex(dp) :: ZcplHpmcHpmcVWmVWm(2,2),ZcplHpmcHpmVZVZ(2,2),ZcplSdcSdVGVG(6,6),ZcplSdcSdVGVP(6,6),    & 
& ZcplSdcSdVGVZ(6,6),ZcplSdcSucVWmVG(6,6),ZcplSdcSdVPVP(6,6),ZcplSdcSdVPVZ(6,6),         & 
& ZcplSdcSucVWmVP(6,6),ZcplSdcSdcVWmVWm(6,6),ZcplSdcSdVZVZ(6,6),ZcplSdcSucVWmVZ(6,6),    & 
& ZcplSeSvImcVWmVP(6,6),ZcplSeSvImcVWmVZ(6,6),ZcplSeSvRecVWmVP(6,6),ZcplSeSvRecVWmVZ(6,6),& 
& ZcplSecSeVPVP(6,6),ZcplSecSeVPVZ(6,6),ZcplSecSecVWmVWm(6,6),ZcplSecSeVZVZ(6,6),        & 
& ZcplSucSuVGVG(6,6),ZcplSucSuVGVP(6,6),ZcplSucSdVGVWm(6,6),ZcplSucSuVGVZ(6,6),          & 
& ZcplSucSuVPVP(6,6),ZcplSucSdVPVWm(6,6),ZcplSucSuVPVZ(6,6),ZcplSucSdVWmVZ(6,6),         & 
& ZcplSucSucVWmVWm(6,6),ZcplSucSuVZVZ(6,6),ZcplSvImSvImcVWmVWm(6,6),ZcplSvImSvImVZVZ(6,6),& 
& ZcplSvImcSeVPVWm(6,6),ZcplSvImcSeVWmVZ(6,6),ZcplSvReSvRecVWmVWm(6,6),ZcplSvReSvReVZVZ(6,6),& 
& ZcplSvRecSeVPVWm(6,6),ZcplSvRecSeVWmVZ(6,6),ZcplVGVGVG,ZcplcVWmVPVWm,ZcplcVWmVWmVZ,    & 
& ZcplcChaChaAhL(2,2,3),ZcplcChaChaAhR(2,2,3),ZcplChiChiAhL(5,5,3),ZcplChiChiAhR(5,5,3), & 
& ZcplcFdFdAhL(3,3,3),ZcplcFdFdAhR(3,3,3),ZcplcFeFeAhL(3,3,3),ZcplcFeFeAhR(3,3,3),       & 
& ZcplcFuFuAhL(3,3,3),ZcplcFuFuAhR(3,3,3),ZcplFvFvAhL(6,6,3),ZcplFvFvAhR(6,6,3),         & 
& ZcplChiChacHpmL(5,2,2),ZcplChiChacHpmR(5,2,2),ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),& 
& ZcplFvChacSeL(6,2,6),ZcplFvChacSeR(6,2,6),ZcplcChaChahhL(2,2,3),ZcplcChaChahhR(2,2,3), & 
& ZcplcFdChaSuL(3,2,6),ZcplcFdChaSuR(3,2,6),ZcplcFeChaSvImL(3,2,6),ZcplcFeChaSvImR(3,2,6),& 
& ZcplcFeChaSvReL(3,2,6),ZcplcFeChaSvReR(3,2,6),ZcplChiChihhL(5,5,3),ZcplChiChihhR(5,5,3),& 
& ZcplChiFdcSdL(5,3,6),ZcplChiFdcSdR(5,3,6),ZcplChiFecSeL(5,3,6),ZcplChiFecSeR(5,3,6),   & 
& ZcplChiFucSuL(5,3,6),ZcplChiFucSuR(5,3,6),ZcplChiFvSvImL(5,6,6),ZcplChiFvSvImR(5,6,6), & 
& ZcplChiFvSvReL(5,6,6),ZcplChiFvSvReR(5,6,6),ZcplcChaChiHpmL(2,5,2),ZcplcChaChiHpmR(2,5,2),& 
& ZcplcFdChiSdL(3,5,6),ZcplcFdChiSdR(3,5,6),ZcplcFeChiSeL(3,5,6),ZcplcFeChiSeR(3,5,6),   & 
& ZcplcFuChiSuL(3,5,6),ZcplcFuChiSuR(3,5,6),ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),       & 
& ZcplcFdFdhhL(3,3,3),ZcplcFdFdhhR(3,3,3),ZcplcChaFdcSuL(2,3,6),ZcplcChaFdcSuR(2,3,6),   & 
& ZcplcFuFdcHpmL(3,3,2),ZcplcFuFdcHpmR(3,3,2),ZcplFvFecHpmL(6,3,2),ZcplFvFecHpmR(6,3,2), & 
& ZcplcFeFehhL(3,3,3),ZcplcFeFehhR(3,3,3),ZcplcChaFeSvImL(2,3,6),ZcplcChaFeSvImR(2,3,6), & 
& ZcplcChaFeSvReL(2,3,6),ZcplcChaFeSvReR(2,3,6),ZcplGluFucSuL(3,6),ZcplGluFucSuR(3,6),   & 
& ZcplcFuFuhhL(3,3,3),ZcplcFuFuhhR(3,3,3),ZcplcFdFuHpmL(3,3,2),ZcplcFdFuHpmR(3,3,2),     & 
& ZcplFvFvhhL(6,6,3),ZcplFvFvhhR(6,6,3),ZcplcFeFvHpmL(3,6,2),ZcplcFeFvHpmR(3,6,2),       & 
& ZcplcChaFvSeL(2,6,6),ZcplcChaFvSeR(2,6,6),ZcplcFdGluSdL(3,6),ZcplcFdGluSdR(3,6),       & 
& ZcplcFuGluSuL(3,6),ZcplcFuGluSuR(3,6),ZcplcChacFuSdL(2,3,6),ZcplcChacFuSdR(2,3,6),     & 
& ZcplChiChacVWmL(5,2),ZcplChiChacVWmR(5,2),ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),     & 
& ZcplcChaChaVZL(2,2),ZcplcChaChaVZR(2,2),ZcplChiChiVZL(5,5),ZcplChiChiVZR(5,5),         & 
& ZcplcChaChiVWmL(2,5),ZcplcChaChiVWmR(2,5),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),         & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),               & 
& ZcplcFuFdcVWmL(3,3),ZcplcFuFdcVWmR(3,3),ZcplFvFecVWmL(6,3),ZcplFvFecVWmR(6,3),         & 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),               & 
& ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3)

Complex(dp) :: ZcplcFdFuVWmL(3,3),ZcplcFdFuVWmR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),             & 
& ZcplFvFvVZL(6,6),ZcplFvFvVZR(6,6),ZcplcFeFvVWmL(3,6),ZcplcFeFvVWmR(3,6),               & 
& ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,& 
& ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,  & 
& ZcplcVWmcVWmVWmVWm1,ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,          & 
& ZcplcVWmVWmVZVZ2,ZcplcVWmVWmVZVZ3,ZcplcgGgGVG,ZcplcgWmgAVWm,ZcplcgWpCgAcVWm,           & 
& ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgAgWmcVWm,ZcplcgZgWmcVWm,ZcplcgWpCgWpCVP,             & 
& ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,ZcplcgWpCgWpCVZ,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,           & 
& ZcplcgWmgWmAh(3),ZcplcgWpCgWpCAh(3),ZcplcgZgAhh(3),ZcplcgWmgAHpm(2),ZcplcgWpCgAcHpm(2),& 
& ZcplcgWmgWmhh(3),ZcplcgZgWmcHpm(2),ZcplcgWpCgWpChh(3),ZcplcgZgWpCHpm(2),               & 
& ZcplcgZgZhh(3),ZcplcgWmgZHpm(2),ZcplcgWpCgZcHpm(2)

Complex(dp) :: GcplAhHpmcHpm(3,2,2),GcplhhHpmcHpm(3,2,2),GcplHpmSucSd(2,6,6),GcplHpmSvImcSe(2,6,6),  & 
& GcplHpmSvRecSe(2,6,6),GcplSdcHpmcSu(6,2,6),GcplSeSvImcHpm(6,6,2),GcplSeSvRecHpm(6,6,2),& 
& GcplAhHpmcVWm(3,2),GcplAhcHpmVWm(3,2),GcplhhHpmcVWm(3,2),GcplhhcHpmVWm(3,2),           & 
& GcplHpmcHpmVP(2,2),GcplHpmcHpmVZ(2,2),GcplHpmcVWmVP(2),GcplHpmcVWmVZ(2),               & 
& GcplcHpmVPVWm(2),GcplcHpmVWmVZ(2),GcplChiChacHpmL(5,2,2),GcplChiChacHpmR(5,2,2),       & 
& GcplcChaChiHpmL(2,5,2),GcplcChaChiHpmR(2,5,2),GcplcFuFdcHpmL(3,3,2),GcplcFuFdcHpmR(3,3,2),& 
& GcplFvFecHpmL(6,3,2),GcplFvFecHpmR(6,3,2),GcplcFdFuHpmL(3,3,2),GcplcFdFuHpmR(3,3,2),   & 
& GcplcFeFvHpmL(3,6,2),GcplcFeFvHpmR(3,6,2)

Complex(dp) :: GZcplAhHpmcHpm(3,2,2),GZcplhhHpmcHpm(3,2,2),GZcplHpmSucSd(2,6,6),GZcplHpmSvImcSe(2,6,6),& 
& GZcplHpmSvRecSe(2,6,6),GZcplSdcHpmcSu(6,2,6),GZcplSeSvImcHpm(6,6,2),GZcplSeSvRecHpm(6,6,2),& 
& GZcplAhHpmcVWm(3,2),GZcplAhcHpmVWm(3,2),GZcplhhHpmcVWm(3,2),GZcplhhcHpmVWm(3,2),       & 
& GZcplHpmcHpmVP(2,2),GZcplHpmcHpmVZ(2,2),GZcplHpmcVWmVP(2),GZcplHpmcVWmVZ(2),           & 
& GZcplcHpmVPVWm(2),GZcplcHpmVWmVZ(2),GZcplChiChacHpmL(5,2,2),GZcplChiChacHpmR(5,2,2),   & 
& GZcplcChaChiHpmL(2,5,2),GZcplcChaChiHpmR(2,5,2),GZcplcFuFdcHpmL(3,3,2),GZcplcFuFdcHpmR(3,3,2),& 
& GZcplFvFecHpmL(6,3,2),GZcplFvFecHpmR(6,3,2),GZcplcFdFuHpmL(3,3,2),GZcplcFdFuHpmR(3,3,2),& 
& GZcplcFeFvHpmL(3,6,2),GZcplcFeFvHpmR(3,6,2)

Complex(dp) :: GosZcplAhHpmcHpm(3,2,2),GosZcplhhHpmcHpm(3,2,2),GosZcplHpmSucSd(2,6,6),               & 
& GosZcplHpmSvImcSe(2,6,6),GosZcplHpmSvRecSe(2,6,6),GosZcplSdcHpmcSu(6,2,6),             & 
& GosZcplSeSvImcHpm(6,6,2),GosZcplSeSvRecHpm(6,6,2),GosZcplAhHpmcVWm(3,2),               & 
& GosZcplAhcHpmVWm(3,2),GosZcplhhHpmcVWm(3,2),GosZcplhhcHpmVWm(3,2),GosZcplHpmcHpmVP(2,2),& 
& GosZcplHpmcHpmVZ(2,2),GosZcplHpmcVWmVP(2),GosZcplHpmcVWmVZ(2),GosZcplcHpmVPVWm(2),     & 
& GosZcplcHpmVWmVZ(2),GosZcplChiChacHpmL(5,2,2),GosZcplChiChacHpmR(5,2,2),               & 
& GosZcplcChaChiHpmL(2,5,2),GosZcplcChaChiHpmR(2,5,2),GosZcplcFuFdcHpmL(3,3,2),          & 
& GosZcplcFuFdcHpmR(3,3,2),GosZcplFvFecHpmL(6,3,2),GosZcplFvFecHpmR(6,3,2),              & 
& GosZcplcFdFuHpmL(3,3,2),GosZcplcFdFuHpmR(3,3,2),GosZcplcFeFvHpmL(3,6,2),               & 
& GosZcplcFeFvHpmR(3,6,2)

Real(dp), Intent(out) :: gP1LSvRe(6,132) 
Real(dp), Intent(out) :: gP1LSvIm(6,132) 
Real(dp), Intent(out) :: gP1LHpm(2,159) 
Real(dp), Intent(out) :: gP1Lhh(3,290) 
Real(dp), Intent(out) :: gP1LAh(3,288) 
Real(dp), Intent(out) :: gP1LSu(6,84) 
Real(dp), Intent(out) :: gP1LSd(6,84) 
Real(dp), Intent(out) :: gP1LSe(6,93) 
Real(dp), Intent(out) :: gP1LGlu(1,49) 
Real(dp), Intent(out) :: gP1LCha(2,132) 
Real(dp), Intent(out) :: gP1LChi(5,166) 
Real(dp), Intent(out) :: gP1LFv(6,120) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateOneLoopDecays'
 
Write(*,*) "Calculating one loop decays" 
! Regulator mass for gluon/photon 
MLambda = Mass_Regulator_PhotonGluon 
divset=SetDivonlyAdd(INT(divonly_save)) 
divvalue=SetDivergenceAdd(divergence_save) 
If (.not.CalculateOneLoopMasses) Then 
 If (OSkinematics) Then 
  Write(*,*) "Loop masses not calculated: tree-level masses used for kinematics" 
  OSkinematics = .false. 
 End if
 If (ExternalZfactors) Then 
  Write(*,*) "Loop masses not calculated: no U-factors are applied" 
  ExternalZfactors = .false. 
 End if
End if

If (Extra_scale_loopDecays) Then 
q2_save = GetRenormalizationScale() 
q2 = SetRenormalizationScale(scale_loopdecays **2) 
End if 
If ((OSkinematics).or.(ExternalZfactors)) ShiftIRdiv = .true. 
If (ewOSinDecays) Then 
sinW2=1._dp-mW2/mZ2 
g1SM=sqrt(4*Pi*Alpha_MZ/(1-sinW2)) 
g2SM=sqrt(4*Pi*Alpha_MZ/Sinw2) 
vSM=sqrt(mz2*4._dp/(g1SM**2+g2SM**2)) 
g1=g1SM 
g2=g2SM 
vd=vSM/Sqrt(1 + TanBeta**2) 
vu=TanBeta*vd 
 If (yukOSinDecays) Then !! Allow OS Yukawas only together with vSM 
    YuSM = 0._dp 
    YdSM = 0._dp 
    YuSM = 0._dp 
   Do i1=1,3 
      YuSM(i1,i1)=sqrt(2._dp)*mf_u(i1)/vSM 
      YeSM(i1,i1)=sqrt(2._dp)*mf_l(i1)/vSM 
      YdSM(i1,i1)=sqrt(2._dp)*mf_d(i1)/vSM 
    End Do 
   If(GenerationMixing) Then 
    YuSM = Transpose(Matmul(Transpose(CKM),Transpose(YuSM))) 
   End if 
Yu=(vSM*YuSM)/vu 
Yd=(vSM*YdSM)/vd 
Ye=(vSM*YeSM)/vd 
 End if 
End if 
! -------------------------------------------- 
! General information needed in the following 
! -------------------------------------------- 

! DR parameters 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,GenerationMixing,kont)

! Stabilize numerics 
Where (Abs(MSd).lt.1.0E-15_dp) MSd=0._dp
Where (Abs(MSd2).lt.1.0E-30_dp) MSd2=0._dp
Where (Abs(MSvIm).lt.1.0E-15_dp) MSvIm=0._dp
Where (Abs(MSvIm2).lt.1.0E-30_dp) MSvIm2=0._dp
Where (Abs(MSvRe).lt.1.0E-15_dp) MSvRe=0._dp
Where (Abs(MSvRe2).lt.1.0E-30_dp) MSvRe2=0._dp
Where (Abs(MSu).lt.1.0E-15_dp) MSu=0._dp
Where (Abs(MSu2).lt.1.0E-30_dp) MSu2=0._dp
Where (Abs(MSe).lt.1.0E-15_dp) MSe=0._dp
Where (Abs(MSe2).lt.1.0E-30_dp) MSe2=0._dp
Where (Abs(Mhh).lt.1.0E-15_dp) Mhh=0._dp
Where (Abs(Mhh2).lt.1.0E-30_dp) Mhh2=0._dp
Where (Abs(MAh).lt.1.0E-15_dp) MAh=0._dp
Where (Abs(MAh2).lt.1.0E-30_dp) MAh2=0._dp
Where (Abs(MHpm).lt.1.0E-15_dp) MHpm=0._dp
Where (Abs(MHpm2).lt.1.0E-30_dp) MHpm2=0._dp
If (Abs(MGlu).lt.1.0E-15_dp) MGlu=0._dp
If (Abs(MGlu2).lt.1.0E-30_dp) MGlu2=0._dp
Where (Abs(MChi).lt.1.0E-15_dp) MChi=0._dp
Where (Abs(MChi2).lt.1.0E-30_dp) MChi2=0._dp
Where (Abs(MFv).lt.1.0E-15_dp) MFv=0._dp
Where (Abs(MFv2).lt.1.0E-30_dp) MFv2=0._dp
Where (Abs(MCha).lt.1.0E-15_dp) MCha=0._dp
Where (Abs(MCha2).lt.1.0E-30_dp) MCha2=0._dp
Where (Abs(MFe).lt.1.0E-15_dp) MFe=0._dp
Where (Abs(MFe2).lt.1.0E-30_dp) MFe2=0._dp
Where (Abs(MFd).lt.1.0E-15_dp) MFd=0._dp
Where (Abs(MFd2).lt.1.0E-30_dp) MFd2=0._dp
Where (Abs(MFu).lt.1.0E-15_dp) MFu=0._dp
Where (Abs(MFu2).lt.1.0E-30_dp) MFu2=0._dp
If (UseZeroRotationMatrices) Then  ! Rotation matrices calculated for p2=0
ZRUZD = MatMul(ZDOS_0, Conjg(Transpose(ZD)))
ZRUZVI = MatMul(ZVIOS_0, Conjg(Transpose(ZVI)))
ZRUZVR = MatMul(ZVROS_0, Conjg(Transpose(ZVR)))
ZRUZU = MatMul(ZUOS_0, Conjg(Transpose(ZU)))
ZRUZE = MatMul(ZEOS_0, Conjg(Transpose(ZE)))
ZRUZH = MatMul(ZHOS_0, Transpose(ZH))
ZRUZA = MatMul(ZAOS_0, Transpose(ZA))
ZRUZP = MatMul(ZPOS_0, Transpose(ZP))
ZRUZN = MatMul(ZNOS_0, Conjg(Transpose(ZN)))
ZRUUV = MatMul(UVOS_0, Conjg(Transpose(UV)))
ZRUUM = MatMul(UMOS_0, Conjg(Transpose(UM)))
ZRUUP = MatMul(UPOS_0, Conjg(Transpose(UP)))
ZRUZEL = MatMul(ZELOS_0, Conjg(Transpose(ZEL)))
ZRUZER = MatMul(ZEROS_0, Conjg(Transpose(ZER)))
ZRUZDL = MatMul(ZDLOS_0, Conjg(Transpose(ZDL)))
ZRUZDR = MatMul(ZDROS_0, Conjg(Transpose(ZDR)))
ZRUZUL = MatMul(ZULOS_0, Conjg(Transpose(ZUL)))
ZRUZUR = MatMul(ZUROS_0, Conjg(Transpose(ZUR)))
Else If (UseP2Matrices) Then   ! p2 dependent matrix 
ZRUZD = MatMul(ZDOS_p2, Conjg(Transpose(ZD)))
ZRUZVI = MatMul(ZVIOS_p2, Conjg(Transpose(ZVI)))
ZRUZVR = MatMul(ZVROS_p2, Conjg(Transpose(ZVR)))
ZRUZU = MatMul(ZUOS_p2, Conjg(Transpose(ZU)))
ZRUZE = MatMul(ZEOS_p2, Conjg(Transpose(ZE)))
ZRUZH = MatMul(ZHOS_p2, Transpose(ZH))
ZRUZA = MatMul(ZAOS_p2, Transpose(ZA))
ZRUZP = MatMul(ZPOS_p2, Transpose(ZP))
ZRUZN = MatMul(ZNOS_p2, Conjg(Transpose(ZN)))
ZRUUV = MatMul(UVOS_p2, Conjg(Transpose(UV)))
ZRUUM = MatMul(UMOS_p2, Conjg(Transpose(UM)))
ZRUUP = MatMul(UPOS_p2, Conjg(Transpose(UP)))
ZRUZEL = MatMul(ZELOS_p2, Conjg(Transpose(ZEL)))
ZRUZER = MatMul(ZEROS_p2, Conjg(Transpose(ZER)))
ZRUZDL = MatMul(ZDLOS_p2, Conjg(Transpose(ZDL)))
ZRUZDR = MatMul(ZDROS_p2, Conjg(Transpose(ZDR)))
ZRUZUL = MatMul(ZULOS_p2, Conjg(Transpose(ZUL)))
ZRUZUR = MatMul(ZUROS_p2, Conjg(Transpose(ZUR)))
Else  ! Rotation matrix for lightest state
ZRUZD = MatMul(ZDOS, Conjg(Transpose(ZD)))
ZRUZVI = MatMul(ZVIOS, Conjg(Transpose(ZVI)))
ZRUZVR = MatMul(ZVROS, Conjg(Transpose(ZVR)))
ZRUZU = MatMul(ZUOS, Conjg(Transpose(ZU)))
ZRUZE = MatMul(ZEOS, Conjg(Transpose(ZE)))
ZRUZH = MatMul(ZHOS, Transpose(ZH))
ZRUZA = MatMul(ZAOS, Transpose(ZA))
ZRUZP = MatMul(ZPOS, Transpose(ZP))
ZRUZN = MatMul(ZNOS, Conjg(Transpose(ZN)))
ZRUUV = MatMul(UVOS, Conjg(Transpose(UV)))
ZRUUM = MatMul(UMOS, Conjg(Transpose(UM)))
ZRUUP = MatMul(UPOS, Conjg(Transpose(UP)))
ZRUZEL = MatMul(ZELOS, Conjg(Transpose(ZEL)))
ZRUZER = MatMul(ZEROS, Conjg(Transpose(ZER)))
ZRUZDL = MatMul(ZDLOS, Conjg(Transpose(ZDL)))
ZRUZDR = MatMul(ZDROS, Conjg(Transpose(ZDR)))
ZRUZUL = MatMul(ZULOS, Conjg(Transpose(ZUL)))
ZRUZUR = MatMul(ZUROS, Conjg(Transpose(ZUR)))
End if 
! Couplings 
Call AllCouplingsReallyAll(lam,Tlam,kap,Tk,vd,vu,vS,ZA,g1,g2,ZH,ZP,Yd,Td,             & 
& ZD,Ye,Te,ZE,Yu,Tu,ZU,lamN,TLN,Yv,Tv,ZVI,ZVR,g3,TW,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,            & 
& ZUL,ZUR,UV,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,      & 
& cplAhAhAhAh,cplAhAhAhhh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,          & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhhhhh,              & 
& cplAhhhHpmcHpm,cplAhhhSdcSd,cplAhhhSecSe,cplAhhhSucSu,cplAhhhSvImSvIm,cplAhhhSvImSvRe, & 
& cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,          & 
& cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,               & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,             & 
& cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,          & 
& cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,     & 
& cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,  & 
& cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,       & 
& cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,            & 
& cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,     & 
& cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,          & 
& cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,           & 
& cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcSdVG,cplSdcSdVP,             & 
& cplSdcSdVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,             & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSvImSvReVZ,cplSvImcSeVWm,              & 
& cplSvRecSeVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplcHpmVPVWm,           & 
& cplcHpmVWmVZ,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHpmcVWmVP,cplAhHpmcVWmVZ,cplAhcHpmVPVWm,  & 
& cplAhcHpmVWmVZ,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhHpmcVWmVP,cplhhHpmcVWmVZ,               & 
& cplhhcHpmVPVWm,cplhhcHpmVWmVZ,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,cplHpmcHpmcVWmVWm,         & 
& cplHpmcHpmVZVZ,cplSdcSdVGVG,cplSdcSdVGVP,cplSdcSdVGVZ,cplSdcSucVWmVG,cplSdcSdVPVP,     & 
& cplSdcSdVPVZ,cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSucVWmVZ,               & 
& cplSeSvImcVWmVP,cplSeSvImcVWmVZ,cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSecSeVPVP,          & 
& cplSecSeVPVZ,cplSecSecVWmVWm,cplSecSeVZVZ,cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,     & 
& cplSucSuVGVZ,cplSucSuVPVP,cplSucSdVPVWm,cplSucSuVPVZ,cplSucSdVWmVZ,cplSucSucVWmVWm,    & 
& cplSucSuVZVZ,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImcSeVPVWm,cplSvImcSeVWmVZ,       & 
& cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplVGVGVG,          & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,             & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,               & 
& cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,         & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,       & 
& cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpCVP,   & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgWmAh,   & 
& cplcgWpCgWpCAh,cplcgZgAhh,cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm)

em = cplcVWmVPVWm 
gs = cplcFdFdVGL(1,1) 
Call CouplingsColoredQuartics(g1,g2,lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,               & 
& lamN,Yv,ZVI,ZVR,g3,TW,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,          & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,         & 
& cplAhAhSvReSvRe1,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,            & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhHpmSucSdaa,     & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcHpmcSuaa,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,  & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmSucSdaa,cplhhHpmSvImcSe1,   & 
& cplhhHpmSvRecSe1,cplhhSdcHpmcSuaa,cplhhSeSvImcHpm1,cplhhSeSvRecHpm1,cplHpmHpmcHpmcHpm1,& 
& cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvImSvImcHpm1,              & 
& cplHpmSvImSvRecHpm1,cplHpmSvReSvRecHpm1,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,           & 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvImcSecSuaa,& 
& cplSdSvReSvRecSdaa,cplSdSvRecSecSuaa,cplSeSecSecSe1,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa, & 
& cplSeSucSecSuaa,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,cplSeSvReSvRecSe1,cplSuSucSucSuabba,& 
& cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,            & 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvReSvReSvRe1,   & 
& cplSvReSvReSvReSvRe1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,     & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhHpmcVWmVP1,          & 
& cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,       & 
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,          & 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSucVWmVGLamct4ct2ct1,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSucVWmVPaa,             & 
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSucVWmVZaa,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,   & 
& cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSecVWmVWm1,        & 
& cplSecSeVZVZ1,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVPLamct3ct2ct1,cplSucSdVGVWmLamct3ct2ct1,cplSucSuVGVZLamct3ct2ct1,           & 
& cplSucSuVPVPaa,cplSucSdVPVWmaa,cplSucSuVPVZaa,cplSucSdVWmVZaa,cplSucSucVWmVWmaa,       & 
& cplSucSuVZVZaa,cplSvImSvImcVWmVWm1,cplSvImSvImVZVZ1,cplSvImcSeVPVWm1,cplSvImcSeVWmVZ1, & 
& cplSvReSvRecVWmVWm1,cplSvReSvReVZVZ1,cplSvRecSeVPVWm1,cplSvRecSeVWmVZ1,cplVGVGVGVG1Q,  & 
& cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,        & 
& cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,& 
& cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q)

If (externalZfactors) Then 
Call getZCouplings(lam,Tlam,kap,Tk,vd,vu,vS,ZA,g1,g2,ZH,ZP,Yd,Td,ZD,Ye,               & 
& Te,ZE,Yu,Tu,ZU,lamN,TLN,Yv,Tv,ZVI,ZVR,g3,TW,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,              & 
& ZUR,UV,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,            & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,           & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,            & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,      & 
& cplAhAhAhAh,cplAhAhAhhh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,          & 
& cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhhhhh,              & 
& cplAhhhHpmcHpm,cplAhhhSdcSd,cplAhhhSecSe,cplAhhhSucSu,cplAhhhSvImSvIm,cplAhhhSvImSvRe, & 
& cplAhhhSvReSvRe,cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,          & 
& cplAhSeSvImcHpm,cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,               & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,             & 
& cplhhHpmSucSd,cplhhHpmSvImcSe,cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,          & 
& cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,     & 
& cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,  & 
& cplSdSucSdcSu,cplSdSvImSvImcSd,cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,       & 
& cplSeSecSecSe,cplSeSuSvImcSd,cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,            & 
& cplSeSvImSvRecSe,cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,     & 
& cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,          & 
& cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,           & 
& cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcSdVG,cplSdcSdVP,             & 
& cplSdcSdVZ,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,             & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSvImSvReVZ,cplSvImcSeVWm,              & 
& cplSvRecSeVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplcHpmVPVWm,           & 
& cplcHpmVWmVZ,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHpmcVWmVP,cplAhHpmcVWmVZ,cplAhcHpmVPVWm,  & 
& cplAhcHpmVWmVZ,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhHpmcVWmVP,cplhhHpmcVWmVZ,               & 
& cplhhcHpmVPVWm,cplhhcHpmVWmVZ,cplHpmcHpmVPVP,cplHpmcHpmVPVZ,cplHpmcHpmcVWmVWm,         & 
& cplHpmcHpmVZVZ,cplSdcSdVGVG,cplSdcSdVGVP,cplSdcSdVGVZ,cplSdcSucVWmVG,cplSdcSdVPVP,     & 
& cplSdcSdVPVZ,cplSdcSucVWmVP,cplSdcSdcVWmVWm,cplSdcSdVZVZ,cplSdcSucVWmVZ,               & 
& cplSeSvImcVWmVP,cplSeSvImcVWmVZ,cplSeSvRecVWmVP,cplSeSvRecVWmVZ,cplSecSeVPVP,          & 
& cplSecSeVPVZ,cplSecSecVWmVWm,cplSecSeVZVZ,cplSucSuVGVG,cplSucSuVGVP,cplSucSdVGVWm,     & 
& cplSucSuVGVZ,cplSucSuVPVP,cplSucSdVPVWm,cplSucSuVPVZ,cplSucSdVWmVZ,cplSucSucVWmVWm,    & 
& cplSucSuVZVZ,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,cplSvImcSeVPVWm,cplSvImcSeVWmVZ,       & 
& cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvRecSeVPVWm,cplSvRecSeVWmVZ,cplVGVGVG,          & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,         & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,              & 
& cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,       & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,             & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,               & 
& cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,         & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,       & 
& cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpCVP,   & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgWmAh,   & 
& cplcgWpCgWpCAh,cplcgZgAhh,cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,ZRUZD,             & 
& ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,            & 
& ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,ZcplAhAhAh,ZcplAhAhhh,ZcplAhhhhh,ZcplAhHpmcHpm,     & 
& ZcplAhSdcSd,ZcplAhSecSe,ZcplAhSucSu,ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplAhSvReSvRe,      & 
& Zcplhhhhhh,ZcplhhHpmcHpm,ZcplhhSdcSd,ZcplhhSecSe,ZcplhhSucSu,ZcplhhSvImSvIm,           & 
& ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplHpmSucSd,ZcplHpmSvImcSe,ZcplHpmSvRecSe,              & 
& ZcplSdcHpmcSu,ZcplSeSvImcHpm,ZcplSeSvRecHpm,ZcplAhAhAhAh,ZcplAhAhAhhh,ZcplAhAhhhhh,    & 
& ZcplAhAhHpmcHpm,ZcplAhAhSdcSd,ZcplAhAhSecSe,ZcplAhAhSucSu,ZcplAhAhSvImSvIm,            & 
& ZcplAhAhSvImSvRe,ZcplAhAhSvReSvRe,ZcplAhhhhhhh,ZcplAhhhHpmcHpm,ZcplAhhhSdcSd,          & 
& ZcplAhhhSecSe,ZcplAhhhSucSu,ZcplAhhhSvImSvIm,ZcplAhhhSvImSvRe,ZcplAhhhSvReSvRe,        & 
& ZcplAhHpmSucSd,ZcplAhHpmSvImcSe,ZcplAhHpmSvRecSe,ZcplAhSdcHpmcSu,ZcplAhSeSvImcHpm,     & 
& ZcplAhSeSvRecHpm,Zcplhhhhhhhh,ZcplhhhhHpmcHpm,ZcplhhhhSdcSd,ZcplhhhhSecSe,             & 
& ZcplhhhhSucSu,ZcplhhhhSvImSvIm,ZcplhhhhSvImSvRe,ZcplhhhhSvReSvRe,ZcplhhHpmSucSd,       & 
& ZcplhhHpmSvImcSe,ZcplhhHpmSvRecSe,ZcplhhSdcHpmcSu,ZcplhhSeSvImcHpm,ZcplhhSeSvRecHpm,   & 
& ZcplHpmHpmcHpmcHpm,ZcplHpmSdcHpmcSd,ZcplHpmSecHpmcSe,ZcplHpmSucHpmcSu,ZcplHpmSvImSvImcHpm,& 
& ZcplHpmSvImSvRecHpm,ZcplHpmSvReSvRecHpm,ZcplSdSdcSdcSd,ZcplSdSecSdcSe,ZcplSdSucSdcSu,  & 
& ZcplSdSvImSvImcSd,ZcplSdSvImcSecSu,ZcplSdSvReSvRecSd,ZcplSdSvRecSecSu,ZcplSeSecSecSe,  & 
& ZcplSeSuSvImcSd,ZcplSeSuSvRecSd,ZcplSeSucSecSu,ZcplSeSvImSvImcSe,ZcplSeSvImSvRecSe,    & 
& ZcplSeSvReSvRecSe,ZcplSuSucSucSu,ZcplSuSvImSvImcSu,ZcplSuSvImSvRecSu,ZcplSuSvReSvRecSu,& 
& ZcplSvImSvImSvImSvIm,ZcplSvImSvImSvImSvRe,ZcplSvImSvImSvReSvRe,ZcplSvImSvReSvReSvRe,   & 
& ZcplSvReSvReSvReSvRe,ZcplAhhhVZ,ZcplAhHpmcVWm,ZcplAhcHpmVWm,ZcplhhHpmcVWm,             & 
& ZcplhhcHpmVWm,ZcplHpmcHpmVP,ZcplHpmcHpmVZ,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSdcSdVZ,         & 
& ZcplSdcSucVWm,ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSecSeVP,ZcplSecSeVZ,ZcplSucSuVG,       & 
& ZcplSucSuVP,ZcplSucSdVWm,ZcplSucSuVZ,ZcplSvImSvReVZ,ZcplSvImcSeVWm,ZcplSvRecSeVWm,     & 
& ZcplhhcVWmVWm,ZcplhhVZVZ,ZcplHpmcVWmVP,ZcplHpmcVWmVZ,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,      & 
& ZcplAhAhcVWmVWm,ZcplAhAhVZVZ,ZcplAhHpmcVWmVP,ZcplAhHpmcVWmVZ,ZcplAhcHpmVPVWm,          & 
& ZcplAhcHpmVWmVZ,ZcplhhhhcVWmVWm,ZcplhhhhVZVZ,ZcplhhHpmcVWmVP,ZcplhhHpmcVWmVZ,          & 
& ZcplhhcHpmVPVWm,ZcplhhcHpmVWmVZ,ZcplHpmcHpmVPVP,ZcplHpmcHpmVPVZ,ZcplHpmcHpmcVWmVWm,    & 
& ZcplHpmcHpmVZVZ,ZcplSdcSdVGVG,ZcplSdcSdVGVP,ZcplSdcSdVGVZ,ZcplSdcSucVWmVG,             & 
& ZcplSdcSdVPVP,ZcplSdcSdVPVZ,ZcplSdcSucVWmVP,ZcplSdcSdcVWmVWm,ZcplSdcSdVZVZ,            & 
& ZcplSdcSucVWmVZ,ZcplSeSvImcVWmVP,ZcplSeSvImcVWmVZ,ZcplSeSvRecVWmVP,ZcplSeSvRecVWmVZ,   & 
& ZcplSecSeVPVP,ZcplSecSeVPVZ,ZcplSecSecVWmVWm,ZcplSecSeVZVZ,ZcplSucSuVGVG,              & 
& ZcplSucSuVGVP,ZcplSucSdVGVWm,ZcplSucSuVGVZ,ZcplSucSuVPVP,ZcplSucSdVPVWm,               & 
& ZcplSucSuVPVZ,ZcplSucSdVWmVZ,ZcplSucSucVWmVWm,ZcplSucSuVZVZ,ZcplSvImSvImcVWmVWm,       & 
& ZcplSvImSvImVZVZ,ZcplSvImcSeVPVWm,ZcplSvImcSeVWmVZ,ZcplSvReSvRecVWmVWm,ZcplSvReSvReVZVZ,& 
& ZcplSvRecSeVPVWm,ZcplSvRecSeVWmVZ,ZcplVGVGVG,ZcplcVWmVPVWm,ZcplcVWmVWmVZ,              & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,   & 
& ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplFvFvAhL,ZcplFvFvAhR,           & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplFvChacSeL,             & 
& ZcplFvChacSeR,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcFdChaSuL,ZcplcFdChaSuR,               & 
& ZcplcFeChaSvImL,ZcplcFeChaSvImR,ZcplcFeChaSvReL,ZcplcFeChaSvReR,ZcplChiChihhL,         & 
& ZcplChiChihhR,ZcplChiFdcSdL,ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,   & 
& ZcplChiFucSuR,ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,             & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFeChiSeL,             & 
& ZcplcFeChiSeR,ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcFuFdcHpmL,ZcplcFuFdcHpmR,              & 
& ZcplFvFecHpmL,ZcplFvFecHpmR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcChaFeSvImL,ZcplcChaFeSvImR, & 
& ZcplcChaFeSvReL,ZcplcChaFeSvReR,ZcplGluFucSuL,ZcplGluFucSuR,ZcplcFuFuhhL,              & 
& ZcplcFuFuhhR,ZcplcFdFuHpmL,ZcplcFdFuHpmR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplcFeFvHpmL,        & 
& ZcplcFeFvHpmR,ZcplcChaFvSeL,ZcplcChaFvSeR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuGluSuL,   & 
& ZcplcFuGluSuR,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplChiChacVWmL,ZcplChiChacVWmR,           & 
& ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplChiChiVZL,             & 
& ZcplChiChiVZR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVGL,ZcplcFdFdVGR,               & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR,     & 
& ZcplFvFecVWmL,ZcplFvFecVWmR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,       & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFdFuVWmL,ZcplcFdFuVWmR,       & 
& ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplFvFvVZL,ZcplFvFvVZR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,         & 
& ZcplGluGluVGL,ZcplGluGluVGR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWmVPVPVWm1,& 
& ZcplcVWmVPVPVWm2,ZcplcVWmVPVPVWm3,ZcplcVWmVPVWmVZ1,ZcplcVWmVPVWmVZ2,ZcplcVWmVPVWmVZ3,  & 
& ZcplcVWmcVWmVWmVWm1,ZcplcVWmcVWmVWmVWm2,ZcplcVWmcVWmVWmVWm3,ZcplcVWmVWmVZVZ1,          & 
& ZcplcVWmVWmVZVZ2,ZcplcVWmVWmVZVZ3,ZcplcgGgGVG,ZcplcgWmgAVWm,ZcplcgWpCgAcVWm,           & 
& ZcplcgWmgWmVP,ZcplcgWmgWmVZ,ZcplcgAgWmcVWm,ZcplcgZgWmcVWm,ZcplcgWpCgWpCVP,             & 
& ZcplcgAgWpCVWm,ZcplcgZgWpCVWm,ZcplcgWpCgWpCVZ,ZcplcgWmgZVWm,ZcplcgWpCgZcVWm,           & 
& ZcplcgWmgWmAh,ZcplcgWpCgWpCAh,ZcplcgZgAhh,ZcplcgWmgAHpm,ZcplcgWpCgAcHpm,               & 
& ZcplcgWmgWmhh,ZcplcgZgWmcHpm,ZcplcgWpCgWpChh,ZcplcgZgWpCHpm,ZcplcgZgZhh,               & 
& ZcplcgWmgZHpm,ZcplcgWpCgZcHpm)

End if 
Call getGBCouplings(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,             & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,cplAhcHpmVWm,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFuVWmL,               & 
& cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvFecVWmL,       & 
& cplFvFecVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,       & 
& cplSucSdVWm,cplSvImcSeVWm,cplSvRecSeVWm,ZcplAhcHpmVWm,ZcplcChaChiVWmL,ZcplcChaChiVWmR, & 
& ZcplcFdFuVWmL,ZcplcFdFuVWmR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,ZcplcFuFdcVWmL,ZcplcFuFdcVWmR, & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcHpmVPVWm,ZcplcHpmVWmVZ,ZcplcVWmVPVWm,             & 
& ZcplcVWmVWmVZ,ZcplFvFecVWmL,ZcplFvFecVWmR,ZcplhhcHpmVWm,ZcplhhcVWmVWm,ZcplSdcSucVWm,   & 
& ZcplSeSvImcVWm,ZcplSeSvRecVWm,ZcplSucSdVWm,ZcplSvImcSeVWm,ZcplSvRecSeVWm,              & 
& GcplAhHpmcHpm,GcplhhHpmcHpm,GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe,GcplSdcHpmcSu,  & 
& GcplSeSvImcHpm,GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,GcplhhHpmcVWm,               & 
& GcplhhcHpmVWm,GcplHpmcHpmVP,GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,GcplcHpmVPVWm,   & 
& GcplcHpmVWmVZ,GcplChiChacHpmL,GcplChiChacHpmR,GcplcChaChiHpmL,GcplcChaChiHpmR,         & 
& GcplcFuFdcHpmL,GcplcFuFdcHpmR,GcplFvFecHpmL,GcplFvFecHpmR,GcplcFdFuHpmL,               & 
& GcplcFdFuHpmR,GcplcFeFvHpmL,GcplcFeFvHpmR,GZcplAhHpmcHpm,GZcplhhHpmcHpm,               & 
& GZcplHpmSucSd,GZcplHpmSvImcSe,GZcplHpmSvRecSe,GZcplSdcHpmcSu,GZcplSeSvImcHpm,          & 
& GZcplSeSvRecHpm,GZcplAhHpmcVWm,GZcplAhcHpmVWm,GZcplhhHpmcVWm,GZcplhhcHpmVWm,           & 
& GZcplHpmcHpmVP,GZcplHpmcHpmVZ,GZcplHpmcVWmVP,GZcplHpmcVWmVZ,GZcplcHpmVPVWm,            & 
& GZcplcHpmVWmVZ,GZcplChiChacHpmL,GZcplChiChacHpmR,GZcplcChaChiHpmL,GZcplcChaChiHpmR,    & 
& GZcplcFuFdcHpmL,GZcplcFuFdcHpmR,GZcplFvFecHpmL,GZcplFvFecHpmR,GZcplcFdFuHpmL,          & 
& GZcplcFdFuHpmR,GZcplcFeFvHpmL,GZcplcFeFvHpmR,GosZcplAhHpmcHpm,GosZcplhhHpmcHpm,        & 
& GosZcplHpmSucSd,GosZcplHpmSvImcSe,GosZcplHpmSvRecSe,GosZcplSdcHpmcSu,GosZcplSeSvImcHpm,& 
& GosZcplSeSvRecHpm,GosZcplAhHpmcVWm,GosZcplAhcHpmVWm,GosZcplhhHpmcVWm,GosZcplhhcHpmVWm, & 
& GosZcplHpmcHpmVP,GosZcplHpmcHpmVZ,GosZcplHpmcVWmVP,GosZcplHpmcVWmVZ,GosZcplcHpmVPVWm,  & 
& GosZcplcHpmVWmVZ,GosZcplChiChacHpmL,GosZcplChiChacHpmR,GosZcplcChaChiHpmL,             & 
& GosZcplcChaChiHpmR,GosZcplcFuFdcHpmL,GosZcplcFuFdcHpmR,GosZcplFvFecHpmL,               & 
& GosZcplFvFecHpmR,GosZcplcFdFuHpmL,GosZcplcFdFuHpmR,GosZcplcFeFvHpmL,GosZcplcFeFvHpmR)

! Write intilization of all counter terms 
Call WaveFunctionRenormalisation(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,               & 
& MSvRe2OS,MSuOS,MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,           & 
& MChiOS,MChi2OS,MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,            & 
& MFu2OS,MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,               & 
& ZEOS,ZHOS,ZAOS,ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,           & 
& MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,               & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,               & 
& ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,             & 
& Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,             & 
& vS,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,           & 
& cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,           & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplAhAhAhAh,      & 
& cplAhAhAhhh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,         & 
& cplAhAhSvImSvIm,cplAhAhSvImSvRe,cplAhAhSvReSvRe,cplAhhhhhhh,cplAhhhHpmcHpm,            & 
& cplAhhhSdcSd,cplAhhhSecSe,cplAhhhSucSu,cplAhhhSvImSvIm,cplAhhhSvImSvRe,cplAhhhSvReSvRe,& 
& cplAhHpmSucSd,cplAhHpmSvImcSe,cplAhHpmSvRecSe,cplAhSdcHpmcSu,cplAhSeSvImcHpm,          & 
& cplAhSeSvRecHpm,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,     & 
& cplhhhhSvImSvIm,cplhhhhSvImSvRe,cplhhhhSvReSvRe,cplhhHpmSucSd,cplhhHpmSvImcSe,         & 
& cplhhHpmSvRecSe,cplhhSdcHpmcSu,cplhhSeSvImcHpm,cplhhSeSvRecHpm,cplHpmHpmcHpmcHpm,      & 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvImSvRecHpm, & 
& cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSdSvImSvImcSd,         & 
& cplSdSvImcSecSu,cplSdSvReSvRecSd,cplSdSvRecSecSu,cplSeSecSecSe,cplSeSuSvImcSd,         & 
& cplSeSuSvRecSd,cplSeSucSecSu,cplSeSvImSvImcSe,cplSeSvImSvRecSe,cplSeSvReSvRecSe,       & 
& cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvImSvRecSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvImSvRe,cplSvImSvImSvReSvRe,cplSvImSvReSvReSvRe,cplSvReSvReSvReSvRe,       & 
& cplAhhhVZ,cplAhHpmcVWm,cplAhcHpmVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmcHpmVP,            & 
& cplHpmcHpmVZ,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSucVWm,cplSeSvImcVWm,              & 
& cplSeSvRecVWm,cplSecSeVP,cplSecSeVZ,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,      & 
& cplSvImSvReVZ,cplSvImcSeVWm,cplSvRecSeVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcVWmVP,         & 
& cplHpmcVWmVZ,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHpmcVWmVP,      & 
& cplAhHpmcVWmVZ,cplAhcHpmVPVWm,cplAhcHpmVWmVZ,cplhhhhcVWmVWm,cplhhhhVZVZ,               & 
& cplhhHpmcVWmVP,cplhhHpmcVWmVZ,cplhhcHpmVPVWm,cplhhcHpmVWmVZ,cplHpmcHpmVPVP,            & 
& cplHpmcHpmVPVZ,cplHpmcHpmcVWmVWm,cplHpmcHpmVZVZ,cplSdcSdVGVG,cplSdcSdVGVP,             & 
& cplSdcSdVGVZ,cplSdcSucVWmVG,cplSdcSdVPVP,cplSdcSdVPVZ,cplSdcSucVWmVP,cplSdcSdcVWmVWm,  & 
& cplSdcSdVZVZ,cplSdcSucVWmVZ,cplSeSvImcVWmVP,cplSeSvImcVWmVZ,cplSeSvRecVWmVP,           & 
& cplSeSvRecVWmVZ,cplSecSeVPVP,cplSecSeVPVZ,cplSecSecVWmVWm,cplSecSeVZVZ,cplSucSuVGVG,   & 
& cplSucSuVGVP,cplSucSdVGVWm,cplSucSuVGVZ,cplSucSuVPVP,cplSucSdVPVWm,cplSucSuVPVZ,       & 
& cplSucSdVWmVZ,cplSucSucVWmVWm,cplSucSuVZVZ,cplSvImSvImcVWmVWm,cplSvImSvImVZVZ,         & 
& cplSvImcSeVPVWm,cplSvImcSeVWmVZ,cplSvReSvRecVWmVWm,cplSvReSvReVZVZ,cplSvRecSeVPVWm,    & 
& cplSvRecSeVWmVZ,cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,   & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,             & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,              & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,               & 
& cplcFeFvVWmR,cplGluGluVGL,cplGluGluVGR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,         & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,       & 
& cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,cplcgWmgAVWm,               & 
& cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgWpCVP,   & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgWmAh,   & 
& cplcgWpCgWpCAh,cplcgZgAhh,cplcgWmgAHpm,cplcgWpCgAcHpm,cplcgWmgWmhh,cplcgZgWmcHpm,      & 
& cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,GcplAhHpmcHpm,     & 
& GcplhhHpmcHpm,GcplHpmSucSd,GcplHpmSvImcSe,GcplHpmSvRecSe,GcplSdcHpmcSu,GcplSeSvImcHpm, & 
& GcplSeSvRecHpm,GcplAhHpmcVWm,GcplAhcHpmVWm,GcplhhHpmcVWm,GcplhhcHpmVWm,GcplHpmcHpmVP,  & 
& GcplHpmcHpmVZ,GcplHpmcVWmVP,GcplHpmcVWmVZ,GcplcHpmVPVWm,GcplcHpmVWmVZ,GcplChiChacHpmL, & 
& GcplChiChacHpmR,GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcFuFdcHpmL,GcplcFuFdcHpmR,         & 
& GcplFvFecHpmL,GcplFvFecHpmR,GcplcFdFuHpmL,GcplcFdFuHpmR,GcplcFeFvHpmL,GcplcFeFvHpmR,   & 
& dg1,dg2,dg3,dYd,dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,            & 
& dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,            & 
& dZD,dZVI,dZVR,dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,            & 
& dZUR,dSinTW,dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,           & 
& ZfSe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,          & 
& ZfVPVZ,ZfVZVP,ctcplAhAhAh,ctcplAhAhhh,ctcplAhhhhh,ctcplAhHpmcHpm,ctcplAhSdcSd,         & 
& ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,             & 
& ctcplhhhhhh,ctcplhhHpmcHpm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvImSvIm,     & 
& ctcplhhSvImSvRe,ctcplhhSvReSvRe,ctcplHpmSucSd,ctcplHpmSvImcSe,ctcplHpmSvRecSe,         & 
& ctcplSdcHpmcSu,ctcplSeSvImcHpm,ctcplSeSvRecHpm,ctcplAhhhVZ,ctcplAhHpmcVWm,             & 
& ctcplAhcHpmVWm,ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,            & 
& ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSucVWm,ctcplSeSvImcVWm,ctcplSeSvRecVWm, & 
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
& ctcplFvFvVZL,ctcplFvFvVZR,ctcplcFeFvVWmL,ctcplcFeFvVWmR,ctcplGluGluVGL,ctcplGluGluVGR, & 
& MLambda,deltaM,kont)

! -------------------------------------------- 
! The decays at one-loop 
! -------------------------------------------- 

! SvRe
If (CalcLoopDecay_SvRe) Then 
Call OneLoopDecay_SvRe(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,          & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,         & 
& cplAhcHpmVWm,cplAhhhhh,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,             & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcSd,      & 
& cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,   & 
& cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,            & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL,        & 
& cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,      & 
& cplhhhhhh,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmcHpm,             & 
& cplhhHpmcVWm,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1, & 
& cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,       & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmSecHpmcSe1,cplHpmSucSd,      & 
& cplHpmSvImcSe,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplHpmSvReSvRecHpm1,cplSdSvRecSecSuaa, & 
& cplSdSvReSvRecSdaa,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVZ,cplSeSvImcHpm,               & 
& cplSeSvImcVWm,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImSvRecSe1,cplSeSvRecHpm,       & 
& cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSeSvReSvRecSe1,cplSuSvImSvRecSuaa,  & 
& cplSuSvReSvRecSuaa,cplSvImcSeVPVWm1,cplSvImcSeVWm,cplSvImcSeVWmVZ1,cplSvImSvImSvImSvRe1,& 
& cplSvImSvImSvReSvRe1,cplSvImSvImVZVZ1,cplSvImSvReSvReSvRe1,cplSvImSvReVZ,              & 
& cplSvRecSeVPVWm1,cplSvRecSeVWm,cplSvRecSeVWmVZ1,cplSvReSvRecVWmVWm1,cplSvReSvReSvReSvRe1,& 
& cplSvReSvReVZVZ1,ctcplAhSvImSvRe,ctcplAhSvReSvRe,ctcplcFeChaSvReL,ctcplcFeChaSvReR,    & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,ctcplhhSvImSvRe,ctcplhhSvReSvRe,ctcplHpmSvRecSe,       & 
& ctcplSeSvRecVWm,ctcplSvImSvReVZ,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplSeSvRecHpm,            & 
& GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplSeSvRecHpm,GZcplcHpmVPVWm,GZcplHpmcVWmVP,     & 
& GZcplSeSvRecHpm,ZcplAhSvImSvRe,ZcplAhSvReSvRe,ZcplcFeChaSvReL,ZcplcFeChaSvReR,         & 
& ZcplChiFvSvReL,ZcplChiFvSvReR,ZcplhhSvImSvRe,ZcplhhSvReSvRe,ZcplHpmSvRecSe,            & 
& ZcplSeSvRecVWm,ZcplSvImSvReVZ,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,             & 
& ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,               & 
& MLambda,em,gs,deltaM,kont,gP1LSvRe)

End if 
! SvIm
If (CalcLoopDecay_SvIm) Then 
Call OneLoopDecay_SvIm(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,          & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhAhSvImSvIm1,cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,         & 
& cplAhcHpmVWm,cplAhhhhh,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,             & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcSd,      & 
& cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,   & 
& cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,            & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL,        & 
& cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,      & 
& cplhhhhhh,cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhHpmcHpm,             & 
& cplhhHpmcVWm,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,cplhhSdcSd,cplhhSecSe,cplhhSeSvImcHpm1, & 
& cplhhSeSvRecHpm1,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,       & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmSecHpmcSe1,cplHpmSucSd,      & 
& cplHpmSvImcSe,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,cplSdSvImcSecSuaa, & 
& cplSdSvImSvImcSdaa,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVZ,cplSeSvImcHpm,               & 
& cplSeSvImcVWm,cplSeSvImcVWmVP1,cplSeSvImcVWmVZ1,cplSeSvImSvImcSe1,cplSeSvImSvRecSe1,   & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSeSvRecVWmVP1,cplSeSvRecVWmVZ1,cplSuSvImSvImcSuaa,      & 
& cplSuSvImSvRecSuaa,cplSvImcSeVPVWm1,cplSvImcSeVWm,cplSvImcSeVWmVZ1,cplSvImSvImcVWmVWm1,& 
& cplSvImSvImSvImSvIm1,cplSvImSvImSvImSvRe1,cplSvImSvImSvReSvRe1,cplSvImSvImVZVZ1,       & 
& cplSvImSvReSvReSvRe1,cplSvImSvReVZ,cplSvRecSeVPVWm1,cplSvRecSeVWm,cplSvRecSeVWmVZ1,    & 
& cplSvReSvReVZVZ1,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplcFeChaSvImL,ctcplcFeChaSvImR,    & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,ctcplhhSvImSvIm,ctcplhhSvImSvRe,ctcplHpmSvImcSe,       & 
& ctcplSeSvImcVWm,ctcplSvImSvReVZ,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplSeSvImcHpm,            & 
& GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplSeSvImcHpm,GZcplcHpmVPVWm,GZcplHpmcVWmVP,     & 
& GZcplSeSvImcHpm,ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplcFeChaSvImL,ZcplcFeChaSvImR,         & 
& ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplhhSvImSvIm,ZcplhhSvImSvRe,ZcplHpmSvImcSe,            & 
& ZcplSeSvImcVWm,ZcplSvImSvReVZ,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,             & 
& ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,               & 
& MLambda,em,gs,deltaM,kont,gP1LSvIm)

End if 
! Hpm
If (CalcLoopDecay_Hpm) Then 
Call OneLoopDecay_Hpm(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,           & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhHpmcHpm1,cplAhcHpmVPVWm1,            & 
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

End if 
! hh
If (CalcLoopDecay_hh) Then 
Call OneLoopDecay_hh(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,            & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhhhhh1,     & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,          & 
& cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVZVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWm,           & 
& cplAhcHpmVWmVZ1,cplAhhhhh,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhhhVZ,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcSd,cplAhSecSe,       & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,      & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,              & 
& cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,            & 
& cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,              & 
& cplcFuGluSuR,cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm,cplcgWmgAVWm,cplcgWmgWmAh,       & 
& cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgZHpm,cplcgWmgZVWm,cplcgWpCgAcVWm,       & 
& cplcgWpCgWpCAh,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcHpm,            & 
& cplcgWpCgZcVWm,cplcgZgAhh,cplcgZgWmcHpm,cplcgZgWmcVWm,cplcgZgWpCHpm,cplcgZgWpCVWm,     & 
& cplcgZgZhh,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcHpmVPVWm,     & 
& cplcHpmVWmVZ,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,              & 
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

End if 
! Ah
If (CalcLoopDecay_Ah) Then 
Call OneLoopDecay_Ah(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,            & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhAhAh1,cplAhAhAhhh1,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhhhhh1,     & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvImSvIm1,          & 
& cplAhAhSvImSvRe1,cplAhAhSvReSvRe1,cplAhAhVZVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWm,           & 
& cplAhcHpmVWmVZ1,cplAhhhhh,cplAhhhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvImSvIm1,cplAhhhSvImSvRe1,cplAhhhSvReSvRe1,cplAhhhVZ,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmSucSdaa,             & 
& cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcHpmcSuaa,cplAhSdcSd,cplAhSecSe,              & 
& cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,              & 
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
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm,        & 
& cplcgWmgAVWm,cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgZHpm,         & 
& cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,cplcgWpCgWpChh,cplcgWpCgWpCVP,              & 
& cplcgWpCgWpCVZ,cplcgWpCgZcHpm,cplcgWpCgZcVWm,cplcgZgWmcHpm,cplcgZgWmcVWm,              & 
& cplcgZgWpCHpm,cplcgZgWpCVWm,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,   & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL,cplFvChacSeR,         & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,cplhhcHpmVWmVZ1,cplhhcVWmVWm,cplhhhhcVWmVWm1,& 
& cplhhhhhh,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,    & 
& cplhhhhSvImSvIm1,cplhhhhSvImSvRe1,cplhhhhSvReSvRe1,cplhhhhVZVZ1,cplhhHpmcHpm,          & 
& cplhhHpmcVWm,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhSdcSd,cplhhSecSe,cplhhSucSu,         & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmcVWmVWm1,cplHpmcHpmVP,   & 
& cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmVZ,cplHpmcHpmVZVZ1,cplHpmcVWmVP,             & 
& cplHpmcVWmVZ,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,  & 
& cplHpmSucSd,cplHpmSvImcSe,cplHpmSvImSvImcHpm1,cplHpmSvImSvRecHpm1,cplHpmSvRecSe,       & 
& cplHpmSvReSvRecHpm1,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
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
& ctcplAhAhAh,ctcplAhAhhh,ctcplAhhhhh,ctcplAhhhVZ,ctcplAhHpmcHpm,ctcplAhHpmcVWm,         & 
& ctcplAhSdcSd,ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvImSvIm,ctcplAhSvImSvRe,ctcplAhSvReSvRe,& 
& ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,             & 
& ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplChiChiAhL,ctcplChiChiAhR,               & 
& ctcplFvFvAhL,ctcplFvFvAhR,GcplAhHpmcHpm,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplAhHpmcHpm,  & 
& GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplAhHpmcHpm,GZcplcHpmVPVWm,GZcplHpmcVWmVP,        & 
& ZcplAhAhAh,ZcplAhAhhh,ZcplAhhhhh,ZcplAhhhVZ,ZcplAhHpmcHpm,ZcplAhHpmcVWm,               & 
& ZcplAhSdcSd,ZcplAhSecSe,ZcplAhSucSu,ZcplAhSvImSvIm,ZcplAhSvImSvRe,ZcplAhSvReSvRe,      & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,     & 
& ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplFvFvAhL,ZcplFvFvAhR,         & 
& ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,             & 
& ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LAh)

End if 
! Su
If (CalcLoopDecay_Su) Then 
Call OneLoopDecay_Su(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,            & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhAhSucSuaa,cplAhcHpmVWm,cplAhhhhh,cplAhhhSucSuaa,       & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChacFuSdL,         & 
& cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcHpmVPVWm,cplcHpmVWmVZ,         & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,         & 
& cplGluGluVGL,cplGluGluVGR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhhhSucSuaa,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplhhSdcSd,cplhhSecSe,      & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmVP,           & 
& cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,            & 
& cplHpmSucSd,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,           & 
& cplSdcSucVWm,cplSdcSucVWmVGLamct4ct2ct1,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,             & 
& cplSdSucSdcSuabab,cplSdSucSdcSuabba,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,               & 
& cplSeSucSecSuaa,cplSeSvImcHpm,cplSeSvRecHpm,cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa, & 
& cplSucSdVWm,cplSucSdVWmVZaa,cplSucSucVWmVWmaa,cplSucSuVG,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSucSuVGVPLamct3ct2ct1,cplSucSuVGVZLamct3ct2ct1,& 
& cplSucSuVP,cplSucSuVPVPaa,cplSucSuVPVZaa,cplSucSuVZ,cplSucSuVZVZaa,cplSuSucSucSuabab,  & 
& cplSuSucSucSuabba,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,            & 
& cplVGVGVG,ctcplAhSucSu,ctcplcChaFdcSuL,ctcplcChaFdcSuR,ctcplChiFucSuL,ctcplChiFucSuR,  & 
& ctcplGluFucSuL,ctcplGluFucSuR,ctcplhhSucSu,ctcplSdcHpmcSu,ctcplSdcSucVWm,              & 
& ctcplSucSuVG,ctcplSucSuVP,ctcplSucSuVZ,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplSdcHpmcSu,      & 
& GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplSdcHpmcSu,GZcplcHpmVPVWm,GZcplHpmcVWmVP,      & 
& GZcplSdcHpmcSu,ZcplAhSucSu,ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplChiFucSuL,ZcplChiFucSuR,  & 
& ZcplGluFucSuL,ZcplGluFucSuR,ZcplhhSucSu,ZcplSdcHpmcSu,ZcplSdcSucVWm,ZcplSucSuVZ,       & 
& ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,             & 
& ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LSu)

End if 
! Sd
If (CalcLoopDecay_Sd) Then 
Call OneLoopDecay_Sd(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,            & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhAhSdcSdaa,cplAhcHpmVWm,cplAhhhhh,cplAhhhSdcSdaa,       & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,cplcChacFuSdL,cplcChacFuSdR,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,            & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcHpmVPVWm,cplcHpmVWmVZ,         & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,         & 
& cplGluGluVGL,cplGluGluVGR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhhhSdcSdaa,          & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplhhSdcSd,cplhhSecSe,      & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,            & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplHpmSucSd,             & 
& cplHpmSvImcSe,cplHpmSvRecSe,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVP,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVZ,cplSdcSdVZVZaa,cplSdcSucVWm,       & 
& cplSdcSucVWmVGLamct4ct2ct1,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,cplSdSdcSdcSdabab,        & 
& cplSdSdcSdcSdabba,cplSdSecSdcSeaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,cplSdSvImSvImcSdaa,& 
& cplSdSvReSvRecSdaa,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVGVWmLamct3ct2ct1,        & 
& cplSucSdVPVWmaa,cplSucSdVWm,cplSucSdVWmVZaa,cplSucSucVWmVWmaa,cplSucSuVG,              & 
& cplSucSuVP,cplSucSuVZ,cplVGVGVG,ctcplAhSdcSd,ctcplChaFucSdL,ctcplChaFucSdR,            & 
& ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplGluFdcSdL,ctcplGluFdcSdR,ctcplhhSdcSd,              & 
& ctcplHpmSucSd,ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSucSdVWm,GcplcHpmVPVWm,      & 
& GcplHpmcVWmVP,GcplHpmSucSd,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplHpmSucSd,          & 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,GZcplHpmSucSd,ZcplAhSdcSd,ZcplChaFucSdL,ZcplChaFucSdR,   & 
& ZcplChiFdcSdL,ZcplChiFdcSdR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplhhSdcSd,ZcplHpmSucSd,      & 
& ZcplSdcSdVZ,ZcplSucSdVWm,ZRUZD,ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,            & 
& ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,             & 
& em,gs,deltaM,kont,gP1LSd)

End if 
! Se
If (CalcLoopDecay_Se) Then 
Call OneLoopDecay_Se(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,            & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhAhSecSe1,cplAhcHpmVWm,cplAhhhhh,cplAhhhSecSe1,         & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvImcSe1,cplAhHpmSvRecSe1,cplAhSdcSd,      & 
& cplAhSecSe,cplAhSeSvImcHpm1,cplAhSeSvRecHpm1,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,   & 
& cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,            & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL, & 
& cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplFvChacSeL,        & 
& cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpmVWm,cplhhcVWmVWm,      & 
& cplhhhhhh,cplhhhhSecSe1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSvImcSe1,cplhhHpmSvRecSe1,   & 
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

End if 
! Glu
If (CalcLoopDecay_Glu) Then 
Call OneLoopDecay_Glu(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,           & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhSdcSd,cplAhSucSu,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChiSdL,cplcFdChiSdR,    & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,           & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplhhSdcSd,cplhhSucSu,             & 
& cplHpmSucSd,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSucVWm,cplSucSdVWm,    & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplVGVGVG,ctcplGluFdcSdL,ctcplGluFdcSdR,              & 
& ctcplGluFucSuL,ctcplGluFucSuR,ctcplGluGluVGL,ctcplGluGluVGR,ZcplAhSdcSd,               & 
& ZcplAhSucSu,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFdFdhhL,        & 
& ZcplcFdFdhhR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,         & 
& ZcplcFdFdVZR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplcFuFuAhL,     & 
& ZcplcFuFuAhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,         & 
& ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFuGluSuL,ZcplcFuGluSuR,ZcplChiFdcSdL,      & 
& ZcplChiFdcSdR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplGluFucSuL,   & 
& ZcplGluFucSuR,ZcplGluGluVGL,ZcplGluGluVGR,ZcplhhSdcSd,ZcplhhSucSu,ZcplSdcSdVG,         & 
& ZcplSdcSdVP,ZcplSdcSdVZ,ZcplSucSuVG,ZcplSucSuVP,ZcplSucSuVZ,ZcplVGVGVG,ZRUZD,          & 
& ZRUZVI,ZRUZVR,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,            & 
& ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LGlu)

End if 
! Cha
If (CalcLoopDecay_Cha) Then 
Call OneLoopDecay_Cha(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,           & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhcHpmVWm,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,              & 
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

End if 
! Chi
If (CalcLoopDecay_Chi) Then 
Call OneLoopDecay_Chi(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,           & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhcHpmVWm,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,              & 
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

End if 
! Fv
If (CalcLoopDecay_Fv) Then 
Call OneLoopDecay_Fv(MSdOS,MSd2OS,MSvImOS,MSvIm2OS,MSvReOS,MSvRe2OS,MSuOS,            & 
& MSu2OS,MSeOS,MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,           & 
& MFvOS,MFv2OS,MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,             & 
& MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZVIOS,ZVROS,ZUOS,ZEOS,ZHOS,ZAOS,              & 
& ZPOS,ZNOS,UVOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,            & 
& MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,              & 
& MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,            & 
& MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,            & 
& ZVR,ZW,ZZ,betaH,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,             & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,dg1,dg2,dg3,dYd,               & 
& dTd,dYe,dTe,dlam,dTlam,dkap,dTk,dlamN,dTLN,dYu,dTu,dYv,dTv,dmq2,dml2,dmHd2,            & 
& dmHu2,dmd2,dmu2,dme2,dmv2,dms2,dM1,dM2,dM3,dvd,dvu,dvS,dpG,dZD,dZVI,dZVR,              & 
& dZU,dZE,dZH,dZA,dZP,dZN,dUV,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,              & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSvIm,ZfSvRe,ZfSu,ZfSe,Zfhh,             & 
& ZfAh,ZfHpm,ZfL0,ZfFV,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,             & 
& ZfVZVP,cplAhAhAh,cplAhAhhh,cplAhcHpmVWm,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,       & 
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
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,        & 
& cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmSvImcSe,           & 
& cplHpmSvRecSe,cplSecSeVP,cplSecSeVZ,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,         & 
& cplSeSvRecVWm,cplSvImcSeVWm,cplSvImSvReVZ,cplSvRecSeVWm,ctcplChiFvSvImL,               & 
& ctcplChiFvSvImR,ctcplChiFvSvReL,ctcplChiFvSvReR,ctcplFvChacSeL,ctcplFvChacSeR,         & 
& ctcplFvFecHpmL,ctcplFvFecHpmR,ctcplFvFecVWmL,ctcplFvFecVWmR,ctcplFvFvAhL,              & 
& ctcplFvFvAhR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplFvFvVZL,ctcplFvFvVZR,GcplcHpmVPVWm,        & 
& GcplFvFecHpmL,GcplFvFecHpmR,GcplHpmcVWmVP,GosZcplcHpmVPVWm,GosZcplFvFecHpmL,           & 
& GosZcplFvFecHpmR,GosZcplHpmcVWmVP,GZcplcHpmVPVWm,GZcplFvFecHpmL,GZcplFvFecHpmR,        & 
& GZcplHpmcVWmVP,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaFvSeL,ZcplcChaFvSeR,              & 
& ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFvHpmL,ZcplcFeFvHpmR,ZcplcFeFvVWmL,ZcplcFeFvVWmR,     & 
& ZcplChiFvSvImL,ZcplChiFvSvImR,ZcplChiFvSvReL,ZcplChiFvSvReR,ZcplcHpmVPVWm,             & 
& ZcplcVWmVPVWm,ZcplFvChacSeL,ZcplFvChacSeR,ZcplFvFecHpmL,ZcplFvFecHpmR,ZcplFvFecVWmL,   & 
& ZcplFvFecVWmR,ZcplFvFvAhL,ZcplFvFvAhR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplFvFvVZL,             & 
& ZcplFvFvVZR,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSecSeVP,ZRUZD,ZRUZVI,ZRUZVR,               & 
& ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUUV,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,            & 
& ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LFv)

End if 
If (Extra_scale_loopDecays) Then 
q2 = SetRenormalizationScale(q2_save) 
End if 
Iname = Iname - 1 
 
End Subroutine CalculateOneLoopDecays  
 
 
End Module OneLoopDecays_seesaw1nmssm 
 