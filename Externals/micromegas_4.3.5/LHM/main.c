/*====== Modules ===============
   Keys to switch on 
   various modules of micrOMEGAs  
================================*/
      
#define MASSES_INFO      
  /* Display information about mass spectrum  */

#define CONSTRAINTS 

//#define HIGGSBOUNDS
//#define HIGGSSIGNALS
//#define SMODELS 
#define LILITH

#define OMEGA            
  /* Calculate relic density and display contribution of  individual channels */
#define INDIRECT_DETECTION  
  /* Compute spectra of gamma/positron/antiprotons/neutrinos for DM annihilation; 
     Calculate <sigma*v>;
     Integrate gamma signal over DM galactic squared density for given line 
     of sight; 
     Calculate galactic propagation of positrons and antiprotons.      
  */
      
/*#define RESET_FORMFACTORS*/
  /* Modify default nucleus form factors, 
    DM velocity distribution,
    A-dependence of Fermi-dencity
  */     
#define CDM_NUCLEON     
  /* Calculate amplitudes and cross-sections for  CDM-mucleon collisions */  

/*#define CDM_NUCLEUS*/      
  /* Calculate number of events for 1kg*day and recoil energy distibution
      for various nuclei
  */

#define NEUTRINO

//#define DECAYS

//#define CROSS_SECTIONS   
/*===== end of Modules  ======*/

/*===== Options ========*/
/*#define SHOWPLOTS*/
     /* Display  graphical plots on the screen */ 
#define CLEAN
/*===== End of DEFINE  settings ===== */


#include"../include/micromegas.h"
#include"../include/micromegas_aux.h"
#include"lib/pmodel.h"


int main(int argc,char** argv)
{  int err;
   char cdmName[10];
   int spin2, charge3,cdim;
   
  ForceUG=0;  // to Force Unitary Gauge assign 1 
  
  if(argc==1)
  { 
      printf(" Correct usage:  ./main  <file with parameters> \n");
      printf("Example: ./main data1.par\n");
      exit(1);
  }
                               
  err=readVar(argv[1]);
  
  if(err==-1)     {printf("Can not open the file\n"); exit(1);}
  else if(err>0)  { printf("Wrong file contents at line %d\n",err);exit(1);}
           
  

  err=sortOddParticles(cdmName);



  if(err) { printf("Can't calculate %s\n",cdmName); return 1;}
  
   qNumbers(cdmName, &spin2, &charge3, &cdim);
   printf("\nDark matter candidate is '%s' with spin=%d/2\n",
    cdmName,       spin2); 
   if(charge3) { printf("Dark Matter has electric charge %d/3\n",charge3); exit(1);}
   if(cdim!=1) { printf("Dark Matter is a color particle\n"); exit(1);}
#ifdef MASSES_INFO
{
  printf("\n=== MASSES OF HIGGS AND ODD PARTICLES: ===\n");
  printHiggs(stdout);
  printMasses(stdout,1);
}
#endif

#ifdef CONSTRAINTS
{ double csLim;
  if(Zinvisible()) printf("Excluded by Z->invisible\n");
  if(LspNlsp_LEP(&csLim)) printf("LEP excluded by e+,e- -> DM q qbar  Cross section= %.2E\n",csLim);
}
#endif


#if defined(HIGGSBOUNDS) || defined(HIGGSSIGNALS)
{   int NH0=1, NHch=0; // number of neutral and charged Higgs particles.
    double HB_result,HB_obsratio,HS_observ,HS_chi2, HS_pval;
    char HB_chan[100]={""}, HB_version[50], HS_version[50]; 
     NH0=hbBlocksMDL("HB.in",&NHch);
     system("echo 'BLOCK DMASS\n 25  2  '>> HB.in");
#include "../include/hBandS.inc"
#ifdef HIGGSBOUNDS
     printf("HB(%s): result=%.0f  obsratio=%.2E  channel= %s \n", HB_version,HB_result,HB_obsratio,HB_chan);
#endif
#ifdef HIGGSSIGNALS
     printf("HS(%s): Nobservables=%.0f chi^2 = %.2E pval= %.2E\n",HS_version,HS_observ,HS_chi2, HS_pval);  
#endif
}
#endif

#ifdef LILITH
{  double m2logL, m2logL_reference=0,pvalue;
   int exp_ndf,n_par=0,ndf;
   char call_lilith[100], Lilith_version[20];

   if(LilithMDL("Lilith_in.xml"))
   {        
#include "../include/Lilith.inc"
      if(ndf)
      {
        printf("LILITH(DB%s:  -2*log(L): %.2f; -2*log(L_reference): %.2f; ndf: %d; p-value: %.2E \n", 
        Lilith_version, m2logL,m2logL_reference,ndf,pvalue);
      }  
   } else printf("LILITH: there is no Higgs candidate\n");
}     
#endif


#ifdef SMODELS
{  int result=0;
   double Rvalue=0;
   char analysis[30]={},topology[30]={}; 
#include "../include/SMODELS.inc" 
}   
#endif 



#ifdef OMEGA
{ int fast=1;
  double Beps=1.E-5, cut=0.01;
  double Omega,Xf;   
  int i;
  
// to exclude processes with virtual W/Z in DM   annihilation      
    VZdecay=0; VWdecay=0; cleanDecayTable(); 

// to include processes with virtual W/Z  also  in co-annihilation 
//   VZdecay=2; VWdecay=2; cleanDecayTable(); 
  
  printf("\n==== Calculation of relic density =====\n");  
  Omega=darkOmega(&Xf,fast,Beps);
  printf("Xf=%.2e Omega=%.2e\n",Xf,Omega);
  if(Omega>0)printChannels(Xf,cut,Beps,1,stdout);   

//   VZdecay=1; VWdecay=1; cleanDecayTable();  // restore default

}
#endif


#ifdef INDIRECT_DETECTION
{ 
  int err,i;
  double Emin=1,/* Energy cut  in GeV   */  sigmaV;
  double vcs_gz,vcs_gg;
  char txt[100];
  double SpA[NZ],SpE[NZ],SpP[NZ];
  double FluxA[NZ],FluxE[NZ],FluxP[NZ];
  double * SpNe=NULL,*SpNm=NULL,*SpNl=NULL;
  double Etest=Mcdm/2;
  
printf("\n==== Indirect detection =======\n");  

  sigmaV=calcSpectrum(4,SpA,SpE,SpP,SpNe,SpNm,SpNl ,&err);
    /* Returns sigma*v in cm^3/sec.     SpX - calculated spectra of annihilation.
       Use SpectdNdE(E, SpX) to calculate energy distribution in  1/GeV units.
       
       First parameter 1-includes W/Z polarization
                       2-includes gammas for 2->2+gamma
                       4-print cross sections             
    */
  printf("sigmav=%.2E[cm^3/s]\n",sigmaV);  


  if(SpA)
  { 
     double fi=0.1,dfi=0.05; /* angle of sight and 1/2 of cone angle in [rad] */ 

     gammaFluxTab(fi,dfi, sigmaV, SpA,  FluxA);     
     printf("Photon flux  for angle of sight f=%.2f[rad]\n"
     "and spherical region described by cone with angle %.2f[rad]\n",fi,2*dfi);
#ifdef SHOWPLOTS
     sprintf(txt,"Photon flux[cm^2 s GeV]^{1} at f=%.2f[rad], cone angle %.2f[rad]",fi,2*dfi);
     displaySpectrum(txt,Emin,Mcdm,FluxA);
#endif
     printf("Photon flux = %.2E[cm^2 s GeV]^{-1} for E=%.1f[GeV]\n",SpectdNdE(Etest, FluxA), Etest);       
  }

  if(SpE)
  { 
    posiFluxTab(Emin, sigmaV, SpE,  FluxE);
#ifdef SHOWPLOTS     
    displaySpectrum("positron flux [cm^2 s sr GeV]^{-1}" ,Emin,Mcdm,FluxE);
#endif
    printf("Positron flux  =  %.2E[cm^2 sr s GeV]^{-1} for E=%.1f[GeV] \n",
    SpectdNdE(Etest, FluxE),  Etest);           
  }
  
  if(SpP)
  { 
    pbarFluxTab(Emin, sigmaV, SpP,  FluxP  ); 
#ifdef SHOWPLOTS    
     displaySpectrum("antiproton flux [cm^2 s sr GeV]^{-1}" ,Emin, Mcdm,FluxP);
#endif
    printf("Antiproton flux  =  %.2E[cm^2 sr s GeV]^{-1} for E=%.1f[GeV] \n",
    SpectdNdE(Etest, FluxP),  Etest);             
  }
}  
#endif

#ifdef RESET_FORMFACTORS
{
/* 
   The user has approach to form factors  which specifies quark contents 
   of  proton and nucleon via global parametes like
      <Type>FF<Nucleon><q>
   where <Type> can be "Scalar", "pVector", and "Sigma"; 
         <Nucleon>     "P" or "N" for proton and neutron
         <q>            "d", "u","s"

   calcScalarFF( Mu/Md, Ms/Md, sigmaPiN[MeV], sigma0[MeV])  
   calculates and rewrites Scalar form factors
*/
  printf("\n======== RESET_FORMFACTORS ======\n");
 
  printf("protonFF (default) d %.2E, u %.2E, s %.2E\n",ScalarFFPd, ScalarFFPu,ScalarFFPs);                               
  printf("neutronFF(default) d %.2E, u %.2E, s %.2E\n",ScalarFFNd, ScalarFFNu,ScalarFFNs);

//  To restore default form factors of  version 2  call 
//  calcScalarQuarkFF(0.553,18.9,55.,243.5);
 
  calcScalarFF(0.553,18.9,70.,35.);

  printf("protonFF (new)     d %.2E, u %.2E, s %.2E\n",ScalarFFPd, ScalarFFPu,ScalarFFPs);                               
  printf("neutronFF(new)     d %.2E, u %.2E, s %.2E\n",ScalarFFNd, ScalarFFNu,ScalarFFNs);


}
#endif

#ifdef CDM_NUCLEON
{ double pA0[2],pA5[2],nA0[2],nA5[2];
  double Nmass=0.939; /*nucleon mass*/
  double SCcoeff;        
  int i;
printf("\n==== Calculation of CDM-nucleons amplitudes  =====\n");   
    nucleonAmplitudes(CDM1, pA0,pA5,nA0,nA5);
    printf("CDM[antiCDM]-nucleon micrOMEGAs amplitudes:\n");
    printf("proton:  SI  %.3E [%.3E]  SD  %.3E [%.3E]\n",pA0[0], pA0[1],  pA5[0], pA5[1] );
    printf("neutron: SI  %.3E [%.3E]  SD  %.3E [%.3E]\n",nA0[0], nA0[1],  nA5[0], nA5[1] ); 

  SCcoeff=4/M_PI*3.8937966E8*pow(Nmass*Mcdm/(Nmass+ Mcdm),2.);
    printf("CDM[antiCDM]-nucleon cross sections[pb]:\n");
    printf(" proton  SI %.3E [%.3E] SD %.3E [%.3E]\n",
       SCcoeff*pA0[0]*pA0[0],SCcoeff*pA0[1]*pA0[1],3*SCcoeff*pA5[0]*pA5[0],3*SCcoeff*pA5[1]*pA5[1]);
    printf(" neutron SI %.3E [%.3E] SD %.3E [%.3E]\n",
       SCcoeff*nA0[0]*nA0[0],SCcoeff*nA0[1]*nA0[1],3*SCcoeff*nA5[0]*nA5[0],3*SCcoeff*nA5[1]*nA5[1]);

}
#endif
  
#ifdef CDM_NUCLEUS
{ double dNdE[300];
  double nEvents;

printf("\n======== Direct Detection ========\n");    

  nEvents=nucleusRecoil(Maxwell,73,Z_Ge,J_Ge73,SxxGe73,dNdE);

  printf("73Ge: Total number of events=%.2E /day/kg\n",nEvents);
  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",
                                   cutRecoilResult(dNdE,10,50));
                                                                                                         
#ifdef SHOWPLOTS
    displayRecoilPlot(dNdE,"Distribution of recoil energy of 73Ge",0,199);
#endif

  nEvents=nucleusRecoil(Maxwell,131,Z_Xe,J_Xe131,SxxXe131,dNdE);

  printf("131Xe: Total number of events=%.2E /day/kg\n",nEvents);
  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",
                                   cutRecoilResult(dNdE,10,50));                                   
#ifdef SHOWPLOTS
    displayRecoilPlot(dNdE,"Distribution of recoil energy of 131Xe",0,199);
#endif

  nEvents=nucleusRecoil(Maxwell,23,Z_Na,J_Na23,SxxNa23,dNdE);

  printf("23Na: Total number of events=%.2E /day/kg\n",nEvents);
  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",
                                   cutRecoilResult(dNdE,10,50));                                   
#ifdef SHOWPLOTS
    displayRecoilPlot(dNdE,"Distribution of recoil energy of 23Na",0,199);
#endif

  nEvents=nucleusRecoil(Maxwell,127,Z_I,J_I127,SxxI127,dNdE);

  printf("I127: Total number of events=%.2E /day/kg\n",nEvents);
  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",
                                   cutRecoilResult(dNdE,10,50));                                   
#ifdef SHOWPLOTS
    displayRecoilPlot(dNdE,"Distribution of recoil energy of 127I",0,199);
#endif
  
}
#endif 
#ifdef NEUTRINO
{ double nu[NZ], nu_bar[NZ],mu[NZ];
  int forSun=1;
  double Emin=1;

 printf("\n===============Neutrino Telescope=======  for  ");
 if(forSun) printf("Sun\n"); else printf("Earth\n");

  err=neutrinoFlux(Maxwell,forSun, nu,nu_bar);
#ifdef SHOWPLOTS
  displaySpectra("neutrino fluxes [1/Year/km^2/GeV]",Emin,Mcdm,2,nu,"nu",nu_bar,"nu_bar");
#endif
  printf(" E>%.1E GeV neutrino/anti-neutrino fluxes   %.2E/%.2E [1/Year/km^2]\n",Emin,
          spectrInfo(Emin,nu,NULL), spectrInfo(Emin,nu_bar,NULL));

// ICE CUBE
  if(forSun) printf("IceCube22 exclusion confidence level = %.2%%E\n", 100*exLevIC22(nu,nu_bar,NULL));
/* Upward events */    

  Emin=0.1;
  muonUpward(nu,nu_bar, mu);
#ifdef SHOWPLOTS  
  displaySpectrum("Upward muons[1/Year/km^2/GeV]",1,Mcdm/2,mu);
#endif
  printf(" E>%.1E GeV Upward muon flux    %.3E [1/Year/km^2]\n",Emin,spectrInfo(Emin,mu,NULL));
/* Contained events */
  muonContained(nu,nu_bar,1., mu);
#ifdef SHOWPLOTS  
  displaySpectrum("Contained  muons[1/Year/km^3/GeV]",Emin,Mcdm,mu);
#endif
  printf(" E>%.1E GeV Contained muon flux %.3E [1/Year/km^3]\n",Emin,spectrInfo(Emin,mu,NULL));
}
#endif

#ifdef DECAYS
{  
  txtList L;
   double width,br;
   char * pname;
   printf("\n================= Decays ==============\n");
      
   pname = "H";
   width=pWidth(pname,&L);
   printf("\n%s :   total width=%.2E \n and Branchings:\n",pname,width);
   printTxtList(L,stdout);

   pname = "~W+";
   width=pWidth(pname,&L);
   printf("\n%s :   total width=%.2E \n and Branchings:\n",pname,width);
   printTxtList(L,stdout);
}
#endif

#ifdef CROSS_SECTIONS

{
  char* next,next_;
  double nextM;
    
  next=nextOdd(1,&nextM); 
  if(next && nextM<1000)  
  { 
     double cs, Pcm=6500, Qren, Qfact, pTmin=0;
     int nf=3;
     char*next_=antiParticle(next);
     Qren=Qfact=nextM; 
 
     printf("\npp > nextOdd  at sqrt(s)=%.2E GeV\n",2*Pcm);  
  
     Qren=Qfact;
     cs=hCollider(Pcm,1,nf,Qren, Qfact, next,next_,pTmin,1);
     printf("Production of 'next' odd particle: cs(pp-> %s,%s)=%.2E[pb]\n",next,next_, cs);
  }  
}
 
#endif 


#ifdef CLEAN 
  system("rm -f HB.* HS.* hb.* hs.*  debug_channels.txt debug_predratio.txt  Key.dat");
  system("rm -f Lilith_*   particles.py*");
  system("rm -f   smodels.in  smodels.log  smodels.out  summary.*");         
#endif 

  killPlots();
  return 0;
}
