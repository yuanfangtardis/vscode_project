#!/usr/bin/env python
import math

# name="../SPheno-4.0.3/GsphenoInput.txt"
model="seesaw1nmssm"
name="./GsphenoInput.txt"

#standard model auxiliary
g_f=1.166370E-05
m_b=4.180000E+00
m_top=1.735000E+02
m_tau=1.776690E+00

#susy model auxiliary(1)
tanb=3.30202868E+00

#susy model auxiliary(2)
mueff=2.47815803E+02

#spheno input 
modsel_1=0 #  1/0: High/low scale input
modsel_2=0 # Boundary Condition
modsel_6=1 # Generation Mixing
modsel_12=1.E+03 # Renormalization scale

sminputs_2=g_f # G_F,Fermi constant
sminputs_3=1.18700000E-01  # alpha_s(MZ) SM MSbar
sminputs_4=9.118870E+01 # Z-boson pole mass
sminputs_5=m_b # m_b(mb) SM MSbar
sminputs_6=m_top # m_top(pole)
sminputs_7=m_tau # m_tau(pole)

msoftin_1=4.00000E+02 # M1
msoftin_2=8.00000E+02 # M2
msoftin_3=2.40000E+03 # M3

minpar_3=tanb # TanBeta

extpar_65=mueff # MuEffinput 

nmssmrunin_1=6.30259199E-01 # lam 
nmssmrunin_2=2.31391184E-01 # kap 
nmssmrunin_3=4.78527596E+02  # Tlam 
nmssmrunin_4=-5.73037281E+01 # Tk 

sphenoinput_1=-1 # error level 
sphenoinput_2=0 # SPA conventions 
sphenoinput_7=0 # Skip 2-loop Higgs corrections 
sphenoinput_8=3 # Method used for two-loop calculation 
sphenoinput_9=1 # Gaugeless limit used at two-loop 
sphenoinput_10=0 # safe-mode used at two-loop 
sphenoinput_11=1 # calculate branching ratios 
sphenoinput_13=0 # 3-Body decays: none (0), fermion (1), scalar (2), both (3) 
sphenoinput_14=0 # Run couplings to scale of decaying particle 
sphenoinput_12=1.000E-04 # write only branching ratios larger than this value 
sphenoinput_15=1.000E-30 # write only decay if width larger than this value 
sphenoinput_16=0 # One-loop decays 
sphenoinput_31=-1 # fixed GUT scale (-1: dynamical GUT scale) 
sphenoinput_32=0 # Strict unification 
sphenoinput_34=1.000E-04 # Precision of mass calculation 
sphenoinput_35=40 # Maximal number of iterations
sphenoinput_36=5  # Minimal number of iterations before discarding points
sphenoinput_37=1  # Set Yukawa scheme  
sphenoinput_38=2  # 1- or 2-Loop RGEs 
sphenoinput_50=0  # Majorana phases: use only positive masses (put 0 to use file with CalcHep/Micromegas!) 
sphenoinput_51=0  # Write Output in CKM basis 
sphenoinput_52=0  # Write spectrum in case of tachyonic states 
sphenoinput_55=1  # Calculate loop corrected masses 
sphenoinput_57=1  # Calculate low energy constraints 
sphenoinput_65=1  # Solution tadpole equation 
sphenoinput_66=0  # Two-Scale Matching 
sphenoinput_67=1  # effective Higgs mass calculation 
sphenoinput_75=0  # Write WHIZARD files 
sphenoinput_76=2  # Write HiggsBounds file   
sphenoinput_77=1  # Output for MicrOmegas (running masses for light quarks; real mixing matrices)   
sphenoinput_78=0  # Output for MadGraph (writes also vanishing blocks)   
sphenoinput_86=0. # Maximal width to be counted as invisible in Higgs decays; -1: only LSP 
sphenoinput_510=0. # Write tree level values for tadpole solutions 
sphenoinput_515=0  # Write parameter values at GUT scale 
sphenoinput_520=0. # Write effective Higgs couplings (HiggsBounds blocks): put 0 to use file with MadGraph! 
sphenoinput_521=1. # Diphoton/Digluon widths including higher order 
sphenoinput_525=0. # Write loop contributions to diphoton decay of Higgs 
sphenoinput_530=0. # Write Blocks for Vevacious 

decayoptions_1=1 # Calc 3-Body decays of SvRe 
decayoptions_2=1 # Calc 3-Body decays of SvIm 
decayoptions_3=1 # Calc 3-Body decays of Hpm 
decayoptions_4=1 # Calc 3-Body decays of hh 
decayoptions_5=1 # Calc 3-Body decays of Ah 
decayoptions_6=1 # Calc 3-Body decays of Su 
decayoptions_7=1 # Calc 3-Body decays of Sd 
decayoptions_8=1 # Calc 3-Body decays of Se
decayoptions_9=1 # Calc 3-Body decays of Glu 
decayoptions_10=1 # Calc 3-Body decays of Cha 
decayoptions_11=1 # Calc 3-Body decays of Chi 
decayoptions_12=1 # Calc 3-Body decays of Fv 
decayoptions_1001=1 # Loop Decay of SvRe 
decayoptions_1002=1 # Loop Decay of SvIm 
decayoptions_1003=1 # Loop Decay of Hpm 
decayoptions_1004=1 # Loop Decay of hh 
decayoptions_1005=1 # Loop Decay of Ah 
decayoptions_1006=1 # Loop Decay of Su 
decayoptions_1007=1 # Loop Decay of Sd 
decayoptions_1008=1 # Loop Decay of Se 
decayoptions_1009=1 # Loop Decay of Glu 
decayoptions_1010=1 # Loop Decay of Cha 
decayoptions_1011=1 # Loop Decay of Chi 
decayoptions_1012=1 # Loop Decay of Fv 
decayoptions_1114=1. # U-factors (0: off, 1:p2_i=m2_i, 2:p2=0, p3:p2_i=m2_1) 
decayoptions_1115=1. # Use loop-corrected masses for external states 
decayoptions_1116=0. # OS values for W,Z and fermions (0: off, 1:g1,g2,v 2:g1,g2,v,Y_i) 
decayoptions_1117=0. # Use defined counter-terms 
decayoptions_1118=1. # Use everywhere loop-corrected masses for loop-induced decays 

msd2in_1_1=4.E+06 # md2(1,1)
msd2in_1_2=0.E+00 # md2(1,2)
msd2in_1_3=0.E+00 # md2(1,3)
msd2in_2_1=0.E+00 # md2(2,1)
msd2in_2_2=4.E+06 # md2(2,2)
msd2in_2_3=0.E+00 # md2(2,3)
msd2in_3_1=0.E+00 # md2(3,1)
msd2in_3_2=0.E+00 # md2(3,2)
msd2in_3_3=1.E+06 # md2(3,3)

msl2in_1_1=1.6E+05 # ml2(1,1)
msl2in_1_2=0.E+00 # ml2(1,2)
msl2in_1_3=0.E+00 # ml2(1,3)
msl2in_2_1=0.E+00 # ml2(2,1)
msl2in_2_2=1.6E+05 # ml2(2,2)
msl2in_2_3=0.E+00 # ml2(2,3)
msl2in_3_1=0.E+00 # ml2(3,1)
msl2in_3_2=0.E+00 # ml2(3,2)
msl2in_3_3=1.6E+05 # ml2(3,3)

mse2in_1_1=1.6E+05 # me2(1,1)
mse2in_1_2=0.E+00 # me2(1,2)
mse2in_1_3=0.E+00 # me2(1,3)
mse2in_2_1=0.E+00 # me2(2,1)
mse2in_2_2=1.6E+05 # me2(2,2)
mse2in_2_3=0.E+00 # me2(2,3)
mse2in_3_1=0.E+00 # me2(3,1)
mse2in_3_2=0.E+00 # me2(3,2)
mse2in_3_3=1.6E+05 # me2(3,3)

msq2in_1_1=4.E+06 # mq2(1,1)
msq2in_1_2=0.E+00 # mq2(1,2)
msq2in_1_3=0.E+00 # mq2(1,3)
msq2in_2_1=0.E+00 # mq2(2,1)
msq2in_2_2=4.E+06 # mq2(2,2)
msq2in_2_3=0.E+00 # mq2(2,3)
msq2in_3_1=0.E+00 # mq2(3,1)
msq2in_3_2=0.E+00 # mq2(3,2)
msq2in_3_3=1.E+06 # mq2(3,3)

msu2in_1_1=4.E+06 # mu2(1,1)
msu2in_1_2=0.E+00 # mu2(1,2)
msu2in_1_3=0.E+00 # mu2(1,3)
msu2in_2_1=0.E+00 # mu2(2,1)
msu2in_2_2=4.E+06 # mu2(2,2)
msu2in_2_3=0.E+00 # mu2(2,3)
msu2in_3_1=0.E+00 # mu2(3,1)
msu2in_3_2=0.E+00 # mu2(3,2)
msu2in_3_3=1.E+06 # mu2(3,3)

mv2in_1_1=1.6E+5 # mv2(1,1)
#mv2in_1_1=1.6E+05 # mv2(1,1)
mv2in_1_2=0.E+00 # mv2(1,2)
mv2in_1_3=0.E+00 # mv2(1,3)
mv2in_2_1=0.E+00 # mv2(2,1)
mv2in_2_2=1.6E+5 # mv2(2,2)
#mv2in_2_2=1.6E+05 # mv2(2,2)
mv2in_2_3=0.E+00 # mv2(2,3)
mv2in_3_1=0.E+00 # mv2(3,1)
mv2in_3_2=0.E+00 # mv2(3,2)
mv2in_3_3=4102.31891552 # mv2(3,3)

yvin_1_1=0.E+00 # Yv(1,1)
yvin_1_2=0.E+00 # Yv(1,2)
yvin_1_3=0.E+00 # Yv(1,3)
yvin_2_1=0.E+00 # Yv(2,1)
yvin_2_2=0.E+00 # Yv(2,2)
yvin_2_3=0.E+00 # Yv(2,3)
yvin_3_1=0.E+00 # Yv(3,1)
yvin_3_2=0.E+00 # Yv(3,2)
yvin_3_3=1.E-03 # Yv(3,3)

lamnin_1_1=5.E-01 # lamN(1,1)
lamnin_1_2=0.E+00 # lamN(1,2)
lamnin_1_3=0.E+00 # lamN(1,3)
lamnin_2_1=0.E+00 # lamN(2,1)
lamnin_2_2=3.E-01 # lamN(2,2)
lamnin_2_3=0.E+00 # lamN(2,3)
lamnin_3_1=0.E+00 # lamN(3,1)
lamnin_3_2=0.E+00 # lamN(3,2)
lamnin_3_3=0.14007423432 # lamN(3,3)

tdin_1_1=0.E+00 # Td(1,1)
tdin_1_2=0.E+00 # Td(1,2)
tdin_1_3=0.E+00 # Td(1,3)
tdin_2_1=0.E+00 # Td(2,1)
tdin_2_2=0.E+00 # Td(2,2)
tdin_2_3=0.E+00 # Td(2,3)
tdin_3_1=0.E+00 # Td(3,1)
tdin_3_2=0.E+00 # Td(3,2)
tdin_3_3=-3.90023925E+03 # Td(3,3)

tein_1_1=0.E+00 # Te(1,1)
tein_1_2=0.E+00 # Te(1,2)
tein_1_3=0.E+00 # Te(1,3)
tein_2_1=0.E+00 # Te(2,1)
tein_2_2=0.E+00 # Te(2,2)
tein_2_3=0.E+00 # Te(2,3)
tein_3_1=0.E+00 # Te(3,1)
tein_3_2=0.E+00 # Te(3,2)
tein_3_3=1.65083465E+02 # Te(3,3)

tuin_1_1=0.E+00 # Tu(1,1)
tuin_1_2=0.E+00 # Tu(1,2)
tuin_1_3=0.E+00 # Tu(1,3)
tuin_2_1=0.E+00 # Tu(2,1)
tuin_2_2=0.E+00 # Tu(2,2)
tuin_2_3=0.E+00 # Tu(2,3)
tuin_3_1=0.E+00 # Tu(3,1)
tuin_3_2=0.E+00 # Tu(3,2)
tuin_3_3=-1.59841511E+03 # Tu(3,3)

av_1_1=0.E+00
av_1_2=0.E+00
av_1_3=0.E+00
av_2_1=0.E+00
av_2_2=0.E+00
av_2_3=0.E+00
av_3_1=0.E+00
av_3_2=0.E+00
av_3_3=0.E+00

tvin_1_1=yvin_1_1*av_1_1 # Tv(1,1)
tvin_1_2=yvin_1_2*av_1_2 # Tv(1,2)
tvin_1_3=yvin_1_3*av_1_3 # Tv(1,3)
tvin_2_1=yvin_2_1*av_2_1 # Tv(2,1)
tvin_2_2=yvin_2_2*av_2_2 # Tv(2,2)
tvin_2_3=yvin_2_3*av_2_3 # Tv(2,3)
tvin_3_1=yvin_3_1*av_3_1 # Tv(3,1)
tvin_3_2=yvin_3_2*av_3_2 # Tv(3,2)
tvin_3_3=yvin_3_3*av_3_3 # Tv(3,3)

alamn_1_1=0.E+00
alamn_1_2=0.E+00
alamn_1_3=0.E+00
alamn_2_1=0.E+00
alamn_2_2=0.E+00
alamn_2_3=0.E+00
alamn_3_1=0.E+00
alamn_3_2=0.E+00
alamn_3_3=204.529560361

tlamnin_1_1=lamnin_1_1*alamn_1_1 # TLN(1,1)
tlamnin_1_2=lamnin_1_1*alamn_1_1 # TLN(1,2)
tlamnin_1_3=lamnin_1_1*alamn_1_1 # TLN(1,3)
tlamnin_2_1=lamnin_2_1*alamn_2_1 # TLN(2,1)
tlamnin_2_2=lamnin_2_2*alamn_2_2 # TLN(2,2)
tlamnin_2_3=lamnin_2_3*alamn_2_3 # TLN(2,3)
tlamnin_3_1=lamnin_3_1*alamn_3_1 # TLN(3,1)
tlamnin_3_2=lamnin_3_2*alamn_3_2 # TLN(3,2)
tlamnin_3_3=lamnin_3_3*alamn_3_3 # TLN(3,3)

if model == "seesaw1nmssm":
  txt=\
"Block MODSEL      #\n"+\
"   1  %d          #  1/0: High/low scale input\n"%modsel_1+\
"   2  %d          # Boundary Condition\n"%modsel_2+\
"   6  %d          # Generation Mixing\n"%modsel_6+\
"  12  %f          # Renormalization scale\n"%modsel_12+\
"Block SMINPUTS    # Standard Model inputs\n"+\
"   2  %E    # G_F,Fermi constant\n"%sminputs_2+\
"   3  %E    # alpha_s(MZ) SM MSbar\n"%sminputs_3+\
"   4  %E    # Z-boson pole mass\n"%sminputs_4+\
"   5  %E    # m_b(mb) SM MSbar\n"%sminputs_5+\
"   6  %E    # m_top(pole)\n"%sminputs_6+\
"   7  %E    # m_tau(pole)\n"%sminputs_7+\
"Block MSOFTIN       #\n"+\
"  1   %E         # M1\n"%msoftin_1+\
"  2   %E         # M2\n"%msoftin_2+\
"  3   %E         # M3\n"%msoftin_3+\
"Block MINPAR      # Input parameters\n"+\
"   3  %E    # TanBeta\n"%minpar_3+\
"Block EXTPAR      # Input parameters\n"+\
"  65  %E    # MuEffinput\n"%extpar_65+\
"Block NMSSMRUNIN       #\n"+ \
"  1   %E         # lam\n"%nmssmrunin_1+\
"  2   %E         # kap\n"%nmssmrunin_2+\
"  3   %E         # Tlam\n"%nmssmrunin_3+\
"  4   %E         # Tk\n"%nmssmrunin_4+\
"Block SPhenoInput   # SPheno specific input\n"+\
"   1  %d     # error level\n"%sphenoinput_1+\
"   2  %d     # SPA conventions\n"%sphenoinput_2+\
"   7  %d     # Skip 2-loop Higgs corrections\n"%sphenoinput_7+\
"   8  %d     # Method used for two-loop calculation\n"%sphenoinput_8+\
"   9  %d     # Gaugeless limit used at two-loop\n"%sphenoinput_9+\
"  10  %d     # safe-mode used at two-loop\n"%sphenoinput_10+\
"  11  %d     # calculate branching ratios\n"%sphenoinput_11+\
"  13  %d     # 3-Body decays: none (0), fermion (1), scalar (2), both (3)\n"%sphenoinput_13+\
"  14  %d     # Run couplings to scale of decaying particle\n"%sphenoinput_14+\
"  12  %E     # write only branching ratios larger than this value\n"%sphenoinput_12+\
"  15  %E     # write only decay if width larger than this value\n"%sphenoinput_15+\
"  16  %d     # One-loop decays\n"%sphenoinput_16+\
"  31  %d     # fixed GUT scale (-1: dynamical GUT scale)\n"%sphenoinput_31+\
"  32  %d     # Strict unification\n"%sphenoinput_32+\
"  34  %E     # Precision of mass calculation\n"%sphenoinput_34+\
"  35  %d     # Maximal number of iterations\n"%sphenoinput_35+\
"  36  %d     # Minimal number of iterations before discarding points\n"%sphenoinput_36+\
"  37  %d     # Set Yukawa scheme\n"%sphenoinput_37+\
"  38  %d     # 1- or 2-Loop RGEs\n"%sphenoinput_38+\
"  50  %d     # Majorana phases: use only positive masses (put 0 to use file with CalcHep/Micromegas!)\n"%sphenoinput_50+\
"  51  %d     # Write Output in CKM basis\n"%sphenoinput_51+\
"  52  %d     # Write spectrum in case of tachyonic states\n"%sphenoinput_52+\
"  55  %d     # Calculate loop corrected masses\n"%sphenoinput_55+\
"  57  %d     # Calculate low energy constraints\n"%sphenoinput_57+\
"  65  %d     # Solution tadpole equation\n"%sphenoinput_65+\
"  66  %d     # Two-Scale Matching\n"%sphenoinput_66+\
"  67  %d     # effective Higgs mass calculation\n"%sphenoinput_67+\
"  75  %d     # Write WHIZARD files\n"%sphenoinput_75+\
"  76  %d     # Write HiggsBounds file\n"%sphenoinput_76+\
"  77  %d     # Output for MicrOmegas (running masses for light quarks; real mixing matrices)\n"%sphenoinput_77+\
"  78  %d     # Output for MadGraph (writes also vanishing blocks)\n"%sphenoinput_78+\
"  86  %f     # Maximal width to be counted as invisible in Higgs decays; -1: only LSP\n "%sphenoinput_86+\
" 510  %f     # Write tree level values for tadpole solutions\n"%sphenoinput_510+\
" 515  %f     # Write parameter values at GUT scale\n"%sphenoinput_515+\
" 520  %f     # Write effective Higgs couplings (HiggsBounds blocks): put 0 to use file with MadGraph!\n"%sphenoinput_520+\
" 521  %f     # Diphoton/Digluon widths including higher order\n "%sphenoinput_521+\
" 525  %f     # Write loop contributions to diphoton decay of Higgs\n"%sphenoinput_525+\
" 530  %f     # Write Blocks for Vevacious\n"%sphenoinput_530+ \
"Block DECAYOPTIONS   # Options to turn on/off specific decays\n"+\
"   1 %d     # Calc 3-Body decays of SvRe\n"%decayoptions_1+\
"   2 %d     # Calc 3-Body decays of SvIm\n"%decayoptions_2+\
"   3 %d     # Calc 3-Body decays of Hpm\n"%decayoptions_3+\
"   4 %d     # Calc 3-Body decays of hh\n"%decayoptions_4+\
"   5 %d     # Calc 3-Body decays of Ah\n"%decayoptions_5+\
"   6 %d     # Calc 3-Body decays of Su\n"%decayoptions_6+\
"   7 %d     # Calc 3-Body decays of Sd\n"%decayoptions_7+\
"   8 %d     # Calc 3-Body decays of Se\n"%decayoptions_8+\
"   9 %d     # Calc 3-Body decays of Glu\n"%decayoptions_9+\
"  10 %d     # Calc 3-Body decays of Cha\n"%decayoptions_10+\
"  11 %d     # Calc 3-Body decays of Chi\n"%decayoptions_11+\
"  12 %d     # Calc 3-Body decays of Fv\n"%decayoptions_12+\
"1001 %d     # Loop Decay of SvRe\n"%decayoptions_1001+ \
"1002 %d     # Loop Decay of SvIm\n"%decayoptions_1002+\
"1003 %d     # Loop Decay of Hpm\n"%decayoptions_1003+ \
"1004 %d     # Loop Decay of hh\n"%decayoptions_1004+ \
"1005 %d     # Loop Decay of Ah\n"%decayoptions_1005+ \
"1006 %d     # Loop Decay of Su\n"%decayoptions_1006+ \
"1007 %d     # Loop Decay of Sd\n"%decayoptions_1007+ \
"1008 %d     # Loop Decay of Se\n"%decayoptions_1008+ \
"1009 %d     # Loop Decay of Glu\n"%decayoptions_1009+ \
"1010 %d     # Loop Decay of Cha\n"%decayoptions_1010+ \
"1011 %d     # Loop Decay of Chi\n"%decayoptions_1011+ \
"1012 %d     # Loop Decay of Fv\n"%decayoptions_1012+ \
"1114 %f     # U-factors (0: off, 1:p2_i=m2_i, 2:p2=0, p3:p2_i=m2_1)\n"%decayoptions_1114+ \
"1115 %f     # Use loop-corrected masses for external states\n"%decayoptions_1115+ \
"1116 %f     # OS values for W,Z and fermions (0: off, 1:g1,g2,v 2:g1,g2,v,Y_i)\n"%decayoptions_1116+ \
"1117 %f     # Use defined counter-terms\n"%decayoptions_1117+ \
"1118 %f     # Use everywhere loop-corrected masses for loop-induced decays\n"%decayoptions_1118+ \
"Block MSD2IN    #\n"+\
"  1 1   %E         # md2(1,1)\n"%msd2in_1_1+\
"  1 2   %E         # md2(1,2)\n"%msd2in_1_2+\
"  1 3   %E         # md2(1,3)\n"%msd2in_1_3+\
"  2 1   %E         # md2(2,1)\n"%msd2in_2_1+\
"  2 2   %E         # md2(2,2)\n"%msd2in_2_2+\
"  2 3   %E         # md2(2,3)\n"%msd2in_2_3+\
"  3 1   %E         # md2(3,1)\n"%msd2in_3_1+\
"  3 2   %E         # md2(3,2)\n"%msd2in_3_2+\
"  3 3   %E         # md2(3,3)\n"%msd2in_3_3+\
"Block MSE2IN    #\n"+\
"  1 1   %E         # me2(1,1)\n"%mse2in_1_1+\
"  1 2   %E         # me2(1,2)\n"%mse2in_1_2+\
"  1 3   %E         # me2(1,3)\n"%mse2in_1_3+\
"  2 1   %E         # me2(2,1)\n"%mse2in_2_1+\
"  2 2   %E         # me2(2,2)\n"%mse2in_2_2+\
"  2 3   %E         # me2(2,3)\n"%mse2in_2_3+\
"  3 1   %E         # me2(3,1)\n"%mse2in_3_1+\
"  3 2   %E         # me2(3,2)\n"%mse2in_3_2+\
"  3 3   %E         # me2(3,3)\n"%mse2in_3_3+\
"Block MSL2IN    #\n"+\
"  1 1   %E         # ml2(1,1)\n"%msl2in_1_1+\
"  1 2   %E         # ml2(1,2)\n"%msl2in_1_2+\
"  1 3   %E         # ml2(1,3)\n"%msl2in_1_3+\
"  2 1   %E         # ml2(2,1)\n"%msl2in_2_1+\
"  2 2   %E         # ml2(2,2)\n"%msl2in_2_2+\
"  2 3   %E         # ml2(2,3)\n"%msl2in_2_3+\
"  3 1   %E         # ml2(3,1)\n"%msl2in_3_1+\
"  3 2   %E         # ml2(3,2)\n"%msl2in_3_2+\
"  3 3   %E         # ml2(3,3)\n"%msl2in_3_3+\
"Block MSQ2IN    #\n"+\
"  1 1   %E         # mq2(1,1)\n"%msq2in_1_1+\
"  1 2   %E         # mq2(1,2)\n"%msq2in_1_2+\
"  1 3   %E         # mq2(1,3)\n"%msq2in_1_3+\
"  2 1   %E         # mq2(2,1)\n"%msq2in_2_1+\
"  2 2   %E         # mq2(2,2)\n"%msq2in_2_2+\
"  2 3   %E         # mq2(2,3)\n"%msq2in_2_3+\
"  3 1   %E         # mq2(3,1)\n"%msq2in_3_1+\
"  3 2   %E         # mq2(3,2)\n"%msq2in_3_2+\
"  3 3   %E         # mq2(3,3)\n"%msq2in_3_3+\
"Block MSU2IN    #\n"+\
"  1 1   %E         # mu2(1,1)\n"%msu2in_1_1+\
"  1 2   %E         # mu2(1,2)\n"%msu2in_1_2+\
"  1 3   %E         # mu2(1,3)\n"%msu2in_1_3+\
"  2 1   %E         # mu2(2,1)\n"%msu2in_2_1+\
"  2 2   %E         # mu2(2,2)\n"%msu2in_2_2+\
"  2 3   %E         # mu2(2,3)\n"%msu2in_2_3+\
"  3 1   %E         # mu2(3,1)\n"%msu2in_3_1+\
"  3 2   %E         # mu2(3,2)\n"%msu2in_3_2+\
"  3 3   %E         # mu2(3,3)\n"%msu2in_3_3+\
"Block MV2IN     #\n"+\
"  1 1   %E         # mv2(1,1)\n"%mv2in_1_1+\
"  1 2   %E         # mv2(1,2)\n"%mv2in_1_2+\
"  1 3   %E         # mv2(1,3)\n"%mv2in_1_3+\
"  2 1   %E         # mv2(2,1)\n"%mv2in_2_1+\
"  2 2   %E         # mv2(2,2)\n"%mv2in_2_2+\
"  2 3   %E         # mv2(2,3)\n"%mv2in_2_3+\
"  3 1   %E         # mv2(3,1)\n"%mv2in_3_1+\
"  3 2   %E         # mv2(3,2)\n"%mv2in_3_2+\
"  3 3   %E         # mv2(3,3)\n"%mv2in_3_3+\
"Block YVIN    #\n"+  \
"  1 1   %E         # Yv(1,1)\n"%yvin_1_1+\
"  1 2   %E         # Yv(1,2)\n"%yvin_1_2+\
"  1 3   %E         # Yv(1,3)\n"%yvin_1_3+\
"  2 1   %E         # Yv(2,1)\n"%yvin_2_1+\
"  2 2   %E         # Yv(2,2)\n"%yvin_2_2+\
"  2 3   %E         # Yv(2,3)\n"%yvin_2_3+\
"  3 1   %E         # Yv(3,1)\n"%yvin_3_1+\
"  3 2   %E         # Yv(3,2)\n"%yvin_3_2+\
"  3 3   %E         # Yv(3,3)\n"%yvin_3_3+\
"Block LAMNIN    #\n"+  \
"  1 1   %E         # lamN(1,1)\n"%lamnin_1_1+\
"  1 2   %E         # lamN(1,2)\n"%lamnin_1_2+\
"  1 3   %E         # lamN(1,3)\n"%lamnin_1_3+\
"  2 1   %E         # lamN(2,1)\n"%lamnin_2_1+\
"  2 2   %E         # lamN(2,2)\n"%lamnin_2_2+\
"  2 3   %E         # lamN(2,3)\n"%lamnin_2_3+\
"  3 1   %E         # lamN(3,1)\n"%lamnin_3_1+\
"  3 2   %E         # lamN(3,2)\n"%lamnin_3_2+\
"  3 3   %E         # lamN(3,3)\n"%lamnin_3_3+\
"Block TDIN    #\n"+ \
"  1 1   %E         # Td(1,1)\n"%tdin_1_1+\
"  1 2   %E         # Td(1,2)\n"%tdin_1_2+\
"  1 3   %E         # Td(1,3)\n"%tdin_1_3+\
"  2 1   %E         # Td(2,1)\n"%tdin_2_1+\
"  2 2   %E         # Td(2,2)\n"%tdin_2_2+\
"  2 3   %E         # Td(2,3)\n"%tdin_2_3+\
"  3 1   %E         # Td(3,1)\n"%tdin_3_1+\
"  3 2   %E         # Td(3,2)\n"%tdin_3_2+\
"  3 3   %E         # Td(3,3)\n"%tdin_3_3+\
"Block TEIN    #\n"+\
"  1 1   %E         # Te(1,1)\n"%tein_1_1+\
"  1 2   %E         # Te(1,2)\n"%tein_1_2+\
"  1 3   %E         # Te(1,3)\n"%tein_1_3+\
"  2 1   %E         # Te(2,1)\n"%tein_2_1+\
"  2 2   %E         # Te(2,2)\n"%tein_2_2+\
"  2 3   %E         # Te(2,3)\n"%tein_2_3+\
"  3 1   %E         # Te(3,1)\n"%tein_3_1+\
"  3 2   %E         # Te(3,2)\n"%tein_3_2+\
"  3 3   %E         # Te(3,3)\n"%tein_3_3+\
"Block TUIN    #\n"+ \
"  1 1   %E         # Tu(1,1)\n"%tuin_1_1+\
"  1 2   %E         # Tu(1,2)\n"%tuin_1_2+\
"  1 3   %E         # Tu(1,3)\n"%tuin_1_3+\
"  2 1   %E         # Tu(2,1)\n"%tuin_2_1+\
"  2 2   %E         # Tu(2,2)\n"%tuin_2_2+\
"  2 3   %E         # Tu(2,3)\n"%tuin_2_3+\
"  3 1   %E         # Tu(3,1)\n"%tuin_3_1+\
"  3 2   %E         # Tu(3,2)\n"%tuin_3_2+\
"  3 3   %E         # Tu(3,3)\n"%tuin_3_3+\
"Block TVIN    #\n"+ \
"  1 1   %E         # Tv(1,1) (av: %E)\n"%(tvin_1_1, av_1_1)+\
"  1 2   %E         # Tv(1,2) (av: %E)\n"%(tvin_1_2, av_1_2)+\
"  1 3   %E         # Tv(1,3) (av: %E)\n"%(tvin_1_3, av_1_3)+\
"  2 1   %E         # Tv(2,1) (av: %E)\n"%(tvin_2_1, av_2_1)+\
"  2 2   %E         # Tv(2,2) (av: %E)\n"%(tvin_2_2, av_2_2)+\
"  2 3   %E         # Tv(2,3) (av: %E)\n"%(tvin_2_3, av_2_3)+\
"  3 1   %E         # Tv(3,1) (av: %E)\n"%(tvin_3_1, av_3_1)+\
"  3 2   %E         # Tv(3,2) (av: %E)\n"%(tvin_3_2, av_3_2)+\
"  3 3   %E         # Tv(3,3) (av: %E)\n"%(tvin_3_3, av_3_3)+\
"Block TLAMNIN    #\n"+\
"  1 1   %E         # TLN(1,1) (alamn: %E)\n"%(tlamnin_1_1, alamn_1_1)+\
"  1 2   %E         # TLN(1,2) (alamn: %E)\n"%(tlamnin_1_2, alamn_1_2)+\
"  1 3   %E         # TLN(1,3) (alamn: %E)\n"%(tlamnin_1_3, alamn_1_3)+\
"  2 1   %E         # TLN(2,1) (alamn: %E)\n"%(tlamnin_2_1, alamn_2_1)+\
"  2 2   %E         # TLN(2,2) (alamn: %E)\n"%(tlamnin_2_2, alamn_2_2)+\
"  2 3   %E         # TLN(2,3) (alamn: %E)\n"%(tlamnin_2_3, alamn_2_3)+\
"  3 1   %E         # TLN(3,1) (alamn: %E)\n"%(tlamnin_3_1, alamn_3_1)+\
"  3 2   %E         # TLN(3,2) (alamn: %E)\n"%(tlamnin_3_2, alamn_3_2)+\
"  3 3   %E         # TLN(3,3) (alamn: %E)\n"%(tlamnin_3_3, alamn_3_3)

f=open(name, "w")
f.write(txt)
f.close()
print 'GsphenoInput suceesfully running...'
