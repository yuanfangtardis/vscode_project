! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:29 on 20.8.2017   
! ----------------------------------------------------------------------  
 
 
Module Model_Data_NInvSeesaw 
 
Use Control 
Use Settings 
Use LoopFunctions 
Logical, Save :: CalcLoopDecay_LoopInducedOnly=.False.
 Logical, Save :: CalcLoopDecay_hh=.True.
Logical, Save :: CalcLoopDecay_Ah=.True.
Logical, Save :: CalcLoopDecay_Hpm=.True.
Logical, Save :: CalcLoopDecay_Sd=.True.
Logical, Save :: CalcLoopDecay_Su=.True.
Logical, Save :: CalcLoopDecay_Se=.True.
Logical, Save :: CalcLoopDecay_SvIm=.True.
Logical, Save :: CalcLoopDecay_SvRe=.True.
Logical, Save :: CalcLoopDecay_Chi=.True.
Logical, Save :: CalcLoopDecay_Cha=.True.
Logical, Save :: CalcLoopDecay_Glu=.True.
Logical, Save :: CalcLoopDecay_Fv=.True.
Logical, Save :: Calc3BodyDecay_hh=.True.
Logical, Save :: Calc3BodyDecay_Ah=.True.
Logical, Save :: Calc3BodyDecay_Hpm=.True.
Logical, Save :: Calc3BodyDecay_Sd=.True.
Logical, Save :: Calc3BodyDecay_Su=.True.
Logical, Save :: Calc3BodyDecay_Se=.True.
Logical, Save :: Calc3BodyDecay_SvIm=.True.
Logical, Save :: Calc3BodyDecay_SvRe=.True.
Logical, Save :: Calc3BodyDecay_Chi=.True.
Logical, Save :: Calc3BodyDecay_Cha=.True.
Logical, Save :: Calc3BodyDecay_Glu=.True.
Logical, Save :: Calc3BodyDecay_Fv=.True.
Real(dp) :: tau_pi0=0.0000000000000000852_dp, mass_pi0=0.13498_dp
Real(dp) :: tau_pip=0.000000026_dp, mass_pip=0.13957_dp
Real(dp) :: tau_rho0=0.00000000000000000000000441_dp, mass_rho0=0.77549_dp
Real(dp) :: tau_D0=0.00000000000041_dp, mass_D0=1.86486_dp
Real(dp) :: tau_Dp=0.00000000000104_dp, mass_Dp=1.86926_dp
Real(dp) :: tau_DSp=0.0000000000005_dp, mass_DSp=1.96849_dp
Real(dp) :: tau_DSsp=0, mass_DSsp=2.1123_dp
Real(dp) :: tau_eta=0.000000000000000000506_dp, mass_eta=0.54785_dp
Real(dp) :: tau_etap=0.00000000000000000000331_dp, mass_etap=0.95778_dp
Real(dp) :: tau_omega=0.0000000000000000000000775_dp, mass_omega=0.78265_dp
Real(dp) :: tau_phi=0.000000000000000000000154_dp, mass_phi=1.01946_dp
Real(dp) :: tau_KL0=0.0000000512_dp, mass_KL0=0
Real(dp) :: tau_KS0=0.00000000009_dp, mass_KS0=0
Real(dp) :: tau_K0=0, mass_K0=0.49761_dp
Real(dp) :: tau_Kp=0.0000000124_dp, mass_Kp=0.49368_dp
Real(dp) :: tau_B0d=0.00000000000152_dp, mass_B0d=5.27958_dp
Real(dp) :: tau_B0s=0.0000000000015_dp, mass_B0s=5.36677_dp
Real(dp) :: tau_Bp=0.00000000000164_dp, mass_Bp=5.27925_dp
Real(dp) :: tau_B0c=0.0000000000000000000000143_dp, mass_B0c=5.3252_dp
Real(dp) :: tau_Bpc=0.0000000000000000000000143_dp, mass_Bpc=5.3252_dp
Real(dp) :: tau_Bcp=0.000000000000454_dp, mass_Bcp=6.277_dp
Real(dp) :: tau_K0c=0.0000000000000000000000142_dp, mass_K0c=0.8959_dp
Real(dp) :: tau_Kpc=0.000000000000000000000013_dp, mass_Kpc=0.8917_dp
Real(dp) :: tau_etac=0.0000000000000000000000222_dp, mass_etac=2.981_dp
Real(dp) :: tau_JPsi=0.00000000000000000000000708_dp, mass_JPSi=3096.92_dp
Real(dp) :: tau_Ups=0.0000000000000000000000121_dp, mass_Ups=9.4603_dp
Real(dp) :: f_k_CONST=0.1598_dp
Real(dp) :: f_Kp_CONST=0.156_dp
Real(dp) :: h_k_CONST=0
Real(dp) :: f_pi_CONST=0.118_dp
Real(dp) :: f_B0d_CONST=0.19_dp
Real(dp) :: f_B0s_CONST=0.227_dp
Real(dp) :: f_Bp_CONST=0.234_dp
Real(dp) :: f_eta_q_CONST=0.13_dp
Real(dp) :: f_eta_s_CONST=0
Real(dp) :: h_eta_q_CONST=0
Real(dp) :: h_eta_s_CONST=0
Real(dp) :: f_etap_CONST=0.172_dp
Real(dp) :: f_rho_CONST=0.22_dp
Real(dp) :: h_rho_CONST=0
Real(dp) :: f_omega_q_CONST=0
Real(dp) :: f_omega_s_CONST=0
Real(dp) :: h_omega_q_CONST=0
Real(dp) :: h_omega_s_CONST=0
Real(dp) :: f_Dp_CONST=0.256_dp
Real(dp) :: f_D_CONST=0.248_dp
Real(dp) :: f_Dsp_CONST=0.256_dp
Complex(dp) :: coeffC7sm = 0._dp
Complex(dp) :: coeffC7 = 0._dp
Complex(dp) :: coeffC7p = 0._dp
Complex(dp) :: coeffC7NP = 0._dp
Complex(dp) :: coeffC7pNP = 0._dp
Complex(dp) :: coeffC8sm = 0._dp
Complex(dp) :: coeffC8 = 0._dp
Complex(dp) :: coeffC8p = 0._dp
Complex(dp) :: coeffC8NP = 0._dp
Complex(dp) :: coeffC8pNP = 0._dp
Complex(dp) :: coeffC9eeSM = 0._dp
Complex(dp) :: coeffC9ee = 0._dp
Complex(dp) :: coeffC9Pee = 0._dp
Complex(dp) :: coeffC9eeNP = 0._dp
Complex(dp) :: coeffC9PeeNP = 0._dp
Complex(dp) :: coeffC10eeSM = 0._dp
Complex(dp) :: coeffC10ee = 0._dp
Complex(dp) :: coeffC10Pee = 0._dp
Complex(dp) :: coeffC10eeNP = 0._dp
Complex(dp) :: coeffC10PeeNP = 0._dp
Complex(dp) :: coeffC9mumuSM = 0._dp
Complex(dp) :: coeffC9mumu = 0._dp
Complex(dp) :: coeffC9Pmumu = 0._dp
Complex(dp) :: coeffC9mumuNP = 0._dp
Complex(dp) :: coeffC9PmumuNP = 0._dp
Complex(dp) :: coeffC10mumuSM = 0._dp
Complex(dp) :: coeffC10mumu = 0._dp
Complex(dp) :: coeffC10Pmumu = 0._dp
Complex(dp) :: coeffC10mumuNP = 0._dp
Complex(dp) :: coeffC10PmumuNP = 0._dp
Complex(dp) :: coeffCLnu1nu1SM = 0._dp
Complex(dp) :: coeffCLnu1nu1 = 0._dp
Complex(dp) :: coeffCLPnu1nu1 = 0._dp
Complex(dp) :: coeffCLnu1nu1NP = 0._dp
Complex(dp) :: coeffCLPnu1nu1NP = 0._dp
Complex(dp) :: coeffCLnu2nu2SM = 0._dp
Complex(dp) :: coeffCLnu2nu2 = 0._dp
Complex(dp) :: coeffCLPnu2nu2 = 0._dp
Complex(dp) :: coeffCLnu2nu2NP = 0._dp
Complex(dp) :: coeffCLPnu2nu2NP = 0._dp
Complex(dp) :: coeffCLnu3nu3SM = 0._dp
Complex(dp) :: coeffCLnu3nu3 = 0._dp
Complex(dp) :: coeffCLPnu3nu3 = 0._dp
Complex(dp) :: coeffCLnu3nu3NP = 0._dp
Complex(dp) :: coeffCLPnu3nu3NP = 0._dp
Complex(dp) :: coeffCRnu1nu1SM = 0._dp
Complex(dp) :: coeffCRnu1nu1 = 0._dp
Complex(dp) :: coeffCRPnu1nu1 = 0._dp
Complex(dp) :: coeffCRnu1nu1NP = 0._dp
Complex(dp) :: coeffCRPnu1nu1NP = 0._dp
Complex(dp) :: coeffCRnu2nu2SM = 0._dp
Complex(dp) :: coeffCRnu2nu2 = 0._dp
Complex(dp) :: coeffCRPnu2nu2 = 0._dp
Complex(dp) :: coeffCRnu2nu2NP = 0._dp
Complex(dp) :: coeffCRPnu2nu2NP = 0._dp
Complex(dp) :: coeffCRnu3nu3SM = 0._dp
Complex(dp) :: coeffCRnu3nu3 = 0._dp
Complex(dp) :: coeffCRPnu3nu3 = 0._dp
Complex(dp) :: coeffCRnu3nu3NP = 0._dp
Complex(dp) :: coeffCRPnu3nu3NP = 0._dp
Complex(dp) :: coeffKK_SLL = 0._dp
Complex(dp) :: coeffKK_SRR = 0._dp
Complex(dp) :: coeffKK_SLR = 0._dp
Complex(dp) :: coeffKK_VLL = 0._dp
Complex(dp) :: coeffKK_VRR = 0._dp
Complex(dp) :: coeffKK_VLR = 0._dp
Complex(dp) :: coeffKK_TLL = 0._dp
Complex(dp) :: coeffKK_TRR = 0._dp
Complex(dp) :: coeffBB_SLL = 0._dp
Complex(dp) :: coeffBB_SRR = 0._dp
Complex(dp) :: coeffBB_SLR = 0._dp
Complex(dp) :: coeffBB_VLL = 0._dp
Complex(dp) :: coeffBB_VRR = 0._dp
Complex(dp) :: coeffBB_VLR = 0._dp
Complex(dp) :: coeffBB_TLL = 0._dp
Complex(dp) :: coeffBB_TRR = 0._dp
Complex(dp) :: coeffBsBs_SLL = 0._dp
Complex(dp) :: coeffBsBs_SRR = 0._dp
Complex(dp) :: coeffBsBs_SLR = 0._dp
Complex(dp) :: coeffBsBs_VLL = 0._dp
Complex(dp) :: coeffBsBs_VRR = 0._dp
Complex(dp) :: coeffBsBs_VLR = 0._dp
Complex(dp) :: coeffBsBs_TLL = 0._dp
Complex(dp) :: coeffBsBs_TRR = 0._dp
Complex(dp) :: coeffKK_SLLNP = 0._dp
Complex(dp) :: coeffKK_SRRNP = 0._dp
Complex(dp) :: coeffKK_SLRNP = 0._dp
Complex(dp) :: coeffKK_VLLNP = 0._dp
Complex(dp) :: coeffKK_VRRNP = 0._dp
Complex(dp) :: coeffKK_VLRNP = 0._dp
Complex(dp) :: coeffKK_TLLNP = 0._dp
Complex(dp) :: coeffKK_TRRNP = 0._dp
Complex(dp) :: coeffBB_SLLNP = 0._dp
Complex(dp) :: coeffBB_SRRNP = 0._dp
Complex(dp) :: coeffBB_SLRNP = 0._dp
Complex(dp) :: coeffBB_VLLNP = 0._dp
Complex(dp) :: coeffBB_VRRNP = 0._dp
Complex(dp) :: coeffBB_VLRNP = 0._dp
Complex(dp) :: coeffBB_TLLNP = 0._dp
Complex(dp) :: coeffBB_TRRNP = 0._dp
Complex(dp) :: coeffBsBs_SLLNP = 0._dp
Complex(dp) :: coeffBsBs_SRRNP = 0._dp
Complex(dp) :: coeffBsBs_SLRNP = 0._dp
Complex(dp) :: coeffBsBs_VLLNP = 0._dp
Complex(dp) :: coeffBsBs_VRRNP = 0._dp
Complex(dp) :: coeffBsBs_VLRNP = 0._dp
Complex(dp) :: coeffBsBs_TLLNP = 0._dp
Complex(dp) :: coeffBsBs_TRRNP = 0._dp
Complex(dp) :: coeffKK_SLLSM = 0._dp
Complex(dp) :: coeffKK_SRRSM = 0._dp
Complex(dp) :: coeffKK_SLRSM = 0._dp
Complex(dp) :: coeffKK_VLLSM = 0._dp
Complex(dp) :: coeffKK_VRRSM = 0._dp
Complex(dp) :: coeffKK_VLRSM = 0._dp
Complex(dp) :: coeffKK_TLLSM = 0._dp
Complex(dp) :: coeffKK_TRRSM = 0._dp
Complex(dp) :: coeffBB_SLLSM = 0._dp
Complex(dp) :: coeffBB_SRRSM = 0._dp
Complex(dp) :: coeffBB_SLRSM = 0._dp
Complex(dp) :: coeffBB_VLLSM = 0._dp
Complex(dp) :: coeffBB_VRRSM = 0._dp
Complex(dp) :: coeffBB_VLRSM = 0._dp
Complex(dp) :: coeffBB_TLLSM = 0._dp
Complex(dp) :: coeffBB_TRRSM = 0._dp
Complex(dp) :: coeffBsBs_SLLSM = 0._dp
Complex(dp) :: coeffBsBs_SRRSM = 0._dp
Complex(dp) :: coeffBsBs_SLRSM = 0._dp
Complex(dp) :: coeffBsBs_VLLSM = 0._dp
Complex(dp) :: coeffBsBs_VRRSM = 0._dp
Complex(dp) :: coeffBsBs_VLRSM = 0._dp
Complex(dp) :: coeffBsBs_TLLSM = 0._dp
Complex(dp) :: coeffBsBs_TRRSM = 0._dp
Real(dp) :: MW_SM 
Real(dp) :: Alpha_160, AlphaS_160, SinW2_160, sinW2_MZ 
Real(dp) :: mf_d_160(3), mf_u_160(3), mf_l_160(3), mf_d2_160(3), mf_u2_160(3), mf_l2_160(3) 
Real(dp) :: mf_d2_MZ(3), mf_u2_MZ(3), mf_l2_MZ(3) 
Complex(dp) :: CKM_160(3,3), CKM_MZ(3,3) 
Logical :: TransposedYukawa= .False. 
Logical :: KineticMixing = .True. 
Logical :: KineticMixingSave = .True. 
Logical :: WriteTreeLevelTadpoleSolutions = .False. 
Logical :: WriteHiggsDiphotonLoopContributions = .False. 
Logical :: WriteEffHiggsCouplingRatios = .False. 
Complex(dp) :: ZDOS_0(6, 6)
Complex(dp) :: ZDOS_p2(6, 6)
Complex(dp) :: ZVIOS_0(9, 9)
Complex(dp) :: ZVIOS_p2(9, 9)
Complex(dp) :: ZVROS_0(9, 9)
Complex(dp) :: ZVROS_p2(9, 9)
Complex(dp) :: ZUOS_0(6, 6)
Complex(dp) :: ZUOS_p2(6, 6)
Complex(dp) :: ZEOS_0(6, 6)
Complex(dp) :: ZEOS_p2(6, 6)
Real(dp) :: ZHOS_0(3, 3)
Real(dp) :: ZHOS_p2(3, 3)
Real(dp) :: ZAOS_0(3, 3)
Real(dp) :: ZAOS_p2(3, 3)
Real(dp) :: ZPOS_0(2, 2)
Real(dp) :: ZPOS_p2(2, 2)
Complex(dp) :: ZNOS_0(5, 5)
Complex(dp) :: ZNOS_p2(5, 5)
Complex(dp) :: UVOS_0(9, 9)
Complex(dp) :: UVOS_p2(9, 9)
Complex(dp) :: UMOS_0(2, 2)
Complex(dp) :: UMOS_p2(2, 2)
Complex(dp) :: UPOS_0(2, 2)
Complex(dp) :: UPOS_p2(2, 2)
Complex(dp) :: ZELOS_0(3, 3)
Complex(dp) :: ZELOS_p2(3, 3)
Complex(dp) :: ZEROS_0(3, 3)
Complex(dp) :: ZEROS_p2(3, 3)
Complex(dp) :: ZDLOS_0(3, 3)
Complex(dp) :: ZDLOS_p2(3, 3)
Complex(dp) :: ZDROS_0(3, 3)
Complex(dp) :: ZDROS_p2(3, 3)
Complex(dp) :: ZULOS_0(3, 3)
Complex(dp) :: ZULOS_p2(3, 3)
Complex(dp) :: ZUROS_0(3, 3)
Complex(dp) :: ZUROS_p2(3, 3)
Real(dp) :: mHd2Tree 
Real(dp) :: mHd21L 
Real(dp) :: mHd22L 
Real(dp) :: mHu2Tree 
Real(dp) :: mHu21L 
Real(dp) :: mHu22L 
Real(dp) :: ms2Tree 
Real(dp) :: ms21L 
Real(dp) :: ms22L 
Integer :: SolutionTadpoleNr = 1 
Character(len=15)::HighScaleModel
Real(dp) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp) :: g1IN,g2IN,g3IN,mHd2IN,mHu2IN,ms2IN

Complex(dp) :: YdIN(3,3),YeIN(3,3),lamIN,kapIN,lamNIN(3,3),YuIN(3,3),YvIN(3,3),MUXIN(3,3),           & 
& TdIN(3,3),TeIN(3,3),TlamIN,TkIN,TLNIN(3,3),TuIN(3,3),TvIN(3,3),BMUXIN(3,3),            & 
& mq2IN(3,3),ml2IN(3,3),md2IN(3,3),mu2IN(3,3),me2IN(3,3),mv2IN(3,3),mx2IN(3,3),          & 
& M1IN,M2IN,M3IN

Real(dp) :: g1MZ,g2MZ,g3MZ,mHd2MZ,mHu2MZ,ms2MZ

Complex(dp) :: YdMZ(3,3),YeMZ(3,3),lamMZ,kapMZ,lamNMZ(3,3),YuMZ(3,3),YvMZ(3,3),MUXMZ(3,3),           & 
& TdMZ(3,3),TeMZ(3,3),TlamMZ,TkMZ,TLNMZ(3,3),TuMZ(3,3),TvMZ(3,3),BMUXMZ(3,3),            & 
& mq2MZ(3,3),ml2MZ(3,3),md2MZ(3,3),mu2MZ(3,3),me2MZ(3,3),mv2MZ(3,3),mx2MZ(3,3),          & 
& M1MZ,M2MZ,M3MZ

Real(dp) :: g1GUT,g2GUT,g3GUT,mHd2GUT,mHu2GUT,ms2GUT

Complex(dp) :: YdGUT(3,3),YeGUT(3,3),lamGUT,kapGUT,lamNGUT(3,3),YuGUT(3,3),YvGUT(3,3),               & 
& MUXGUT(3,3),TdGUT(3,3),TeGUT(3,3),TlamGUT,TkGUT,TLNGUT(3,3),TuGUT(3,3),TvGUT(3,3),     & 
& BMUXGUT(3,3),mq2GUT(3,3),ml2GUT(3,3),md2GUT(3,3),mu2GUT(3,3),me2GUT(3,3),              & 
& mv2GUT(3,3),mx2GUT(3,3),M1GUT,M2GUT,M3GUT

Real(dp) :: MAh(3),MAh2(3),MCha(2),MCha2(2),MChi(5),MChi2(5),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MGlu,MGlu2,Mhh(3),Mhh2(3),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(9),MSvIm2(9),              & 
& MSvRe(9),MSvRe2(9),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(3,3),ZH(3,3),ZP(2,2),ZZ(2,2),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(9,9),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(5,5),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(9,9),ZVR(9,9),ZW(2,2)

Real(dp) :: vd,vu,vS

Real(dp) :: vdIN,vuIN,vSIN

Real(dp) :: vdFix,vuFix,vSFix

Real(dp) :: gPhh(3,2725),gThh(3),BRhh(3,2725),gPAh(3,2723),gTAh(3),BRAh(3,2723),gPHpm(2,2112),    & 
& gTHpm(2),BRHpm(2,2112),gPSd(6,2460),gTSd(6),BRSd(6,2460),gPSu(6,2460),gTSu(6),         & 
& BRSu(6,2460),gPSe(6,2703),gTSe(6),BRSe(6,2703),gPSvIm(9,3735),gTSvIm(9),               & 
& BRSvIm(9,3735),gPSvRe(9,3735),gTSvRe(9),BRSvRe(9,3735),gPChi(5,1031),gTChi(5),         & 
& BRChi(5,1031),gPCha(2,649),gTCha(2),BRCha(2,649),gPGlu(1,157),gTGlu,BRGlu(1,157),      & 
& gPFv(9,1461),gTFv(9),BRFv(9,1461)

Real(dp) :: gP1Lhh(3,407),gT1Lhh(3),BR1Lhh(3,407),gP1LAh(3,405),gT1LAh(3),BR1LAh(3,405),          & 
& gP1LHpm(2,204),gT1LHpm(2),BR1LHpm(2,204),gP1LSd(6,84),gT1LSd(6),BR1LSd(6,84),          & 
& gP1LSu(6,84),gT1LSu(6),BR1LSu(6,84),gP1LSe(6,111),gT1LSe(6),BR1LSe(6,111),             & 
& gP1LSvIm(9,189),gT1LSvIm(9),BR1LSvIm(9,189),gP1LSvRe(9,189),gT1LSvRe(9),               & 
& BR1LSvRe(9,189),gP1LChi(5,256),gT1LChi(5),BR1LChi(5,256),gP1LCha(2,168),               & 
& gT1LCha(2),BR1LCha(2,168),gP1LGlu(1,49),gT1LGlu,BR1LGlu(1,49),gP1LFv(9,171),           & 
& gT1LFv(9),BR1LFv(9,171)

Real(dp) :: ratioCha(3,2),ratioFd(3,3),ratioFe(3,3),ratioFu(3,3),ratioHpm(3,2),ratioSd(3,6),      & 
& ratioSe(3,6),ratioSu(3,6),ratioVWm(3)

Complex(dp) :: ratioGG(3),ratioPP(3)

Real(dp) :: ratioPCha(3,2),ratioPFd(3,3),ratioPFe(3,3),ratioPFu(3,3),ratioPHpm(3,2),              & 
& ratioPSd(3,6),ratioPSe(3,6),ratioPSu(3,6),ratioPVWm(3)

Complex(dp) :: ratioPGG(3),ratioPPP(3)

Real(dp) :: TanBetaQ
Real(dp) :: gForTadpoles(365)
Complex(dp) :: tForTadpoles(3)
Real(dp) :: g1_saveEP 
Real(dp) :: g2_saveEP 
Complex(dp) :: Yd_saveEP(3,3) 
Complex(dp) :: Ye_saveEP(3,3) 
Complex(dp) :: lamN_saveEP(3,3) 
Complex(dp) :: Yu_saveEP(3,3) 
Complex(dp) :: Yv_saveEP(3,3) 
Complex(dp) :: MUX_saveEP(3,3) 
Complex(dp) :: Td_saveEP(3,3) 
Complex(dp) :: Te_saveEP(3,3) 
Complex(dp) :: TLN_saveEP(3,3) 
Complex(dp) :: Tu_saveEP(3,3) 
Complex(dp) :: Tv_saveEP(3,3) 
Complex(dp) :: BMUX_saveEP(3,3) 
Complex(dp) :: mq2_saveEP(3,3) 
Complex(dp) :: ml2_saveEP(3,3) 
Complex(dp) :: md2_saveEP(3,3) 
Complex(dp) :: mu2_saveEP(3,3) 
Complex(dp) :: me2_saveEP(3,3) 
Complex(dp) :: mv2_saveEP(3,3) 
Complex(dp) :: mx2_saveEP(3,3) 
Logical :: RotateNegativeFermionMasses=.True. 
Logical,save::IgnoreNegativeMasses= .False.
Logical,save::IgnoreMuSignFlip= .False.
Logical,save::IgnoreNegativeMassesMZ= .False.
Logical,save::Write_WHIZARD= .False.
Integer,save::BoundaryCondition=1 
Logical,Save::MZ_input= .False. 
 
Real(dp) :: CS_Higgs_LHC(5,3,5) 
 
Real(dp) :: CS_PHiggs_LHC(5,3,5) 
 
Real (dp) :: MhhL(3), Mhh2L(3) 
Real (dp) :: Mhh_s(3), Mhh2_s(3) 
Real (dp) :: MAhL(3), MAh2L(3) 
Real (dp) :: MAh_s(3), MAh2_s(3) 
Real (dp) :: FineTuningResults(0) 
Real (dp) :: FineTuningResultsAllVEVs(0) 
Logical, Save :: OneLoopFT = .False. 
Logical, Save :: CalcFT = .True. 
Integer,save::YukawaScheme=1
Logical, save :: CheckSugraDetails(10) =.False. & 
                        &, SugraErrors(10) =.False. &
                        &, StrictUnification =.False. &
                        &, UseFixedScale =.False. &
                        &, UseFixedGUTScale =.False. 
Real(dp), save :: GUT_scale 
Real(dp) :: g3running 
Logical, save :: InputValueforg1 =.False. 
Logical, save :: InputValueforg2 =.False. 
Logical, save :: InputValueforg3 =.False. 
Logical, save :: InputValueforYd =.False. 
Logical, save :: InputValueforYe =.False. 
Logical, save :: InputValueforlam =.False. 
Logical, save :: InputValueforkap =.False. 
Logical, save :: InputValueforlamN =.False. 
Logical, save :: InputValueforYu =.False. 
Logical, save :: InputValueforYv =.False. 
Logical, save :: InputValueforMUX =.False. 
Logical, save :: InputValueforTd =.False. 
Logical, save :: InputValueforTe =.False. 
Logical, save :: InputValueforTlam =.False. 
Logical, save :: InputValueforTk =.False. 
Logical, save :: InputValueforTLN =.False. 
Logical, save :: InputValueforTu =.False. 
Logical, save :: InputValueforTv =.False. 
Logical, save :: InputValueforBMUX =.False. 
Logical, save :: InputValueformq2 =.False. 
Logical, save :: InputValueforml2 =.False. 
Logical, save :: InputValueformHd2 =.False. 
Logical, save :: InputValueformHu2 =.False. 
Logical, save :: InputValueformd2 =.False. 
Logical, save :: InputValueformu2 =.False. 
Logical, save :: InputValueforme2 =.False. 
Logical, save :: InputValueformv2 =.False. 
Logical, save :: InputValueforms2 =.False. 
Logical, save :: InputValueformx2 =.False. 
Logical, save :: InputValueforM1 =.False. 
Logical, save :: InputValueforM2 =.False. 
Logical, save :: InputValueforM3 =.False. 
Logical, save :: InputValueforvS =.False. 
Real (dp) :: vSM_Q 
Real(dp), save :: RXiG = 1._dp 
Real(dp), save :: RXiP = 1._dp 
Real(dp), save :: RXiWm = 1._dp 
Real(dp), save :: RXiZ = 1._dp 
Real(dp) :: nuMasses(9) 
Complex(dp) :: nuMixing(9,9) 
Complex(dp) :: temporaryValue 
Real(dp) :: TanBeta
Real(dp) :: vdMZ 
Real(dp) :: vdSUSY 
Real(dp) :: vuMZ 
Real(dp) :: vuSUSY 
Real(dp) :: vSMZ 
Real(dp) :: vSSUSY 
! For HiggsBounds 
Real(dp) :: BR_HpHW(2,3)  = 0._dp
Real(dp) :: BR_HpAW(2,3) = 0._dp
Real(dp) :: BR_HpTB(2) = 0._dp 
Real(dp) :: BR_HpWZ(2) = 0._dp
Real(dp) :: BR_tHb(2) = 0._dp
Real(dp) :: BR_Hcs(2)= 0._dp 
Real(dp) :: BR_Hcb(2)=0._dp 
Real(dp) :: BR_Htaunu(2)=0._dp 
Real(dp) :: BR_tWb = 0._dp
Real(dp) :: BRHll(3,3,3)  = 0._dp
Real(dp) :: BRAll(3,3,3)   = 0._dp 
 Real(dp) :: BRHHH(3,3)=0._dp
Real(dp) :: BRHAA(3,3)= 0._dp 
 Real(dp) :: BRAHH(3,3)=0._dp
Real(dp) :: BRAAA(3,3)  = 0._dp 
 Real(dp) :: BRHHHijk(3,3,3)=0._dp
Real(dp) :: BRHHAijk(3,3,3)=0._dp
Real(dp) :: BRHAAijk(3,3,3)  = 0._dp 
 Real(dp) :: BRAHHijk(3,3,3)=0._dp
Real(dp) :: BRAHAijk(3,3,3)=0._dp
Real(dp) ::  BRAAAijk(3,3,3)  = 0._dp 
 Real(dp) :: BRHHZ(3,3)=0._dp
Real(dp) :: BRHAZ(3,3)  = 0._dp 
 Real(dp) :: BRAHZ(3,3) =0._dp
Real(dp) :: BRAAZ(3,3)  = 0._dp 
 Real(dp) :: BRAHpW(3,2)=0._dp
Real(dp) :: BRHhpW(3,2)  = 0._dp 
 Real(dp) :: BRinvH(3), BRinvA(3)  = 0._dp 
Real(dp) :: rHB_P_VP(3),rHB_S_VP(3)
Real(dp) :: rHB_P_VZ(3),rHB_S_VZ(3)
Real(dp) :: rHB_P_VG(3),rHB_S_VG(3)
Real(dp) :: rHB_P_VWm(3),rHB_S_VWm(3)
Real(dp) :: rHB_P_P_Fd(3,3),rHB_P_S_Fd(3,3),rHB_S_S_Fd(3,3),rHB_S_P_Fd(3,3)
Real(dp) :: rHB_P_P_Fu(3,3),rHB_P_S_Fu(3,3),rHB_S_S_Fu(3,3),rHB_S_P_Fu(3,3)
Real(dp) :: rHB_P_P_Fe(3,3),rHB_P_S_Fe(3,3),rHB_S_S_Fe(3,3),rHB_S_P_Fe(3,3)
Real(dp) :: rHB_P_P_Fv(3,9),rHB_P_S_Fv(3,9),rHB_S_S_Fv(3,9),rHB_S_P_Fv(3,9)
Complex(dp) :: CPL_A_H_Z(3,3)  =0._dp 
 Complex(dp) :: CPL_H_H_Z(3,3) =0._dp 
 Complex(dp) :: CoupHPP(3), CoupHGG(3) =0._dp 
Complex(dp) :: CPL_A_A_Z(3,3) =0._dp 
 Complex(dp) :: CoupAPP(3), CoupAGG(3) =0._dp 
Real(dp) :: HPPloopVWm(3)
Real(dp) :: HPPloopSd(6,3)
Real(dp) :: HPPloopSu(6,3)
Real(dp) :: HPPloopSe(6,3)
Real(dp) :: HPPloopHpm(2,3)
Real(dp) :: HPPloopCha(2,3)
Real(dp) :: HPPloopFe(3,3)
Real(dp) :: HPPloopFd(3,3)
Real(dp) :: HPPloopFu(3,3)

 Real(dp) :: m32, tanbetaMZ 
Complex(dp),Dimension(3,3)::Y_l,Y_d,Y_u,Y_l_mZ,Y_d_mZ,Y_u_mZ&
&,Y_l_0,Y_d_0,Y_u_0
Real(dp),Dimension(3)::gauge,gauge_mZ,gauge_0 
Real(dp)::tanb,vevSM(2),tanb_mZ 
Contains 
 
Real(dp) Function Kronecker(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.eq.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function Kronecker 

Real(dp) Function ThetaStep(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.le.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function ThetaStep 

Real(dp) Function epsTensor(t1,t2,t3) Result(e)
Implicit None
Integer,Intent(in)::t1,t2,t3
If ((t1.eq.1).and.(t2.eq.2).and.(t3.eq.3)) Then
  e=1.
Else If ((t1.eq.2).and.(t2.eq.3).and.(t3.eq.1)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.1).and.(t3.eq.2)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.2).and.(t3.eq.1)) Then
  e=-1.
Else If ((t1.eq.2).and.(t2.eq.1).and.(t3.eq.3)) Then
  e=-1.
Else If ((t1.eq.1).and.(t2.eq.3).and.(t3.eq.2)) Then
  e=-1.
Else
  e=0.
End If
End Function epsTensor
Real(dp) Function gGMSB(ratio) 
Implicit None 
 Real(dp),Intent(in)::ratio 
 gGMSB=(1._dp+ratio)/ratio**2*Log(1._dp+ratio)& 
   &+(1._dp-ratio)/ratio**2*Log(1._dp-ratio) 
End Function gGMSB 
 
Real(dp) Function fGMSB(ratio) 
Implicit None 
Real(dp),Intent(in)::ratio 
If (ratio.lt.0.0001) Then 
 fGMSB = 1._dp 
Else 
 fGMSB=(1._dp+ratio)/ratio**2*(Log(1._dp+ratio)&
  & -2._dp*Li2(ratio/(1._dp+ratio))&
  & +0.5_dp*Li2(2._dp*ratio/(1._dp+ratio)))&
  & +(1._dp-ratio)/ratio**2*(Log(1._dp-ratio)&
  & -2._dp*Li2(ratio/(ratio-1._dp))&
  & +0.5_dp*Li2(2._dp*ratio/(ratio-1._dp)))
End If 
End Function fGMSB 
 
Complex(dp) Recursive Function h(a,b) 
Implicit None 
Real(dp),Intent(in)::a,b 
h=1._dp-(Log(a)*Log(b))/2._dp-&
& ((-(1._dp,-10D-12)+a+b)*(Pi2o6&
& +CLi2(-(((1._dp,-10D-12)-a+b-Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& 2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& +CLi2(-((1._dp+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)-a+b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& -Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)+a-b-&
& Sqrt((1._dp,10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,10D-12)-a+b+Sqrt((1._dp,10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)-a+b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& (2._dp,10.D-12)*(a+b)))/((1._dp,-10D-12)+a-b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))))**2/4._dp))/&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))
End Function h 
 
Complex(dp) Function SQuiver(xQ,yQ) 
Implicit None 
Real(dp),Intent(in)::xQ,yQ 
SQuiver=(-8._dp*xQ**2+4._dp*xQ*yQ**2*atanh(xQ)&
 & -4._dp*(4._dp+yQ**2)*h(1._dp,yQ**2)+(-1._dp+xQ)*(-8._dp+8._dp*xQ+&
 & yQ**2)*h(1._dp,yQ**2/(1._dp-xQ))+8._dp*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 16._dp*xQ*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 8._dp*xQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & yQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(1._dp,yQ**2/(1._dp+xQ))&
 & +4._dp*xQ*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 4._dp*xQ*h(1._dp-xQ,yQ**2)+2._dp*yQ**2*h(1._dp-xQ,yQ**2)-&
 & 4._dp*xQ*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ*h(1._dp+xQ,yQ**2)+2._dp*yQ**2*h(1._dp+xQ,yQ**2)-&
 & yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & xQ*yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*yQ**2*h(yQ**(-2),yQ**(-2))+&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)+&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)-&
 & 8._dp*xQ*CLi2((1._dp,10D-12)*xQ)+&
 & 4._dp*(-1._dp+xQ)*(xQ+yQ**2)*CLi2(xQ/(-(1._dp,10D-12)+xQ))-&
 & (-1._dp+xQ)*yQ**2*CLi2((2._dp*xQ)/(-(1._dp,10D-12)+xQ))+&
 & 2._dp*xQ*CLi2((1._dp,10D-12)*xQ**2)+&
 & 4._dp*(1._dp+xQ)*(xQ-yQ**2)*CLi2(xQ/((1._dp,10D-12)+xQ))+&
 & (1._dp+xQ)*yQ**2*CLi2(((2._dp,10D-12)*xQ)/(1._dp+xQ))+&
 & 2._dp*yQ**2*Log(1._dp-xQ)+&
 & 2._dp*yQ**2*Log(1._dp+xQ))/(2._dp*xQ**2*yQ**2)
End Function SQuiver 
 
Subroutine RGE10_SMa(len,t,gy,f)
 !--------------------------------------------------------
 ! RGEs within the SM assuming the MSbar scheme
 ! 2-loop RGEs for e
 ! 4-loop RGEs for g_3
 ! 2-loop RGEs for lepton masses
 ! 4-loop QCD and 2-loop QED RGES for quark masses
 ! Assumption: the only threhold to be checked is m_b
 ! input: t = Log(Q^2)
 !        gy(i) ... i=1  -> e(Q)
 !                  i=2  -> g_3
 !                  i=3  -> m_e
 !                  i=4  -> m_mu
 !                  i=5  -> m_tau
 !                  i=6  -> m_u
 !                  i=7  -> m_c
 !                  i=8  -> m_d
 !                  i=9  -> m_s
 !                  i=10 -> m_b, is optional
 ! output:
 !   f = d(gy)/d(t)
 ! written by Werner Porod, 03.12.03
 !--------------------------------------------------------
 Implicit None

  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Integer :: i1
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2, q
  Real(dp), Parameter :: b_e1(2) = (/ 76._dp / 9._dp , 80._dp / 9._dp /)    &
       & , b_e2(2) = (/ 460._dp / 27._dp , 464._dp / 27._dp /)              & 
       & , b_e3(2) = (/ 160._dp / 9._dp , 176._dp / 9._dp  /)               & 
       & , b_g1(2) = (/ -25._dp / 3._dp, -23._dp/3._dp /)                   &
       & , b_g2(2) = (/ -154._dp / 3._dp, -116._dp/3._dp /)                 &
       & , b_g3(2) = (/ 20._dp / 3._dp, 22._dp/3._dp /)                     &
       & , b_g4(2) = (/ -21943._dp/54._dp, 9769._dp/54._dp /)               &
       & , b_g5(2) = (/ -4918247._dp/1458._dp-414140._dp*zeta3/81._dp       &
       &             , 598391._dp/1458._dp - 352864._dp*zeta3/81._dp /)     &
       & , g_el1(2) = (/ -6._dp, -6._dp /)                                  &
       & , g_el2(2) = (/ 353._dp / 9._dp,  373._dp / 9._dp /)               & 
       & , g_eu1(2) = (/ -8._dp/3._dp, -8._dp/3._dp /)                      &
       & , g_eu2(2) = (/ 1472._dp / 81._dp, 1552._dp / 81._dp/)             & 
       & , g_eu3(2) = (/ -32._dp / 9._dp,  -32._dp / 9._dp/)                & 
       & , g_ed1(2) = (/ -2._dp/3._dp, -2._dp/3._dp /)                      &
       & , g_ed2(2) = (/ 377._dp / 81._dp,  397._dp / 81._dp /)             & 
       & , g_ed3(2) = (/ -8._dp / 9._dp,  -8._dp / 9._dp /)                 & 
       & , g_q1(2) = (/ - 8._dp , -8._dp /)                                 &
       & , g_q2(2) = (/ -1052._dp / 9._dp ,  -1012._dp / 9._dp /)           &
       & , g_q3(2) = (/ -144674._dp/81._dp + 1280._dp * zeta3 / 3._dp       &
       &              , -128858._dp/81._dp + 1600._dp * zeta3 / 3._dp /)    &
       & , g_q4(2) = (/ -7330357._dp/243._dp + 51584._dp* zeta3/3._dp       &
       &                - 16000._dp*zeta4 / 3._dp + 11200._dp* zeta5 /9._dp &
       &             , -1911065._dp/81._dp + 618400._dp* zeta3/27._dp       &
       &                - 18400._dp*zeta4 / 3._dp - 25600._dp* zeta5 /9._dp  /)

       
  Iname = Iname + 1
  NameOfUnit(Iname) = 'RGE10_SMa'

  q = t

  If (len.Eq.9) Then ! check which beta function (anomalous dimension) to use
   i1 = 1
  Else If (len.Eq.10) Then
   i1 = 2
  Else
   Write(ErrCan,*) "Error in routine "//Trim(NameOfUnit(Iname))
   Write(ErrCan,*) "Length of the vector gy = ",len
   Call TerminateProgram
  End If

  g32 = gy(1)**2
  g34 = gy(1)**4
  g36 = gy(1)**6
  g38 = gy(1)**8
  e2 = gy(2)**2
  e4 = gy(2)**4
  g32e2 = g32 * e2 
 !--------
 ! g_3
 !--------
  f(1) = oo16pi2 * gy(1) * ( b_g1(i1)*g32                                     &
       &                   + oo16pi2 * ( b_g2(i1)*g34 + b_g3(i1)*g32e2        &
       &                               + oo16pi2 * ( b_g4(i1)*g36             &
       &                                           + oo16pi2 * b_g5(i1)*g38 )))
 !--------
 ! e
 !--------
  f(2) = oo16pi2 * gy(2) * ( b_e1(i1) * e2                                &
       &                   + oo16pi2 * (b_e2(i1) * e4 + b_e3(i1) * g32e2 ))
 !-----------------
 ! m_l, l=e,mu,tau
 !-----------------
  f(3:5) =  oo16pi2 * gy(3:5) * (g_el1(i1) * e2 + oo16pi2 *g_el2(i1) * e4)
 !---------
 ! m_u, m_c
 !---------
  f(6:7) = oo16pi2 * gy(6:7) * (g_eu1(i1) * e2 + g_q1(i1) * g32              &
         &                     + oo16pi2 * (g_eu2(i1)*e4 + g_eu3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))
 !---------------
 ! m_d, m_s, m_b
 !---------------
  f(8:len) = oo16pi2 * gy(8:len) * (g_ed1(i1) * e2 + g_q1(i1) * g32          &
         &                     + oo16pi2 * (g_ed2(i1)*e4 + g_ed3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))

  Iname = Iname - 1

 End Subroutine RGE10_SMa

Subroutine RGE11_SMa(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)

  If (nUp.lt.2.9_dp)  f(8) = 0._dp
  If (nDown.lt.2.9_dp)  f(12) = 0._dp

  f = oo16pi2*f


End Subroutine RGE11_SMa

Subroutine RGE11(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark, a1, a2, a3, nG
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 

  nG = 3._dp
  a1 = gy(12)
  a2 = gy(13)
  a3 = gy(14)


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)



!! running of alpha_i to calculate running sin(w2); equations by Steinhauser
  ! alpha_1
  f(12) = a1**2*(2._dp/5._dp + nG*16._dp/3._dp) + &
    & a1**2*oo4pi2*(18._dp/25._dp*a1 + 18._dp/5._dp*a2 + nG*(76._dp/15._dp*a1 + 12._dp/5._dp*a2 + 176._dp/15._dp*a3))

  ! alpha_2
  f(13) = a2**2*(-86._dp/3._dp + nG*16._dp/3._dp) + &
   & a2**2*oo4pi2*(6._dp/5._dp*a1 - 518._dp/3._dp*a2 + nG*(4._dp/3._dp + 196._dp/3._dp*a2 + 16._dp*a3))

  ! alpha_3
  f(14) = a3**2*(-44._dp + nG*16._dp/3._dp) + &
    & a3**2*oo4pi2*(-408._dp*a3 + nG*(22._dp/15._dp*a1 + 6._dp*a2 + 304._dp/3._dp*a3))

  f = oo16pi2*f


End Subroutine RGE11


Subroutine RGEAlphaS(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGEAlphaS

Subroutine RGETop(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(3) = gy(3)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGETop
Subroutine SetGUTScale(scale)
Implicit None
Real(dp),Intent(in)::scale
If (scale.Lt.0._dp) Then
UseFixedGUTScale= .False.
Else
UseFixedGUTScale= .True.
GUT_scale=scale
End If
End Subroutine SetGUTScale
 

Subroutine SetRGEScale(scale)
Implicit None
Real(dp),Intent(in)::scale
Real(dp)::old_scale
If (scale.Lt.0._dp) Then
UseFixedScale= .False.
Else
UseFixedScale= .True.
old_scale=SetRenormalizationScale(scale)
End If
End Subroutine SetRGEScale


Logical Function SetStrictUnification(V1)
Implicit None
Logical,Intent(in)::V1
SetStrictUnification= .False.
StrictUnification=V1
SetStrictUnification= .True.
End Function SetStrictUnification


Integer Function SetYukawaScheme(V1)
Implicit None
Integer,Intent(in)::V1
SetYukawaScheme=YukawaScheme
YukawaScheme=V1
End Function SetYukawaScheme


Subroutine Set_All_Parameters_0() 
Implicit None 
Y_l= 0._dp 
Y_d= 0._dp 
Y_u= 0._dp 
Y_l_mZ= 0._dp 
Y_d_mZ= 0._dp 
Y_u_mZ= 0._dp 
Y_l_0= 0._dp 
Y_d_0= 0._dp 
Y_u_0= 0._dp 
gauge= 0._dp 
gauge_mZ= 0._dp 
gauge_0 = 0._dp 
tanb= 0._dp 
vevSM= 0._dp 
tanb_mZ = 0._dp 
GUT_scale = 0._dp 
HPPloopVWm = 0._dp 
HPPloopSd = 0._dp 
HPPloopSu = 0._dp 
HPPloopSe = 0._dp 
HPPloopHpm = 0._dp 
HPPloopCha = 0._dp 
HPPloopFe = 0._dp 
HPPloopFd = 0._dp 
HPPloopFu = 0._dp 
g1IN = 0._dp 
g2IN = 0._dp 
g3IN = 0._dp 
YdIN = 0._dp 
YeIN = 0._dp 
lamIN = 0._dp 
kapIN = 0._dp 
lamNIN = 0._dp 
YuIN = 0._dp 
YvIN = 0._dp 
MUXIN = 0._dp 
TdIN = 0._dp 
TeIN = 0._dp 
TlamIN = 0._dp 
TkIN = 0._dp 
TLNIN = 0._dp 
TuIN = 0._dp 
TvIN = 0._dp 
BMUXIN = 0._dp 
mq2IN = 0._dp 
ml2IN = 0._dp 
mHd2IN = 0._dp 
mHu2IN = 0._dp 
md2IN = 0._dp 
mu2IN = 0._dp 
me2IN = 0._dp 
mv2IN = 0._dp 
ms2IN = 0._dp 
mx2IN = 0._dp 
M1IN = 0._dp 
M2IN = 0._dp 
M3IN = 0._dp 
g1 = 0._dp 
g1MZ = 0._dp 
g2 = 0._dp 
g2MZ = 0._dp 
g3 = 0._dp 
g3MZ = 0._dp 
Yd = 0._dp 
YdMZ = 0._dp 
Ye = 0._dp 
YeMZ = 0._dp 
lam = 0._dp 
lamMZ = 0._dp 
kap = 0._dp 
kapMZ = 0._dp 
lamN = 0._dp 
lamNMZ = 0._dp 
Yu = 0._dp 
YuMZ = 0._dp 
Yv = 0._dp 
YvMZ = 0._dp 
MUX = 0._dp 
MUXMZ = 0._dp 
Td = 0._dp 
TdMZ = 0._dp 
Te = 0._dp 
TeMZ = 0._dp 
Tlam = 0._dp 
TlamMZ = 0._dp 
Tk = 0._dp 
TkMZ = 0._dp 
TLN = 0._dp 
TLNMZ = 0._dp 
Tu = 0._dp 
TuMZ = 0._dp 
Tv = 0._dp 
TvMZ = 0._dp 
BMUX = 0._dp 
BMUXMZ = 0._dp 
mq2 = 0._dp 
mq2MZ = 0._dp 
ml2 = 0._dp 
ml2MZ = 0._dp 
mHd2 = 0._dp 
mHd2MZ = 0._dp 
mHu2 = 0._dp 
mHu2MZ = 0._dp 
md2 = 0._dp 
md2MZ = 0._dp 
mu2 = 0._dp 
mu2MZ = 0._dp 
me2 = 0._dp 
me2MZ = 0._dp 
mv2 = 0._dp 
mv2MZ = 0._dp 
ms2 = 0._dp 
ms2MZ = 0._dp 
mx2 = 0._dp 
mx2MZ = 0._dp 
M1 = 0._dp 
M1MZ = 0._dp 
M2 = 0._dp 
M2MZ = 0._dp 
M3 = 0._dp 
M3MZ = 0._dp 
vdIN = 0._dp 
vuIN = 0._dp 
vSIN = 0._dp 
MAh = 0._dp 
MAh2 = 0._dp 
MCha = 0._dp 
MCha2 = 0._dp 
MChi = 0._dp 
MChi2 = 0._dp 
MFd = 0._dp 
MFd2 = 0._dp 
MFe = 0._dp 
MFe2 = 0._dp 
MFu = 0._dp 
MFu2 = 0._dp 
MFv = 0._dp 
MFv2 = 0._dp 
MGlu = 0._dp 
MGlu2 = 0._dp 
Mhh = 0._dp 
Mhh2 = 0._dp 
MHpm = 0._dp 
MHpm2 = 0._dp 
MSd = 0._dp 
MSd2 = 0._dp 
MSe = 0._dp 
MSe2 = 0._dp 
MSu = 0._dp 
MSu2 = 0._dp 
MSvIm = 0._dp 
MSvIm2 = 0._dp 
MSvRe = 0._dp 
MSvRe2 = 0._dp 
MVWm = 0._dp 
MVWm2 = 0._dp 
MVZ = 0._dp 
MVZ2 = 0._dp 
pG = 0._dp 
TW = 0._dp 
UM = 0._dp 
UP = 0._dp 
UV = 0._dp 
v = 0._dp 
ZA = 0._dp 
ZD = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
ZE = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
ZH = 0._dp 
ZN = 0._dp 
ZP = 0._dp 
ZU = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
ZVI = 0._dp 
ZVR = 0._dp 
ZW = 0._dp 
ZZ = 0._dp 
betaH = 0._dp 
vd = 0._dp 
vu = 0._dp 
vS = 0._dp 
gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
gPSd = 0._dp 
gTSd = 0._dp 
BRSd = 0._dp 
gPSu = 0._dp 
gTSu = 0._dp 
BRSu = 0._dp 
gPSe = 0._dp 
gTSe = 0._dp 
BRSe = 0._dp 
gPSvIm = 0._dp 
gTSvIm = 0._dp 
BRSvIm = 0._dp 
gPSvRe = 0._dp 
gTSvRe = 0._dp 
BRSvRe = 0._dp 
gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
gPCha = 0._dp 
gTCha = 0._dp 
BRCha = 0._dp 
gPGlu = 0._dp 
gTGlu = 0._dp 
BRGlu = 0._dp 
gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
ratioCha =  0._dp  
ratioFd =  0._dp  
ratioFe =  0._dp  
ratioFu =  0._dp  
ratioHpm =  0._dp  
ratioSd =  0._dp  
ratioSe =  0._dp  
ratioSu =  0._dp  
ratioVWm =  0._dp  
ratioGG =  0._dp  
ratioPP =  0._dp  
ratioPCha =  0._dp  
ratioPFd =  0._dp  
ratioPFe =  0._dp  
ratioPFu =  0._dp  
ratioPHpm =  0._dp  
ratioPSd =  0._dp  
ratioPSe =  0._dp  
ratioPSu =  0._dp  
ratioPVWm =  0._dp  
ratioPGG =  0._dp  
ratioPPP =  0._dp  
TanBeta= 0._dp 
End Subroutine Set_All_Parameters_0 
 


Subroutine SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,             & 
& vS,g1,g2,g3,Yd,Ye,lam,kap,lamN,Yu,Yv,MUX,Td,Te,Tlam,Tk,TLN,Tu,Tv,BMUX,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,ms2,mx2,M1,M2,M3,MZsuffix)

Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,ms2

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,kap,lamN(3,3),Yu(3,3),Yv(3,3),MUX(3,3),Td(3,3),Te(3,3),           & 
& Tlam,Tk,TLN(3,3),Tu(3,3),Tv(3,3),BMUX(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),        & 
& me2(3,3),mv2(3,3),mx2(3,3),M1,M2,M3

Real(dp),Intent(inout) :: vd,vu,vS

Logical,Intent(in)::MZsuffix 
Real(dp), Intent(in) :: g1SM, g2SM, g3SM, vSM 
Complex(dp),Intent(in) :: YuSM(3,3),YdSM(3,3),YeSM(3,3) 
If (MZsuffix) Then 
  g1MZ = g1SM 
  g2MZ = g2SM 
  g3MZ = g3SM 
  vdMZ = vSM/Sqrt(1 + TanBeta**2) 
  vuMZ = TanBeta*vd 
  YuMZ = (vSM*YuSM)/vu 
  YdMZ = (vSM*YdSM)/vd 
  YeMZ = (vSM*YeSM)/vd 
Else 
  g1 = g1SM 
  g2 = g2SM 
  g3 = g3SM 
  vd = vSM/Sqrt(1 + TanBeta**2) 
  vu = TanBeta*vd 
  Yu = (vSM*YuSM)/vu 
  Yd = (vSM*YdSM)/vd 
  Ye = (vSM*YeSM)/vd 
End if 
End Subroutine SetMatchingConditions 
End Module Model_Data_NInvSeesaw