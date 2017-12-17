#ifndef  __MICROMEGAS__
#define  __MICROMEGAS__

#ifdef __cplusplus
extern "C" {
#endif 

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>
#include<unistd.h>

#include"../CalcHEP_src/include/num_out.h"
#include"../CalcHEP_src/c_source/plot/include/plot.h"
#include"../CalcHEP_src/c_source/ntools/include/n_proc.h"
extern char * CDM1, *CDM2, *aCDM1, *aCDM2;

typedef struct numout
{
  void * handle;
  double ** link;
  double *Q,*SC;
  int init;
  CalcHEP_interface * interface; 
} numout;

extern int VVdecay;

extern int sortOddParticles(char * name);

typedef  struct { double par[41]; }  MOcommonSTR;
extern   MOcommonSTR  mocommon_;

#define Mcdm        mocommon_.par[1]
#define ScalarFFPd  mocommon_.par[2]
#define ScalarFFPu  mocommon_.par[3]
#define ScalarFFPs  mocommon_.par[4]
#define pVectorFFPd mocommon_.par[5]
#define pVectorFFPu mocommon_.par[6]
#define pVectorFFPs mocommon_.par[7]
#define SigmaFFPd   mocommon_.par[8]
#define SigmaFFPu   mocommon_.par[9]
#define SigmaFFPs   mocommon_.par[10]

#define ScalarFFNd  mocommon_.par[11]
#define ScalarFFNu  mocommon_.par[12]
#define ScalarFFNs  mocommon_.par[13]
#define pVectorFFNd mocommon_.par[14]
#define pVectorFFNu mocommon_.par[15]
#define pVectorFFNs mocommon_.par[16]
#define SigmaFFNd   mocommon_.par[17]
#define SigmaFFNu   mocommon_.par[18]
#define SigmaFFNs   mocommon_.par[19]

#define Fermi_a     mocommon_.par[20]
#define Fermi_b     mocommon_.par[21]
#define Fermi_c     mocommon_.par[22]

#define Rsun        mocommon_.par[23]
#define rhoDM       mocommon_.par[24]
#define Vearth      mocommon_.par[25]

#define K_dif       mocommon_.par[26]      
#define L_dif       mocommon_.par[27]
#define Delta_dif   mocommon_.par[28]
#define Tau_dif     mocommon_.par[29]
#define Vc_dif      mocommon_.par[30]
#define Rdisk       mocommon_.par[31]

#define deltaY      mocommon_.par[32]
#define dmAsymm     mocommon_.par[33]
#define Vesc        mocommon_.par[34]
#define Vrot        mocommon_.par[35]
#define fracCDM2    mocommon_.par[36]
#define Mcdm1       mocommon_.par[37]
#define Mcdm2       mocommon_.par[38]
#define Tstart      mocommon_.par[39]
#define Tend        mocommon_.par[40]

typedef  struct { int flag[4];}     MOflagsSTR;
extern   MOflagsSTR moflags_;

#define WIMPSIM   moflags_.flag[0] 
#define forRocks  moflags_.flag[1]

typedef  struct { char txt1[20]; char txt2[20];} MoCommonCH; 

extern  MoCommonCH mocommonch_;
         
#define CDM1_ mocommonch_.txt1 
#define CDM2_ mocommonch_.txt2 


extern double sWidth;

extern int ForceUG;
/*============================
     Particles
==============================*/

extern int  pNum(char * name);  /* returns PDG code */
extern double pMass(char * name); /* returns particle mass */
extern char *   pdg2name(int pdg); 
/*======= Subprocesses ===========*/
  typedef struct txtListStr
  {  struct txtListStr * next;
     char  *txt;
  } txtListStr;

  typedef txtListStr * txtList;
  
extern txtList  makeDecayList(char * pname, int nx);
extern void massFilter(double M, txtList * List);
extern void gammaGluFilter(txtList* List);
extern int process2Lib(char * process,char * lib);
extern void cleanTxtList(txtList L);
extern double findBr(txtList L, char * pattern);
extern void printTxtList(txtList L, FILE *f);

/*=============================
     (1)2->2 matrix elements
=============================*/
extern double decay2Info(char * pname, FILE* f);
extern numout *  newProcess(char*Process);
extern double GGscale;
extern double cs22(numout * cc, int nsub,double P,  double cos1, double cos2 , int * err);
extern int  procInfo1(numout*cc, int *nsub, int * nin, int *nout);
extern int procInfo2(numout*cc,int nsub,char**name,REAL*mass);
extern REAL Helicity[2];

extern void PDTList(void);
extern int  setPDT(char*name);
extern char pdfName[50];
void LHAPDFList(void);
extern void  setLHAPDF(int nset, char *name);
extern int restorePDF(char*oldPDF);
extern double hCollider(double Pcm, int pp, int nf, double Qren,double Qfact, char * name1,char *name2,double pTmin,int wrt);
extern double monoJet(void);
double pWidth(char *name, txtList *L);


extern double convStrFun3(double x, double q, int pc1, int pc2, int pp);

/*===================
      Variables 
=====================*/

extern REAL*varAddress(char * name); 
extern int    assignVal(const char * name, double val);
extern int    findVal(char * name,double * val);
extern int    assignValW(const char * name, double val);
extern double findValW(char * name);
extern int    readVar(char *fname);
  
/*===========================================
   Checking of parameters 
  ===========================================*/ 
extern void printVar(FILE *f);
extern void  printMasses(FILE * f, int sort);
extern void  printHiggs(FILE * f);
extern char * nextOdd(int N,double * Mass);

/*=====   Constraints ==== */
extern int Zinvisible(void);
extern int LspNlsp_LEP(double *cs_out);
extern int Zprimelimits(void);

/*=====================================
    Relic density evaluation 
  =====================================*/
  
typedef struct { double weight; char*prtcl[5];} aChannel;
extern aChannel*omegaCh;  
extern aChannel* vSigmaTCh;

extern double vSigmaCC(double T,numout* cc,int mode);
   
extern int loadHeffGeff(char*fname);
extern double  hEff(double T);
extern double  gEff(double T);
extern double vSigma(double T,double Beps ,int Fast);
extern double darkOmega(double *Xf,int Fast, double Beps);
extern double darkOmega2(double fast, double Beps0);
extern double darkOmegaExt(double *Xf, double (*f0)(double), double (*f1)(double));

extern double vs1120F(double T);       
extern double vs2200F(double T);          
extern double vs1100F(double T);      
extern double vs1210F(double T);       
extern double vs1122F(double T);       
extern double vs2211F(double T);
extern double vs1110F(double T);
extern double vs2220F(double T);
extern double vs1112F(double T);
extern double vs1222F(double T);
extern double vs1220F(double T);
extern double vs2210F(double T);
extern double vs2221F(double T);
extern double vs1211F(double T);


extern double dY1F(double T);
extern double dY2F(double T);
extern double Y1F(double T);
extern double Y2F(double T);
extern double YF(double T);

extern double darkOmegaFO(double *Xf,int fast,double Beps);
extern double printChannels(double Xf,double cut,double Beps,int prcnt,FILE *f );   
extern double oneChannel(double Xf,double Beps,char*n1,char*n2,char*n3,char*n4);
extern void improveCrossSection(long n1,long n2,long n3,long n4,double Pcm, 
                                                            double * addr);

extern double Yeq(double T);
extern double Yeq1(double T);
extern double Yeq2(double T);

extern double Beps;
extern int Fast_;
/*===============================================
    Annihilation spectra
=================================================*/

#define NZ 250                                                                                

extern double calcSpectrum(int key, double *Sg, double *Se, double *Sp, double *Sne, double*Snu, double *Snl, int*errcode);
/* input parameters:
       a)  v velocity in c=1 units, v is about 0.001.
       b)  outP   0-gamma; 1-positron; 2-antiproton; 3,4,5 -
         for neutrinos (electron, muon and tau correspondinly)
output parameters:
       a) returned value v*sigma/M_lop^2 in sm^3/(GeV^2*sec)
       b) array of 250 double elements to store spectra.
       c) errcode !=0 if  in process of decays of outgoing particles 
          we get a non-SM particle which has not 1->2 decays.  
*/

extern aChannel* vSigmaCh;
extern double zInterp(double z, double * tab);
/* input parameter:
        a) z=log(E/Mlop)
        b) double tab[250] table obtainaed by calcSpectrum;
   output:
         dN/dz where N is the number of points in spectrum.
*/

extern double Zi(int i);
/*
  returns  log(E_i/Mlop) corresponting to i-th position in spectrum table. 
*/

extern double SpectdNdE(double E, double * tab);
extern void  fillSpect(double (*dNdE)(double ), double Emax, double * SpectAr);
extern void   addSpectrum(double*Spect,double*toAdd);
extern double   spectrInfo(double Emin,double*tab , double*Etot);
/* input parameters:
  a)    Emin - minimal energy under considerstion
  b)    double tab[250]  - table for spectrum distribution.
  output:
  a)    Ntot - total number of particles with energy E> Xmin*mLsp
  b)    Everage energy of particle  divided on mLsp
*/
extern double spectrInt(double Emin,double Emax, double * tab);
extern void  spectrMult( double *spect, double(*func)(double));


extern void boost(double Y, double M0, double mx, double*tab);
extern int displaySpectrum(char*mess,double Emin,double Emax,double*tab);
extern int displaySpectra(char * title, double Emin,double Emax, int N,...);

extern void setHaloProfile( double (*haloProfile)(double));
extern void setClumpConst(double f,double rho);
extern double rhoClumpsConst(double r);
extern void setRhoClumps(double (*cProfile)(double));


extern double HaloFactor(double fi,double dfi);
/*
  Intergates halo squred density along the ling of slight.
  fi - angle in radians
  rhoQ  presents squred density of Dark Matter in [GeV/cm^3]^2 units as 
  a function of cerner galactic distance in kpc units.
  
  Return value is done in  GeV^2/cm^5   
*/ 
extern int Gtot_style;
extern void gammaFluxTab(double fi,double  dfi, double sigmaV, double *Sp, double *Sobs);
extern double gammaFlux(double fi, double dfi,  double dSigmadE); 

extern void gammaFluxTabGC(double l,double b, double dl,double db, double sigmaV, double *Sp, double *Sobs);
extern double gammaFluxGC(double l, double b, double dl,double db, double dSigmadE);
      
extern void solarModulation(double PHI, double mass, double * inTab, double * outTab);
   
extern double hProfileZhao(double r);
extern void setProfileZhao(double alpha, double beta ,double gamma,double Rc);

extern double hProfileEinasto(double r);
extern void setProfileEinasto(double alpha);
extern double noClumps(double r); 

/*============ Positron and antiproton propagation =================*/

extern int vcsMode;
extern double pBarBackgroundFlux(double E);
extern void pBarBackgroundTab(double Emax, double *pBarTab);

extern double posiFlux(double E, double sigmav, double *iSpect);

extern void posiFluxTab(double Emin, double sigmav, double *iSpect, double *outSpect);

extern void pbarFluxTab(double Emin, double sigmav, double *iSpect, double *outSpect);
   
extern double pbarFlux(double ek, double dSigmadE);


                                                                                
extern char * outNames[6];

extern int basicSpectra(double Mass,int pdgN, int outN, double * tab);


/*=========== Neutrino from Sun and Earth ==================*/

extern void ATMnuBackgroundTab(double Fi, double dFi, double *nuTab,double *nuBarTab);
extern int neutrinoFlux(double (*vfv)(double), int forSun,double *nu, double *nu_bar);
extern int basicNuSpectra(int forSun, double Mass,int pdgN,int pol, double*nu, double*nuB); 
extern void muonContained(double*nu,double*Nu,double rho, double*mu);
extern void muonUpward(double*nu,double*Nu,double*mu);
extern void muonUpward_I(double*nu,double*Nu,double*mu);


extern double  captureAux(double(*vfv)(double),int forSun, double M_cdm, double csIp, double csIn,double csDp,double csDn);
extern double  ATMmuonUpward(double cosFi, double E);
extern double  ATMmuonContained(double cosFi, double E, double rho);

extern double  ATMdNudE(double E);
extern double nuAttenuation(int nu, double cs,double E);
extern double atmNuFlux(int nu,double cs, double E);
extern double atmNuFlux_(int nu,double cs, double E);

#include"ic22.h"


/*  Direct Detection */
extern int  QCDcorrections, Twist2On;
extern void calcScalarFF(double muDmd,double msDmd,double sigmaPiN,double sigma0);
extern void calcScalarQuarkFF(double muDmd, double msDmd, double sigmaPiN, double sigmaS);
extern int  nucleonAmplitudes(char * WINP, double*pA0, double*pA5, double*nA0,double*nA5); 

extern void  SetFermi(double C,double B, double a);
extern double FermiFF(int A, double Qfermi);


extern double Maxwell(double v);
extern double maxwell_(double*v);
extern void SetfDelta(double V0);
extern double fDvDelta(double v);

extern void setRecoilEnergyGrid(double step, int dim);

extern double nucleusRecoil(
double(*fDv)(double),   /*  f(v)/v where f(v) is velocity distribution, 
                            v in km/s  */
int A, int Z, double J, /* nuclear atomic number, charge and spin   */

void (*Sxx)(double,double*,double*,double*), /* SD formfactors */ 
double * dNdE   /* distribution of number of events respect to recoil 
                 energy  in 1/(Kg*Day*Kev) inits. Presinted as array 
                 with 200 elements with 1KeV step (from 0 to 199KeV) */
);
/* nucleusRecoil returns the total number of events for 1day*1Kg */
                  
extern double nucleusRecoil0(double (*vfv)(double),
 int A,int Z,double J,double Sp,double Sn, double*dNdE);
 
extern double nucleusRecoilAux(
      double(*vfv)(double),
      int A, int Z, double J,
      void (*Sxx)(double,double*,double*,double*),
      double cs_SI_P,double cs_SI_N,  double cs_SD_P, double cs_SD_N,
      double * dNdE);

extern double nucleusRecoil0Aux(
      double(*vfv)(double),
      int A, int Z, double J,
      double Sp, double Sn,
      double cs_SI_P,double cs_SI_N,  double cs_SD_P, double cs_SD_N,
      double * dNdE);

extern double MaxGapLim(double x, double mu);
/* S.Yellin, Phys.Rev. D66,032005(2002)                                                                                                                        
  Lut us  a theoretical model  predicts homogenious event distribution
  with everage number of events mu. Let experiment gets a gap bitween points
  where according to theory x point are expected. Then the theoretical model
  is non-confirmed with probability MaxGap
*/

extern double widthSMh(double Mh);
extern double brSMhGG(double Mh);
extern double brSMhAA(double Mh);


extern int displayRecoilPlot(double * tab, char * text, double E1, double E2);

extern double cutRecoilResult(double *tab, double E1, double E2);
extern double dNdERecoil(double *tab, double E);

extern void killPlots(void);

extern void smodels(int nf,double csMinFb, char*fileName,int wrt);


typedef void (SxxType)(double,double*,double*,double*);

extern SxxType SxxF19,SxxNa23, SxxAl27, SxxSi29, SxxK39, SxxGe73, SxxNb93,SxxTe125,SxxI127,SxxXe129,SxxXe131,SxxPb207,
SxxNa23A,SxxSi29A,SxxTe125A,SxxI127A,SxxXe129A,SxxXe131A,SxxGe73A,SxxXe131B;


typedef double (double2double)(double);

/* for testing SD form factors */
extern  int PlotSS(double (*f)(double),  int A,char * title, double Emax);
extern  int Plot3SS(double xiP,double xiN,
         double (*S00)(double), double (*S01)(double),double (*S11)(double),
         int A, double J, char * title, double Emax);
extern  int Plot3SS0(double xiP,double xiN, double Sp, double Sn,
    int A, double J, char* title, double Emax);
     
      
#define Sp_H1     ( 0.5)
#define Sn_H1       0.
#define Sp_He3    (-0.081)
#define Sn_He3      0.552
#define Sp_F19    ( 0.4751)
#define Sn_F19    (-0.0087)
#define Sp_Na23   ( 0.2477)
#define Sn_Na23   ( 0.0198)
#define Sp_Te125  ( 0.001) 
#define Sn_Te125  ( 0.287)
#define Sp_I127     0.309 
#define Sn_I127     0.075
#define Sp_Xe129    0.028  
#define Sn_Xe129    0.359
#define Sp_Xe131  (-0.009)  
#define Sn_Xe131  (-0.227)
#define Sp_Al27   ( 0.343)
#define Sn_Al27     0.0296
#define Sp_Si29   (-0.0019)
#define Sn_Si29   ( 0.1334)
#define Sp_K39    (-0.184) 
#define Sn_K39    ( 0.054)
#define Sp_Ge73   ( 0.03)
#define Sn_Ge73   ( 0.378)
#define Sp_Nb93   ( 0.46)
#define Sn_Nb93   ( 0.08) 
#define Sp_Cs133  (-0.370)   /* Phis.Lett.B254,220,(1991)*/
#define Sn_Cs133  ( 0.003)  
#define Sp_Pb207  (-0.010)  
#define Sn_Pb207  (-0.149)


/*
http://www.nndc.bnl.gov/nudat2/indx_sigma.jsp
*/
#define J_H1    0.5
#define J_He3   0.5
#define J_F19   0.5
#define J_Na23  1.5
#define J_Al27  2.5
#define J_Si29  0.5
#define J_K39   1.5
#define J_Ge73  4.5
#define J_Nb93  4.5
#define J_Te125 0.5 
#define J_I127  2.5
#define J_Xe129 0.5
#define J_Xe131 1.5
#define J_Cs133 3.5
#define J_Pb207 0.5

#define Z_H    1
#define Z_He   2
#define Z_F    9
#define Z_Na  11
#define Z_Al  13
#define Z_Si  14
#define Z_K   19
#define Z_Ge  32
#define Z_Nb  41
#define Z_Te  52
#define Z_I   53
#define Z_Xe  54
#define Z_Pb  82
#define Z_Cs  55

#ifdef __cplusplus
}
#endif 

#include"../CalcHEP_src/c_source/SLHAplus/include/SLHAplus.h"

#endif
