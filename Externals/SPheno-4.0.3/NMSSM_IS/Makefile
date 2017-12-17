modname = NInvSeesaw  # as an example  
PreDef = -DGENERATIONMIXING 
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoNInvSeesaw.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoNInvSeesaw:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoNInvSeesaw.o 
	 ${F90} -o SPhenoNInvSeesaw ${LFlagsB} SPhenoNInvSeesaw.o ../lib/libSPhenoNInvSeesaw.a ../lib/libSPheno.a
	 mv SPhenoNInvSeesaw ../bin
	 rm SPhenoNInvSeesaw.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_NInvSeesaw.o)  \
 ${name}(RGEs_NInvSeesaw.o)   \
 ${name}(Couplings_NInvSeesaw.o) ${name}(TreeLevelMasses_NInvSeesaw.o) ${name}(TadpoleEquations_NInvSeesaw.o) \
 ${name}(LoopCouplings_NInvSeesaw.o) ${name}(CouplingsForDecays_NInvSeesaw.o) \
 ${name}(TreeLevel_Decays_NInvSeesaw.o) \
 ${name}(hh.o)  ${name}(Ah.o)  ${name}(Hpm.o)  ${name}(Sd.o)  ${name}(Su.o)  ${name}(Se.o)  ${name}(SvIm.o)  ${name}(SvRe.o)  ${name}(Chi.o)  ${name}(Cha.o)  ${name}(Glu.o)  ${name}(Fv.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(EffPotFunctions.o) ${name}(DerivativesEffPotFunctions.o) ${name}(EffectivePotential_NInvSeesaw.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_NInvSeesaw.o) \
 ${name}(LoopMasses_NInvSeesaw.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_NInvSeesaw.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecayhh_NInvSeesaw.o)  ${name}(LoopDecayAh_NInvSeesaw.o)  ${name}(LoopDecayHpm_NInvSeesaw.o)  ${name}(LoopDecaySd_NInvSeesaw.o)  ${name}(LoopDecaySu_NInvSeesaw.o)  ${name}(LoopDecaySe_NInvSeesaw.o)  ${name}(LoopDecaySvIm_NInvSeesaw.o)  ${name}(LoopDecaySvRe_NInvSeesaw.o)  ${name}(LoopDecayChi_NInvSeesaw.o)  ${name}(LoopDecayCha_NInvSeesaw.o)  ${name}(LoopDecayGlu_NInvSeesaw.o)  ${name}(LoopDecayFv_NInvSeesaw.o) \
 ${name}(Wrapper_LoopDecay_hh_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Ah_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Hpm_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Sd_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Su_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Se_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_SvIm_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_SvRe_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Chi_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Cha_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Glu_NInvSeesaw.o)  ${name}(Wrapper_LoopDecay_Fv_NInvSeesaw.o) ${name}(OneLoopDecays_NInvSeesaw.o) \
 ${name}(BranchingRatios_NInvSeesaw.o) ${name}(HiggsCS_NInvSeesaw.o) ${name}(RunSM_NInvSeesaw.o) \
 ${name}(LowEnergy_NInvSeesaw.o) \
${name}(FlavorKit_LFV_NInvSeesaw.o) ${name}(FlavorKit_QFV_NInvSeesaw.o) ${name}(FlavorKit_Observables_NInvSeesaw.o)\
 ${name}(Boundaries_NInvSeesaw.o)  ${name}(InputOutput_NInvSeesaw.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
