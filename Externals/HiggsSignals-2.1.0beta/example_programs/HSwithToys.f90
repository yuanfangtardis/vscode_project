!--------------------------------------------------------------------------------------
program HSwithToys
!
! This example program is part of HiggsSignals (TS 25/01/2013).
!--------------------------------------------------------------------------------------
! This example program shows how HiggsSignals (HS) can be run on toy experiments. We
! first run HS with SM input with a Higgs mass of 126 GeV. From the result of this
! run we can obtain the predicted signal strength modifiers for each peak observable
! directly from HiggsSignals. As a demonstration, these are then set as observed (toy)
! signal rates of the various observables. We then re-run HiggsSignals on the new
! observables on the same model, i.e. observed and predicted signal rates are equal,
! thus the resulting chi^2 should be zero.
!--------------------------------------------------------------------------------------
 use theory_colliderSfunctions
 use usefulbits, only : vsmall 
 use usefulbits_hs,only : analyses
 use pc_chisq, only : print_peaks_to_LaTeX,print_cov_mu_to_file
 use io, only : get_peakinfo_from_HSresults, get_number_of_observables,&
 &              get_ID_of_peakobservable, HiggsSignals_create_SLHA_output,&
 &              HiggsSignals_create_SLHA_output_default
  	  
 implicit none
 integer :: nH,nHplus,ndf, ii, jj, kk
 double precision :: Chisq, Chisq_mu, Chisq_mh, Pvalue
!  double precision, allocatable :: dMh(:)
!  double precision :: dCS(5),dBR(5),dggh, dbbh
  double precision :: SMGamma_h, dMh
 double precision :: Mh,GammaTotal,ghjss_s,ghjss_p,ghjcc_s,ghjcc_p, &
&                    ghjbb_s,ghjbb_p,ghjtt_s,ghjtt_p, &
&                    ghjmumu_s,ghjmumu_p,ghjtautau_s,ghjtautau_p, &
&                    ghjWW,ghjZZ,ghjZga,ghjgaga,ghjgg,	&
&                    ghjhiZ
  double precision :: mupred
  integer :: domH, nHcomb
  integer :: ntotal, npeakmu, npeakmh, nmpred, nanalyses, ID
  integer :: i,npoints
  character(len=8) :: istring
  character(len=300) :: inputfilename,outputfilename
  character(len=300) :: stem
  character(LEN=300) :: temp
  integer :: number_args, stat

 double precision :: SMCS_lhc13_gg_H,SMCS_lhc13_bb_H,SMCS_lhc13_vbf_H,&
 &	SMCS_lhc13_HW, SMCS_lhc13_HZ, SMCS_lhc13_ttH,SMBR_Hbb,SMBR_Hmumu,SMBR_Htautau,&
 &  SMBR_HWW,SMBR_HZZ

  nH=1
  nHplus=0

  Mh  = 125.09D0
  dMh =   0.0D0
!-------------------------- HiggsSignals ------------------------------!

!---- Initialize HiggsSignals and pass the name of the experimental analysis folder  ----!
  call initialize_HiggsSignals(nH,nHplus,"LHC13_CMS_H-gaga") 
!  call initialize_HiggsSignals(nH,nHplus,"latestresults-1.4.0-LHCinclusive")   
!  call setup_thu_observables(1)   
!---- Set the Higgs mass parametrization (1: box, 2:gaussian, 3:box+gaussian)	 	 ----!
  call setup_pdf(2)
!---- Set the output level (0: silent, 1: screen output, 2: even more output,...) 	 ----!
  call setup_output_level(1)
!---- Pass the Higgs mass uncertainty to HiggsSignals							 	 ----!
  call HiggsSignals_neutral_input_MassUncertainty(dMh)
!---- Use symmetric rate errors? (0: original(default), 1: averaged-symmetrical)     ----!
! call setup_symmetricerrors(0)
!---- Allow anti-correlated signal strength measurements? (0: no, 1: yes(default) )  ----!
! call setup_anticorrelations_in_mu(1)
!---- Setup a wider assignment range                                                 ----!
 call setup_assignmentrange_massobservables(4.0D0)

 write(*,*) 'gg->H   = ', SMCS_lhc13_gg_H(Mh)
 write(*,*) 'bb->H   = ', SMCS_lhc13_bb_H(Mh)
 write(*,*) 'pp->H   = ', SMCS_lhc13_gg_H(Mh)+SMCS_lhc13_bb_H(Mh)
 write(*,*) 'pp->Hqq = ', SMCS_lhc13_vbf_H(Mh)
 write(*,*) 'pp->HW  = ', SMCS_lhc13_HW(Mh)
 write(*,*) 'pp->HZ  = ', SMCS_lhc13_HZ(Mh)
 write(*,*) 'pp->Htt = ', SMCS_lhc13_ttH(Mh)
 write(*,*) 'BR(H->bb)     = ', SMBR_Hbb(Mh)  
 write(*,*) 'BR(H->mumu)   = ', SMBR_Hmumu(Mh)
 write(*,*) 'BR(H->tautau) = ', SMBR_Htautau(Mh)
 write(*,*) 'BR(H->WW)     = ', SMBR_HWW(Mh)
 write(*,*) 'BR(H->ZZ)     = ', SMBR_HZZ(Mh)



!----HiggsBounds/Signals effective couplings input. 
!  	 These have to be inserted for the model which we want to test, i.e. we would have
!    to write an interface to set via arguments in the executables call, or reading
!    in a text file, etc.
!----For now, we set them by hand to the SM values (for demonstration):
  ghjss_s=1d0
  ghjss_p=0d0
  ghjcc_s=1d0
  ghjcc_p=0d0
  ghjbb_s=1d0
  ghjbb_p=0d0
  ghjtt_s=1d0
  ghjtt_p=0d0         
  ghjmumu_s=1d0
  ghjmumu_p=0d0  
  ghjtautau_s=1d0
  ghjtautau_p=0d0
  ghjWW=1d0
  ghjZZ=1d0
  ghjZga=1d0
  ghjgaga=1d0
  ghjgg=1d0
  ghjhiZ=0d0

  GammaTotal=SMGamma_h(Mh)

  call HiggsBounds_neutral_input_properties(Mh,GammaTotal)

  call HiggsBounds_neutral_input_effC(                 &  
     &          ghjss_s,ghjss_p,ghjcc_s,ghjcc_p,       &
     &          ghjbb_s,ghjbb_p,ghjtt_s,ghjtt_p,       &
     &          ghjmumu_s,ghjmumu_p,                   &
     &          ghjtautau_s,ghjtautau_p,               &
     &          ghjWW,ghjZZ,ghjZga,                    &
     &          ghjgaga,ghjgg,ghjhiZ)

!-Run HS on the original experimental data in order to evaluate the model predictions	  
  call run_HiggsSignals(1, Chisq_mu, Chisq_mh, Chisq, ndf, Pvalue)
!-Print out the observables to a LaTeX table
!  call print_peaks_to_LaTeX
!  call print_cov_mu_to_file

!-Get the number of the peak-observables (Don't care about ntotal, npeakmh, nmpred, nanalyses)
  call get_number_of_observables(ntotal, npeakmu, npeakmh, nmpred, nanalyses)

!-We now want to set the measurements to those values predicted by the model.
!-The mass measurement for each peak observable will be set to Mh here.

!-Loop over the number of peak observables
  do kk=1,npeakmu
!--Get for each peak observable its unique ID:
   call get_ID_of_peakobservable(kk, ID)
!--Get the predicted signal strength modifier (mupred) for this peak observable:
   call get_peakinfo_from_HSresults(ID, mupred, domH, nHcomb)
!--Assign this value as (toy) measurement for this peak observable:
   call assign_toyvalues_to_peak(ID, mupred, Mh)
  enddo
  
  call setup_output_level(0)	!-Do a print-out to the screen
    
!-Set the HiggsSignals input (again!)
  call HiggsBounds_neutral_input_effC(                 &  
     &          ghjss_s,ghjss_p,ghjcc_s,ghjcc_p,       &
     &          ghjbb_s,ghjbb_p,ghjtt_s,ghjtt_p,       &
     &          ghjmumu_s,ghjmumu_p,                   &
     &          ghjtautau_s,ghjtautau_p,               &
     &          ghjWW,ghjZZ,ghjZga,                    &
     &          ghjgaga,ghjgg,ghjhiZ)

!-Now, we run on the toy observables with the same input, i.e. model predictions and
!-measurements are equal and thus the chi^2 should be zero.	  
  call run_HiggsSignals(1, Chisq_mu, Chisq_mh, Chisq, ndf, Pvalue)

!-Create a new SLHA file with the HiggsSignals output blocks.
!-The second argument controls how much is written
!  (0: only the BLOCK 'HiggsSignalsResults', 1: full HiggsSignals SLHA output)
!-The new file must not exist:
! (note: this system call does not work with ifort)
  call system('rm -f results/HSwithToys.slha',status=stat)
  call HiggsSignals_create_SLHA_output("results/HSwithToys.slha",0)
!-Alternatively, we could use
!  call HiggsSignals_create_SLHA_output_default(0)
!-where the filename is set to "HS-output.slha".

  call finish_HiggsSignals
 
end program HSwithToys
!--------------------------------------------------------------------------------------
