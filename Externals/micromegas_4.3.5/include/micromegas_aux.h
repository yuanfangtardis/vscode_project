#ifndef __MICRO_AUX__
#define __MICRO_AUX__

#include"micromegas.h"
#include"../CalcHEP_src/include/VandP.h"

#ifdef __cplusplus
extern "C" {
#endif 

#include "../CalcHEP_src/c_source/dynamicME/include/dynamic_cs.h"
#include "../CalcHEP_src/c_source/dynamicME/include/vp.h"
#include "../CalcHEP_src/c_source/ntools/include/polint.h"

extern  char * trim(char *);

/*==================== displayPlot =================*/
extern void displayPlotN(char * title, double xMin, double xMax,  char*xName,  int dim, int Scale, int N, double**f,double**ff,char**Y);
extern void displayPlot(char*title,double xMin,double xMax, char*xName,  int dim, int Scale, int N, ...);
extern void displayFunc(char*title,   double (*F)(double), double x1,double x2, char * varName , int lScale);
extern void displayFuncArg(char*title, double (*F)(double,void *), void* Arg, double x1  ,double x2, char * varName , int lScale);

/*======================
   Lock/UnLock service
========================*/
extern int checkLockFile(int *delay);
extern void removeLock(int fd);
/*
extern char *  prepareWorkPlace(void);
extern int cleanworkPlace(void);
*/
extern char*WORK;

/*=======================
      Odd particles
========================*/
extern int Nodd;
extern  ModelPrtclsStr * OddPrtcls;
extern int createTableOddPrtcls(void);
extern char * OddParticles(int mode);
extern char * EvenParticles(void); 
    
/*=============================================
C->F and F->C    string convertation     
===============================================*/

extern void  cName2f(char*c_name,char*f_name,int len);
extern void  fName2c(char*f_name,char*c_name,int len);

/*=============================================
Fortran output
===============================================*/
extern void fortreread_(int* N, char * fname, int len);

/*====================================
   Tools for integration 
=====================================*/

extern double simpson(double (*func)(double), double a, double b, double eps);
extern double gauss(double (*func)(double), double a, double b, int n);
extern double vegas_chain(int ndim, double (*Integrand)(double*, double),
                          int N0, double Nfact, double eps,double * dI,void (*clean)(void));


extern int  odeint(double*ystart,int nvar,double x1,double x2, double eps,
                   double h1, void(*derivs)(double,double*,double *));

extern int stiff( int first,double xstart, double xend, int n, double*y, double *yscal, double eps, double*htry,
    void (*derivs)(double, double*, double*, double,double*,double*));
extern int stifbs(int first,double xstart, double xend, int nv, double*y, double *yscal, double eps, double*htry,
    void (*derivs)(double,double*,double*,double,double*,double*));
   
    
/*==== Tool  for interpolation  ====*/
extern int buildInterpolation( double (*Fun)(double), double x1,double x2, 
            double eps, double delt, int * N, double ** xa, double **ya);
            
extern void spline(double*x,double*y,int n,double*y2);            
extern void splint(double*xa, double*ya, double*y2a, int n, double x, double *y);
            
/*======= special functions ========*/
extern double bessI0(double x);
extern double bessK0(double x);
extern double bessK1(double x);
extern double bessK2(double x);
extern double K2pol(double x); /*bessk1(1/x)*exp(1/x)*sqrt(2/M_PI/x);*/
extern double K1pol(double x); /*bessk2(1/x)*exp(1/x)*sqrt(2/M_PI/x);*/

/*======== read Table =============*/

extern int readTable(char * fileName, int *Ncolumn, double **tab);


/* Hidden interface with CalcHEP */
extern int FError;
extern int OnlyTEQ0;

extern int pname2lib(char*pname, char * libname);
extern numout*newProcess_(int twidth, int model,int UG,char*Process,
          char * excludeVirtual,char*excludeOut,char*lib,int usr);


//=====  2->2 processes ===========

extern double (*sqme22)(int nsub, double GG, REAL *pvect, REAL*cb_coeff, int * err_code); 

extern int     kin22(double PcmIn,REAL * pmass);
extern double  kinematic_23(double Pcm,int i3, double M45, double cs1, double cs2,  double fi,REAL*pmass, REAL*pvect);
extern double  kinematic_24(double Pcm,int i3, int i4, double M1, double M2, double xcos,double xcos1, double xcos2, double fi1, double fi2,
                            REAL*pmass, REAL * P);
                            
extern double  dSigma_dCos(double  cos_f);
extern int  nsub22;

extern double  vcs22(numout * cc,int nsub,int * err); 



#define NTOF(X) extern forCalchep1 X; double X(double ok){return findValW(#X);}

typedef  double (forCalchep1)(double);
typedef  double (forCalchep2)(double,double);

/*  Loop integrals I1 ... I5   DreesNojiri */
extern double   LintIk(int II,double MSQ,double MQ,double MNE);

extern int readVarSpecial(char *fname, int nVar, char ** names);

extern double parton_x( int pNum, double  Q);

extern double (*parton_alpha)(double q);
extern double (*parton_distr)(int pNum, double x, double q);



extern double convStrFun2(double x, double q, int pc1, int pc2, int ppFlag ); 
                           /* result of convolution of structure functions 
                              of pc1 and pc2 particles  */

extern int  wimpPos(void);


extern int vPolar(int out1,int out2,int out3,double*left,double*right,double*lng);
extern double  plazmaWidth(char *process,double T);

extern double cs23MM(numout*cc, int nsub, double Pcm, int fast,int ii3, double M45min, double M45max);


extern double amoeba(double *p, double *dp, int ndim, double (*f)(double *), double eps, int *nCalls);
                                                    

extern REAL *Qaddress;

extern double lGGhSM(double Mh, double aQCDh, double Mcp,double Mbp,double Mtp,double vev);
extern double lAAhSM(double Mh, double aQCDh, double Mcp,double Mbp,double Mtp,double vev);
extern int hbBlocksMO(char*fname,int *nHch);
extern int  LilithMO(char * fname);

extern int makePdtConv(void);
extern int initPDFconv(void);

// Statistics
extern double FeldmanCousins(int n0, double b, double cl);
extern double ch2pval(int nexp, double ch2obs);

//  python
void  pythonversion_(int *n1,int *n2);

//  LHAPDF


#include"../CalcHEP_src/include/num_in.h"

#include"microPath.h"


#ifdef __cplusplus
}
#endif 


#endif
