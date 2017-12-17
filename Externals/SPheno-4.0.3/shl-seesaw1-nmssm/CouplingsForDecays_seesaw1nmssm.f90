! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 19:00 on 2.10.2017   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_seesaw1nmssm
 
Use Control 
Use Settings 
Use Model_Data_seesaw1nmssm 
Use Couplings_seesaw1nmssm 
Use LoopCouplings_seesaw1nmssm 
Use Tadpoles_seesaw1nmssm 
 Use TreeLevelMasses_seesaw1nmssm 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_SvRe_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,          & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSvImSvRe,cplAhSvReSvRe,cplcFeChaSvReL,cplcFeChaSvReR,             & 
& cplChiFvSvReL,cplChiFvSvReR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecVWm,   & 
& cplSvImSvReVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),   & 
& cplHpmSvRecSe(2,6,6),cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_SvRe_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZA,cplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvReSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVR,             & 
& ZA,cplAhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZH,cplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvReSvReT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVR,ZH,cplhhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvRecSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvRecSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVR,            & 
& ZE,ZP,cplHpmSvRecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvRecVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSeSvRecVWmT(gt1,gt2,g2,ZVR,ZE,cplSeSvRecVWm(gt1,gt2))

 End Do 
End Do 


cplSvImSvReVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImSvReVZT(gt1,gt2,g1,g2,ZVI,ZVR,TW,cplSvImSvReVZ(gt1,gt2))

 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_SvRe_decays_2B
 
Subroutine CouplingsFor_SvIm_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,          & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSvImSvIm,cplAhSvImSvRe,cplcFeChaSvImL,cplcFeChaSvImR,             & 
& cplChiFvSvImL,cplChiFvSvImR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcVWm,   & 
& cplSvImSvReVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),& 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),   & 
& cplHpmSvImcSe(2,6,6),cplSeSvImcVWm(6,6),cplSvImSvReVZ(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_SvIm_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvImT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZA,cplAhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZA,cplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvImT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZH,cplhhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZH,cplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvImcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvImcSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVI,            & 
& ZE,ZP,cplHpmSvImcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvImcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSeSvImcVWmT(gt1,gt2,g2,ZVI,ZE,cplSeSvImcVWm(gt1,gt2))

 End Do 
End Do 


cplSvImSvReVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImSvReVZT(gt1,gt2,g1,g2,ZVI,ZVR,TW,cplSvImSvReVZ(gt1,gt2))

 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_SvIm_decays_2B
 
Subroutine CouplingsFor_Hpm_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplFvFecHpmL,cplFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,       & 
& cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVWmVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhHpmcHpm(3,2,2),cplAhcHpmVWm(3,2),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),    & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),     & 
& cplhhHpmcHpm(3,2,2),cplhhcHpmVWm(3,2),cplHpmcHpmVZ(2,2),cplSdcHpmcSu(6,2,6),           & 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplcHpmVWmVZ(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hpm_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,kap,vd,vu,vS,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,vd,vu,vS,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,             & 
& cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvImcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingSeSvImcHpmT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVI,            & 
& ZE,ZP,cplSeSvImcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvRecHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingSeSvRecHpmT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVR,            & 
& ZE,ZP,cplSeSvRecHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingAhcHpmVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplinghhcHpmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHpmcHpmVZT(gt1,gt2,g1,g2,ZP,TW,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplcHpmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcHpmVWmVZT(gt1,g1,g2,vd,vu,ZP,TW,cplcHpmVWmVZ(gt1))

End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hpm_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplAhAhhh,         & 
& cplAhhhhh,cplAhhhVZ,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,       & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhcVWmVWm,cplhhVZVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplHiggsPP(3),cplHiggsGG(3),cplHiggsZZvirt(3),cplHiggsWWvirt(3),cplAhAhhh(3,3,3),     & 
& cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),             & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),         & 
& cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhHpmcVWm(3,2),cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),               & 
& cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),cplhhcVWmVWm(3),        & 
& cplhhVZVZ(3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(2),ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(2),ratPSd(6),ratPSe(6),              & 
& ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhhhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,vd,vu,vS,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Yd,Td,lam,vd,vu,vS,ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,Ye,Te,lam,vd,vu,vS,ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,lam,Yu,Tu,vd,vu,vS,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvImT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZH,cplhhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZH,cplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvReSvReT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVR,ZH,cplhhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplinghhHpmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZT(gt1,g1,g2,vd,vu,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev = Sqrt(vd**2 + vu**2)
cplHiggsWWvirt = cplhhcVWmVWm/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
rHB_S_VWm(i1) = Abs(-0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2) 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 6
rHB_S_S_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)+cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_S_P_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)-cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 2
ratCha(i2) = cplcChaChahhL(i2,i2,i1)*1._dp*vev/MCha(i2) 
End Do 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 2
ratHpm(i2) = 0.5_dp*cplhhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
Do i2=1, 6
ratSd(i2) = 0.5_dp*cplhhSdcSd(i1,i2,i2)*vev/MSd2(i2) 
End Do 
Do i2=1, 6
ratSe(i2) = 0.5_dp*cplhhSecSe(i1,i2,i2)*vev/MSe2(i2) 
End Do 
Do i2=1, 6
ratSu(i2) = 0.5_dp*cplhhSucSu(i1,i2,i2)*vev/MSu2(i2) 
End Do 
ratVWm = -0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratCha,ratFd,ratFe,ratFu,ratHpm,ratSd,ratSe,           & 
& ratSu,ratVWm,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha)) 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,ratSd,ratSu,MFd,MFu,MSd,MSu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,MSd,MSu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ)) 
If (i1.eq.1) Then 
CPL_A_H_Z = Abs(cplAhhhVZ**2/(g2**2/(cos(TW)**2*4._dp)))
CPL_H_H_Z = 0._dp 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhhhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,vd,vu,vS,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Yd,Td,lam,vd,vu,vS,ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,Ye,Te,lam,vd,vu,vS,ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,lam,Yu,Tu,vd,vu,vS,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvImT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZH,cplhhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZH,cplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvReSvReT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVR,ZH,cplhhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplinghhHpmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 3
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 3
Call CouplinghhVZVZT(gt1,g1,g2,vd,vu,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Ah_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplPseudoHiggsPP,cplPseudoHiggsGG,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,   & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhhh,cplAhhhVZ,         & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplAhSvReSvRe,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplPseudoHiggsPP(3),cplPseudoHiggsGG(3),cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),            & 
& cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),     & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),           & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),             & 
& cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplAhHpmcHpm(3,2,2),cplAhHpmcVWm(3,2),cplAhSdcSd(3,6,6),& 
& cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),         & 
& cplAhSvReSvRe(3,6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(2),ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(2),ratPSd(6),ratPSe(6),              & 
& ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Ah_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhAh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhAhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZA,cplAhAhAh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,kap,vd,vu,vS,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvImT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZA,cplAhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZA,cplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvReSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVR,             & 
& ZA,cplAhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingAhHpmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev = Sqrt(vd**2 + vu**2)
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_P_S_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)+cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_P_P_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)-cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)+cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_P_P_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)-cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)+cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_P_P_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)-cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 6
rHB_P_S_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)+cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_P_P_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)-cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
!----------------------------------------------------
! Pseudo Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 2
ratPCha(i2) = cplcChaChaAhL(i2,i2,i1)*1._dp*vev/MCha(i2) 
End Do 
Do i2=1, 3
ratPFd(i2) = cplcFdFdAhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratPFe(i2) = cplcFeFeAhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratPFu(i2) = cplcFuFuAhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 2
ratPHpm(i2) = 0.5_dp*cplAhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
Do i2=1, 6
ratPSd(i2) = 0.5_dp*cplAhSdcSd(i1,i2,i2)*vev/MSd2(i2) 
End Do 
Do i2=1, 6
ratPSe(i2) = 0.5_dp*cplAhSecSe(i1,i2,i2)*vev/MSe2(i2) 
End Do 
Do i2=1, 6
ratPSu(i2) = 0.5_dp*cplAhSucSu(i1,i2,i2)*vev/MSu2(i2) 
End Do 
ratPVWm = 0._dp 
If (HigherOrderDiboson) Then 
  gNLO = g3 
Else  
  gNLO = -1._dp 
End if 
Call CoupPseudoHiggsToPhoton(m_in,i1,ratPCha,ratPFd,ratPFe,ratPFu,ratPHpm,            & 
& ratPSd,ratPSe,ratPSu,ratPVWm,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

cplPseudoHiggsPP(i1) = 2._dp*coup*Alpha 
CoupAPP(i1) = 2._dp*coup 
Call CoupHiggsToPhotonSM(m_in,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

ratioPPP(i1) = Abs(cplPseudoHiggsPP(i1)/(coup*oo4pi*(1._dp-mW2/mZ2)*g2**2)) 
  gNLO = -1._dp 
Call CoupPseudoHiggsToGluon(m_in,i1,ratPFd,ratPFu,ratPSd,ratPSu,MFd,MFu,              & 
& MSd,MSu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(97._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = (171.544_dp +  5._dp*Log(m_in**2/mf_u(3)**2))*g3**4/(4._dp*Pi**2)**2 
  NNNLOqcd = 0._dp 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
cplPseudoHiggsGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupAGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,MSd,MSu,gNLO,coup)

coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
ratioPGG(i1) = Abs(cplPseudoHiggsGG(i1)/(coup*AlphaSQ)) 

If (i1.eq.2) Then 
CPL_A_A_Z = 0._dp 
End if 
cplAhAhAh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhAhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZA,cplAhAhAh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,kap,vd,vu,vS,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvImT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZA,cplAhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZA,cplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvReSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVR,             & 
& ZA,cplAhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingAhHpmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Ah_decays_2B
 
Subroutine CouplingsFor_Su_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,cplcChaFdcSuR,      & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSucSu(3,6,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplcChaFdcSuL(2,3,6),       & 
& cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(3,6,6),            & 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVZ(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Su_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,lam,Yu,Tu,vd,vu,vS,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,             & 
& cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSucVWmT(gt1,gt2,g2,ZD,ZU,cplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


cplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZT(gt1,gt2,g1,g2,ZU,TW,cplSucSuVZ(gt1,gt2))

 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Su_decays_2B
 
Subroutine CouplingsFor_Sd_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,        & 
& cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVZ,cplSucSdVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSdcSd(3,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFdcSdL(5,3,6),        & 
& cplChiFdcSdR(5,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplhhSdcSd(3,6,6),             & 
& cplHpmSucSd(2,6,6),cplSdcSdVZ(6,6),cplSucSdVWm(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Yd,Td,lam,vd,vu,vS,ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSucSd = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSucSdT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,              & 
& cplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZT(gt1,gt2,g1,g2,ZD,TW,cplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


cplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSdVWmT(gt1,gt2,g2,ZD,ZU,cplSucSdVWm(gt1,gt2))

 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sd_decays_2B
 
Subroutine CouplingsFor_Se_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,        & 
& cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSecSe(3,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiFecSeL(5,3,6),        & 
& cplChiFecSeR(5,3,6),cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),       & 
& cplSecSeVZ(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Se_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,Ye,Te,lam,vd,vu,vS,ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvImcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvImcSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVI,            & 
& ZE,ZP,cplHpmSvImcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvRecSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvRecSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVR,            & 
& ZE,ZP,cplHpmSvRecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecSeVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSeVZT(gt1,gt2,g1,g2,ZE,TW,cplSecSeVZ(gt1,gt2))

 End Do 
End Do 


cplSvImcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImcSeVWmT(gt1,gt2,g2,ZVI,ZE,cplSvImcSeVWm(gt1,gt2))

 End Do 
End Do 


cplSvRecSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvRecSeVWmT(gt1,gt2,g2,ZVR,ZE,cplSvRecSeVWm(gt1,gt2))

 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Se_decays_2B
 
Subroutine CouplingsFor_Glu_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Glu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Glu_decays_2B
 
Subroutine CouplingsFor_Cha_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Cha_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFvSeL = 0._dp 
cplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingcChaFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplcChaFvSeL(gt1,gt2,gt3)     & 
& ,cplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Cha_decays_2B
 
Subroutine CouplingsFor_Chi_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,     & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),  & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),       & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),           & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Chi_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Chi_decays_2B
 
Subroutine CouplingsFor_Fv_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplFvFvAhL,cplFvFvAhR,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,         & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),          & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_2B
 
Subroutine CouplingsFor_SvRe_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,          & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChaAhL,cplcChaChaAhR,               & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaFeSvImL,cplcChaFeSvImR, & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvRe,cplhhSvReSvRe,               & 
& cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVZ,cplSvRecSeVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),  & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),   & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),       & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),           & 
& cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),     & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6),             & 
& cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSvImSvReVZ(6,6),       & 
& cplSvRecSeVWm(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_SvRe_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZA,cplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvReSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVR,             & 
& ZA,cplAhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZH,cplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvReSvReT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVR,ZH,cplhhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvRecSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvRecSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVR,            & 
& ZE,ZP,cplHpmSvRecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvRecHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingSeSvRecHpmT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVR,            & 
& ZE,ZP,cplSeSvRecHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvRecVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSeSvRecVWmT(gt1,gt2,g2,ZVR,ZE,cplSeSvRecVWm(gt1,gt2))

 End Do 
End Do 


cplSvImSvReVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImSvReVZT(gt1,gt2,g1,g2,ZVI,ZVR,TW,cplSvImSvReVZ(gt1,gt2))

 End Do 
End Do 


cplSvRecSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvRecSeVWmT(gt1,gt2,g2,ZVR,ZE,cplSvRecSeVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_SvRe_decays_3B
 
Subroutine CouplingsFor_SvIm_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,          & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChaAhL,cplcChaChaAhR,               & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaFeSvImL,cplcChaFeSvImR, & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhSvImSvIm,cplhhSvImSvRe,               & 
& cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImcSeVWm,cplSvImSvReVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),  & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),               & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),   & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),       & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),           & 
& cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),     & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhSvImSvIm(3,6,6),cplhhSvImSvRe(3,6,6),             & 
& cplHpmSvImcSe(2,6,6),cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSvImcSeVWm(6,6),       & 
& cplSvImSvReVZ(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_SvIm_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvImT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZA,cplAhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZA,cplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvImT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZH,cplhhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZH,cplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvImcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvImcSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVI,            & 
& ZE,ZP,cplHpmSvImcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvImcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingSeSvImcHpmT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVI,            & 
& ZE,ZP,cplSeSvImcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvImcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSeSvImcVWmT(gt1,gt2,g2,ZVI,ZE,cplSeSvImcVWm(gt1,gt2))

 End Do 
End Do 


cplSvImSvReVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImSvReVZT(gt1,gt2,g1,g2,ZVI,ZVR,TW,cplSvImSvReVZ(gt1,gt2))

 End Do 
End Do 


cplSvImcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImcSeVWmT(gt1,gt2,g2,ZVI,ZE,cplSvImcSeVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_SvIm_decays_3B
 
Subroutine CouplingsFor_Hpm_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhcHpmVWm,cplAhHpmcHpm,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,   & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,              & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,              & 
& cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,            & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhcHpmVWm,cplhhHpmcHpm,cplHpmcHpmVZ,cplSdcHpmcSu,cplSeSvImcHpm,        & 
& cplSeSvRecHpm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhcHpmVWm(3,2),cplAhHpmcHpm(3,2,2),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),      & 
& cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),   & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),     & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),       & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),             & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),           & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),       & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),           & 
& cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),   & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),               & 
& cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6), & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVWm(3,2),               & 
& cplhhHpmcHpm(3,2,2),cplHpmcHpmVZ(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),        & 
& cplSeSvRecHpm(6,6,2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hpm_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,kap,vd,vu,vS,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,vd,vu,vS,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,             & 
& cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvImcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingSeSvImcHpmT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVI,            & 
& ZE,ZP,cplSeSvImcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSeSvRecHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingSeSvRecHpmT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVR,            & 
& ZE,ZP,cplSeSvRecHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingAhcHpmVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplinghhcHpmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHpmcHpmVZT(gt1,gt2,g1,g2,ZP,TW,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)   & 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)   & 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3)      & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFvSeL = 0._dp 
cplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingcChaFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplcChaFvSeL(gt1,gt2,gt3)     & 
& ,cplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hpm_decays_3B
 
Subroutine CouplingsFor_hh_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplcChaChaAhL,cplcChaChaAhR,             & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,          & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,         & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,        & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhAhhh(3,3,3),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),& 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),           & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),           & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),   & 
& cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),       & 
& cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),           & 
& cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),       & 
& cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),     & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),     & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6), & 
& cplGluFucSuR(3,6),cplhhcHpmVWm(3,2),cplhhhhhh(3,3,3),cplhhHpmcHpm(3,2,2),              & 
& cplhhSdcSd(3,6,6),cplhhSecSe(3,6,6),cplhhSucSu(3,6,6),cplhhSvImSvIm(3,6,6),            & 
& cplhhSvImSvRe(3,6,6),cplhhSvReSvRe(3,6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(2),ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(2),ratPSd(6),ratPSe(6),              & 
& ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
!rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
!rHB_S_VWm(i1) = Abs(-0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2) 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 6
rHB_S_S_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)+cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_S_P_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)-cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhhhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,vd,vu,vS,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Yd,Td,lam,vd,vu,vS,ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,Ye,Te,lam,vd,vu,vS,ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,lam,Yu,Tu,vd,vu,vS,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvImT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVI,ZH,cplhhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZH,cplhhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvReSvReT(gt1,gt2,gt3,g1,g2,lam,kap,lamN,TLN,Yv,Tv,vd,vu,              & 
& vS,ZVR,ZH,cplhhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplinghhcHpmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_3B
 
Subroutine CouplingsFor_Ah_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhAhAh,cplAhAhhh,cplAhcHpmVWm,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,     & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,   & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,              & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,         & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,               & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,               & 
& cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhAhAh(3,3,3),cplAhAhhh(3,3,3),cplAhcHpmVWm(3,2),cplAhhhhh(3,3,3),cplAhhhVZ(3,3),  & 
& cplAhHpmcHpm(3,2,2),cplAhSdcSd(3,6,6),cplAhSecSe(3,6,6),cplAhSucSu(3,6,6),             & 
& cplAhSvImSvIm(3,6,6),cplAhSvImSvRe(3,6,6),cplAhSvReSvRe(3,6,6),cplcChaChaAhL(2,2,3),   & 
& cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,3),         & 
& cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),    & 
& cplcFeChaSvReR(3,2,6),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),        & 
& cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFdcHpmL(3,3,2),             & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),         & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),        & 
& cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),     & 
& cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),         & 
& cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),      & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),    & 
& cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),               & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6), & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(2),ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(2),ratPSd(6),ratPSe(6),              & 
& ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Ah_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_P_S_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)+cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_P_P_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)-cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)+cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_P_P_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)-cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)+cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_P_P_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)-cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 6
rHB_P_S_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)+cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_P_P_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)-cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhAhAh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhAhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZA,cplAhAhAh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhAhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,vd,vu,vS,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,kap,vd,vu,vS,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvIm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvImT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZA,cplAhSvImSvIm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvImSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvImSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVI,             & 
& ZVR,ZA,cplAhSvImSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvReSvRe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvReSvReT(gt1,gt2,gt3,lam,kap,lamN,TLN,Yv,Tv,vd,vu,vS,ZVR,             & 
& ZA,cplAhSvReSvRe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhcHpmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingAhcHpmVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Ah_decays_3B
 
Subroutine CouplingsFor_Su_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFuAhL,cplcFuFuAhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChiAhL,cplChiChiAhR,     & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,       & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFvAhL,cplFvFvAhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSucSu(3,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,3),     & 
& cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),    & 
& cplcChaChiVWmR(2,5),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFdChaSuL(3,2,6),     & 
& cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFdFdAhL(3,3,3),        & 
& cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),            & 
& cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,6),           & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,5,6), & 
& cplcFeChiSeR(3,5,6),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),          & 
& cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),              & 
& cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuChiSuL(3,5,6),           & 
& cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFuAhL(3,3,3),      & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),              & 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChiAhL(5,5,3),   & 
& cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),cplChiChiVZL(5,5),         & 
& cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),         & 
& cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),      & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),    & 
& cplFvChacSeR(6,2,6),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),             & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6), & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(3,6,6),cplSdcHpmcSu(6,2,6),             & 
& cplSdcSucVWm(6,6),cplSucSuVZ(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Su_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,lam,Yu,Tu,vd,vu,vS,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,             & 
& cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSucVWmT(gt1,gt2,g2,ZD,ZU,cplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


cplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZT(gt1,gt2,g1,g2,ZU,TW,cplSucSuVZ(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)   & 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)   & 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3)      & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Su_decays_3B
 
Subroutine CouplingsFor_Sd_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSdcSd,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,       & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChiSeL,          & 
& cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,        & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,         & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,          & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,      & 
& cplGluFucSuL,cplGluFucSuR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVZ,cplSucSdVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSdcSd(3,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,3),     & 
& cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFdcSuL(2,3,6),   & 
& cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),& 
& cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFdChaSuL(3,2,6),     & 
& cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFdFdAhL(3,3,3),        & 
& cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdGluSdL(3,6),            & 
& cplcFdGluSdR(3,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),cplcFeFeAhL(3,3,3),          & 
& cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),         & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),         & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),              & 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),   & 
& cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),       & 
& cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),               & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6), & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSdcSd(3,6,6),cplHpmSucSd(2,6,6),              & 
& cplSdcSdVZ(6,6),cplSucSdVWm(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Yd,Td,lam,vd,vu,vS,ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSucSd = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSucSdT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,              & 
& cplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZT(gt1,gt2,g1,g2,ZD,TW,cplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


cplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSdVWmT(gt1,gt2,g2,ZD,ZU,cplSucSdVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)   & 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)   & 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFvSeL = 0._dp 
cplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingcChaFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplcChaFvSeL(gt1,gt2,gt3)     & 
& ,cplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sd_decays_3B
 
Subroutine CouplingsFor_Se_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplAhSecSe,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,        & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeChaSvImL,            & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,               & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,    & 
& cplSecSeVZ,cplSvImcSeVWm,cplSvRecSeVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSecSe(3,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,3),     & 
& cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaFdcSuL(2,3,6),   & 
& cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),& 
& cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFdChiSdL(3,5,6),     & 
& cplcFdChiSdR(3,5,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),          & 
& cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeChaSvImL(3,2,6),            & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,5,6), & 
& cplcFeChiSeR(3,5,6),cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),          & 
& cplcFeFehhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),              & 
& cplcFeFvHpmR(3,6,2),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuFdcHpmL(3,3,2),      & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,3),         & 
& cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),      & 
& cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),       & 
& cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),      & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),             & 
& cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplhhSecSe(3,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplSecSeVZ(6,6),           & 
& cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Se_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplAhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,Ye,Te,lam,vd,vu,vS,ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvImcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvImcSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVI,            & 
& ZE,ZP,cplHpmSvImcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvRecSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvRecSeT(gt1,gt2,gt3,g2,Ye,Te,lam,lamN,Yv,Tv,vd,vu,vS,ZVR,            & 
& ZE,ZP,cplHpmSvRecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecSeVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSeVZT(gt1,gt2,g1,g2,ZE,TW,cplSecSeVZ(gt1,gt2))

 End Do 
End Do 


cplSvImcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImcSeVWmT(gt1,gt2,g2,ZVI,ZE,cplSvImcSeVWm(gt1,gt2))

 End Do 
End Do 


cplSvRecSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvRecSeVWmT(gt1,gt2,g2,ZVR,ZE,cplSvRecSeVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)   & 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)   & 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3)      & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFvSeL = 0._dp 
cplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingcChaFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplcChaFvSeL(gt1,gt2,gt3)     & 
& ,cplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Se_decays_3B
 
Subroutine CouplingsFor_Glu_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplcChacFuSdL,cplcChacFuSdR,cplcChaFdcSuL,cplcChaFdcSuR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuGluSuL,cplcFuGluSuR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),  & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),           & 
& cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),           & 
& cplChiFdcSdL(5,3,6),cplChiFdcSdR(5,3,6),cplChiFucSuL(5,3,6),cplChiFucSuR(5,3,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Glu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)   & 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Glu_decays_3B
 
Subroutine CouplingsFor_Cha_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,               & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,              & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,   & 
& cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplGluFdcSdL,cplGluFdcSdR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),  & 
& cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6), & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),             & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),& 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),   & 
& cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFvSvImL(5,6,6),      & 
& cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),    & 
& cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),               & 
& cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Cha_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFvSeL = 0._dp 
cplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingcChaFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplcChaFvSeL(gt1,gt2,gt3)     & 
& ,cplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Cha_decays_3B
 
Subroutine CouplingsFor_Chi_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,        & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvImL,       & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,              & 
& cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,     & 
& cplFvChacSeR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,5,2),cplcChaChiHpmR(2,5,2),     & 
& cplcChaChiVWmL(2,5),cplcChaChiVWmR(2,5),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),       & 
& cplcFdChiSdL(3,5,6),cplcFdChiSdR(3,5,6),cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),         & 
& cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuChiSuL(3,5,6),cplcFuChiSuR(3,5,6),           & 
& cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),& 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),   & 
& cplChiChacVWmR(5,2),cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),       & 
& cplChiChihhR(5,5,3),cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFdcSdL(5,3,6),           & 
& cplChiFdcSdR(5,3,6),cplChiFecSeL(5,3,6),cplChiFecSeR(5,3,6),cplChiFucSuL(5,3,6),       & 
& cplChiFucSuR(5,3,6),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),cplChiFvSvReL(5,6,6),    & 
& cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFvAhL(6,6,3),        & 
& cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Chi_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)   & 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)   & 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)   & 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)   & 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3)      & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 5
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Chi_decays_3B
 
Subroutine CouplingsFor_Fv_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvIminput,        & 
& MSvIm2input,MSvReinput,MSvRe2input,MVWminput,MVWm2input,MVZinput,MVZ2input,            & 
& pGinput,TWinput,UMinput,UPinput,UVinput,vinput,ZAinput,ZDinput,ZDLinput,               & 
& ZDRinput,ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,           & 
& ZURinput,ZVIinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,         & 
& Ydinput,Yeinput,laminput,kapinput,lamNinput,Yuinput,Yvinput,Tdinput,Teinput,           & 
& Tlaminput,Tkinput,TLNinput,Tuinput,Tvinput,mq2input,ml2input,mHd2input,mHu2input,      & 
& md2input,mu2input,me2input,mv2input,ms2input,M1input,M2input,M3input,vdinput,          & 
& vuinput,vSinput,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaFvSeL,cplcChaFvSeR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,              & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,      & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,               & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,ms2input,vdinput,vuinput,vSinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,kapinput,lamNinput(3,3),Yuinput(3,3),              & 
& Yvinput(3,3),Tdinput(3,3),Teinput(3,3),Tlaminput,Tkinput,TLNinput(3,3),Tuinput(3,3),   & 
& Tvinput(3,3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),me2input(3,3),    & 
& mv2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(3),MAh2input(3),MChainput(2),MCha2input(2),MChiinput(5),MChi2input(5),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(6),MFv2input(6),MGluinput,MGlu2input,Mhhinput(3),Mhh2input(3),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvIminput(6),MSvIm2input(6),MSvReinput(6),MSvRe2input(6),MVWminput,      & 
& MVWm2input,MVZinput,MVZ2input,TWinput,vinput,ZAinput(3,3),ZHinput(3,3),ZPinput(2,2),   & 
& ZZinput(2,2),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),UVinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZNinput(5,5),ZUinput(6,6),      & 
& ZULinput(3,3),ZURinput(3,3),ZVIinput(6,6),ZVRinput(6,6),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2,vd,vu,vS

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),Td(3,3),Te(3,3),Tlam,               & 
& Tk,TLN(3,3),Tu(3,3),Tv(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),              & 
& mv2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChaChaAhL(2,2,3),cplcChaChaAhR(2,2,3),cplcChaChahhL(2,2,3),cplcChaChahhR(2,2,3),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),         & 
& cplcFdFdAhL(3,3,3),cplcFdFdAhR(3,3,3),cplcFdFdhhL(3,3,3),cplcFdFdhhR(3,3,3),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),             & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,5,6),cplcFeChiSeR(3,5,6),   & 
& cplcFeFeAhL(3,3,3),cplcFeFeAhR(3,3,3),cplcFeFehhL(3,3,3),cplcFeFehhR(3,3,3),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFuAhL(3,3,3),cplcFuFuAhR(3,3,3),             & 
& cplcFuFuhhL(3,3,3),cplcFuFuhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplChiChacHpmL(5,2,2),cplChiChacHpmR(5,2,2),cplChiChacVWmL(5,2),cplChiChacVWmR(5,2),   & 
& cplChiChiAhL(5,5,3),cplChiChiAhR(5,5,3),cplChiChihhL(5,5,3),cplChiChihhR(5,5,3),       & 
& cplChiChiVZL(5,5),cplChiChiVZR(5,5),cplChiFvSvImL(5,6,6),cplChiFvSvImR(5,6,6),         & 
& cplChiFvSvReL(5,6,6),cplChiFvSvReR(5,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),     & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvAhL(6,6,3),cplFvFvAhR(6,6,3),cplFvFvhhL(6,6,3),cplFvFvhhR(6,6,3),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
kap = kapinput 
lamN = lamNinput 
Yu = Yuinput 
Yv = Yvinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tk = Tkinput 
TLN = TLNinput 
Tu = Tuinput 
Tv = Tvinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mv2 = mv2input 
ms2 = ms2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
Qin=sqrt(getRenormalizationScale()) 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,Td,Te,Tlam,              & 
& Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,M1,M2,M3,vd,vu,vS,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,             & 
& ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,vS,g1,g2,g3,Yd,Ye,               & 
& lam,kap,lamN,Yu,Yv,Td,Te,Tlam,Tk,TLN,Tu,Tv,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,ms2,M1,M2,M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
UV = UVinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZVI = ZVIinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSvIm = MSvIminput 
MSvIm2 = MSvIm2input 
MSvRe = MSvReinput 
MSvRe2 = MSvRe2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
v = vinput 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)      & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvAhT(gt1,gt2,gt3,lamN,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 3
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)      & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,lamN,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)   & 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 3
Call CouplingFvFvhhT(gt1,gt2,gt3,lamN,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3)      & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFvSeL = 0._dp 
cplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingcChaFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UV,UM,UP,cplcChaFvSeL(gt1,gt2,gt3)     & 
& ,cplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,UM,UP,TW,cplcChaChaVZL(gt1,gt2),cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingChiChiVZT(gt1,gt2,g1,g2,ZN,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZT(gt1,gt2,g1,g2,UV,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_seesaw1nmssm
