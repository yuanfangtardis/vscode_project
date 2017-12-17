modname = seesaw1nmssm  # as an example  
PreDef = -DGENERATIONMIXING 
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoseesaw1nmssm.a
 
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
bin/SPhenoseesaw1nmssm:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoseesaw1nmssm.o 
	 ${F90} -o SPhenoseesaw1nmssm ${LFlagsB} SPhenoseesaw1nmssm.o ../lib/libSPhenoseesaw1nmssm.a ../lib/libSPheno.a
	 mv SPhenoseesaw1nmssm ../bin
	 rm SPhenoseesaw1nmssm.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_seesaw1nmssm.o)  \
 ${name}(RGEs_seesaw1nmssm.o)   \
 ${name}(Couplings_seesaw1nmssm.o) ${name}(TreeLevelMasses_seesaw1nmssm.o) ${name}(TadpoleEquations_seesaw1nmssm.o) \
 ${name}(LoopCouplings_seesaw1nmssm.o) ${name}(CouplingsForDecays_seesaw1nmssm.o) \
 ${name}(TreeLevel_Decays_seesaw1nmssm.o) \
 ${name}(svre.o)  ${name}(svim.o)  ${name}(hpm.o)  ${name}(hh.o)  ${name}(Ah.o)  ${name}(su.o)  ${name}(sd.o)  ${name}(se.o)  ${name}(glu.o)  ${name}(cha.o)  ${name}(chi.o)  ${name}(fv.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(EffPotFunctions.o) ${name}(DerivativesEffPotFunctions.o) ${name}(EffectivePotential_seesaw1nmssm.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_seesaw1nmssm.o) \
 ${name}(LoopMasses_seesaw1nmssm.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_seesaw1nmssm.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecaySvRe_seesaw1nmssm.o)  ${name}(LoopDecaySvIm_seesaw1nmssm.o)  ${name}(LoopDecayHpm_seesaw1nmssm.o)  ${name}(LoopDecayhh_seesaw1nmssm.o)  ${name}(LoopDecayAh_seesaw1nmssm.o)  ${name}(LoopDecaySu_seesaw1nmssm.o)  ${name}(LoopDecaySd_seesaw1nmssm.o)  ${name}(LoopDecaySe_seesaw1nmssm.o)  ${name}(LoopDecayGlu_seesaw1nmssm.o)  ${name}(LoopDecayCha_seesaw1nmssm.o)  ${name}(LoopDecayChi_seesaw1nmssm.o)  ${name}(LoopDecayFv_seesaw1nmssm.o) \
 ${name}(Wrapper_LoopDecay_SvRe_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_SvIm_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Hpm_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_hh_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Ah_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Su_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Sd_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Se_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Glu_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Cha_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Chi_seesaw1nmssm.o)  ${name}(Wrapper_LoopDecay_Fv_seesaw1nmssm.o) ${name}(OneLoopDecays_seesaw1nmssm.o) \
 ${name}(BranchingRatios_seesaw1nmssm.o) ${name}(HiggsCS_seesaw1nmssm.o) ${name}(RunSM_seesaw1nmssm.o) \
 ${name}(LowEnergy_seesaw1nmssm.o) \
${name}(FlavorKit_LFV_seesaw1nmssm.o) ${name}(FlavorKit_QFV_seesaw1nmssm.o) ${name}(FlavorKit_Observables_seesaw1nmssm.o)\
 ${name}(Boundaries_seesaw1nmssm.o)  ${name}(InputOutput_seesaw1nmssm.o) 
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
