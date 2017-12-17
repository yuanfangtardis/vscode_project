#include"micromegas.h"
#include"micromegas_aux.h"
#include"micromegas_f.h"

#define NEn 28  /* Number of Energy points for interpolation */
#define Nin 16 
#define Nout 7
#define QCUT 25 //2.5
#define X1CUT (2.E-2)

#define V0 (Vrot/299792.*1.5957691)  /* 2*sqrt(2/PI).  10^(-6)*Mslp < Width */

//#define V0 1E-3
 
//#define DISPLAY_SPECTRA 
/*#define ECTEST*/

static double Mcdm0;

extern double cs23(numout*cc, int nsub, double Pcm, int ii3);


aChannel* vSigmaCh=NULL;
static int nAnCh=0;
static double GG=1.23;

static float phidiff[Nin][Nout][NEn][NZ];


double Zi(int i) { return log(1.E-7)*pow((double)(i-1)/(double)(NZ),1.5) ;}
static  int Iz(double z) { return NZ*pow(z/log(1.E-7),1./1.5)+1; }

void  fillSpect(double (*dNdE)(double ), double Emax, double * SpectAr)
{ int i;
  SpectAr[0]=Emax;
  for(i=1;i<NZ;i++) 
  { double E=exp(Zi(i))*Emax;  
    SpectAr[i]=dNdE(E)*E;
  }
}


/* v*cs22 at v=0 */  
double  vcs22(numout * cc,int nsub,int * err)
{
   int i;
   double pcm,r;
   REAL pmass[4], pvect[16];
   
//printf("Mb4a=%E\n", findValW("Mb"));    
   for(i=1;i<=cc->interface->nvar;i++) if(cc->link[i]) cc->interface->va[i]=*(cc->link[i]);
//printf("Mbb=%E Q=%E\n", findValW("Mb"),  findValW("Q")); 
   if( cc->interface->calcFunc()>0 ) {*err=4;  return 0;}
//printf("Mbb_=%E Q=%E\n", findValW("Mb"),  findValW("Q"));
   *(cc->interface->gtwidth)=0;
   *(cc->interface->twidth)=0;
   *(cc->interface->gswidth)=0;
//printf("Mb4c=%E\n", findValW("Mb"));    
   for(i=0;i<4;i++) printf("%s ",  cc->interface->pinf(nsub,1+i,pmass+i,NULL));
printf("\n");   
   *err=0;
   if(pmass[0]+pmass[1] <= pmass[2]+pmass[3]) return 0;
   for(i=0;i<16;i++) pvect[i]=0;
//printf("Mb4d=%E\n", findValW("Mb")); 
   pcm= decayPcm(pmass[0]+pmass[1],pmass[2],pmass[3]);
   for(i=0;i<2; i++) pvect[4*i]=pmass[i];
   for(i=2;i<4; i++) pvect[4*i]=sqrt(pmass[i]*pmass[i] +pcm*pcm);
   pvect[8+3]=pcm;
   pvect[12+3]=-pcm;
   r=cc->interface->sqme(nsub,GG,pvect,NULL,err);
   return 3.8937966E8*r*pcm/(16*M_PI*pmass[0]*pmass[1]*(pmass[0]+pmass[1]));  
}
 
/* New 2->3 */ 
static REAL pmass[5],pvect[20];
static int code[5];
static int iA,ix,iX;
static numout* cc23;
static double X0=0.01, dSigmadE_x0, Egamma,X1=0.8 ,dSigmadE_x1,dSigmadE_x1_e;
static int PrintOn=0;
static double dSigmadCos23(double csfi)
{
  double pcm1,pcm2,ms,md,chY,shY,r,M;
  int i,err_code;

  for(i=0;i<20;i++) pvect[i]=0;

  pvect[0]=pmass[0];
  pvect[4]=pmass[1];

  pvect[4*iA]= Egamma;
  pvect[4*iA+3] = -Egamma;  

  ms=pmass[ix]+pmass[iX];
  md=pmass[iX]-pmass[ix];
  pcm1=Egamma;

  M=4*pmass[0]*(pmass[0]-Egamma);
  if(M<=ms*ms) return 0;
  
  M= sqrt(M);
  
  pcm2=sqrt((M*M-ms*ms)*(M*M-md*md))/M/2;
  
  pvect[4*ix]=sqrt(pmass[ix]*pmass[ix]+pcm2*pcm2);
  pvect[4*ix+3]=pcm2*csfi;
  pvect[4*ix+2]=pcm2*sqrt(1-csfi*csfi);
  
  pvect[4*iX]= sqrt(pmass[iX]*pmass[iX]+pcm2*pcm2);
  pvect[4*iX+3]=-pvect[4*ix+3];
  pvect[4*iX+2]=-pvect[4*ix+2];  

  chY=sqrt(1+pcm1*pcm1/M/M);
  shY= pcm1/M;  
  
  { double p0,p3;
    p0=pvect[4*ix], p3=pvect[4*ix+3];
    pvect[4*ix]=  chY*p0 + shY*p3;
    pvect[4*ix+3]=shY*p0 + chY*p3;

    p0=pvect[4*iX]; p3=pvect[4*iX+3];
    pvect[4*iX]=  chY*p0 + shY*p3;
    pvect[4*iX+3]=shY*p0 + chY*p3;
  }
  
/*
  for(i=0;i<4;i++)
  { int j; 
    double s=0;
    s=pvect[i]+pvect[4+i]-pvect[8+i]-pvect[12+i]-pvect[16+i] ;
    printf("s(%d)=%Egamma\n",i,s);
  }              
*/  
err_code=0;
  r=(cc23->interface->sqme)(1,GG,pvect,NULL,&err_code)*pcm1*pcm2/(128*M*pmass[0]*pmass[0]*M_PI*M_PI*M_PI);
if(r<0) r=0;
  if(err_code) return 0;
//printf("csfi=%E r=%e\n", csfi,r);  
  return r*3.8937966E8;
}

static double dSigmadFi23(double fi)
{if(fi==0 || fi==M_PI) return 0; return dSigmadCos23(cos(fi))*sin(fi);}

static double dSigmadE(double E)
{ double r;
   Egamma=E;
/*
   if(pmass[ix]>1.E-3*Mcdm0 && pmass[iX]>1.E-3*Mcdm0  ) 
                       r= simpson(dSigmadFi23,0,M_PI,1.E-4);
   else { printf("dSigmadCos23\n"); //displayFunc("dSigmadCos23",dSigmadCos23, -1 , 1,0,"dSigmadCos23");
                 r= simpson(dSigmadCos23,-0.9,0.9,1.E-4); printf("ok\n");  
*/
//                   r= gauss(dSigmadCos23,-1,1,7); }
   r= gauss(dSigmadCos23,-1,1,7);                 
//   r= simpson(dSigmadFi23,0,M_PI,1.E-4);
   return r;
}

static int addGamma(int pdg)
{ pdg=abs(pdg); 
  if(pdg<=6) return 0;
  if(pdg>=11 && pdg<=15) return 0;
  if(pdg==81||pdg==83) return 0;
  return 1;
}  

static double dSigmadERest(double E)
{
  double res, eps,ms= (pmass[ix]+pmass[iX]);
  int l,nn[2]={ix,iX};
  
  if(E+sqrt(E*E + ms*ms)>=1.999999*Mcdm0) return 0;
  res= dSigmadE(E); if(res==0.) return 0;
  eps=ms/2/Mcdm0;

//  if( !(addGamma(code[iX]) && addGamma(code[ix])))
  { double subtract=0,norm=0,x=E/Mcdm0;
    double csmax,pcm,pcm0;
    
     if(pmass[ix]>1.E-3*Mcdm0 && pmass[iX]>1.E-3*Mcdm0 ) csmax=1; else csmax=0.999;
     pcm=decayPcm(2*Mcdm0*sqrt(1-x),pmass[ix],pmass[iX]);
     for(l=0;l<2;l++)  
     {  
       double kappa;
       if(!addGamma(code[nn[l]]))
       { kappa=sqrt(1/(1+pow(pmass[nn[l]]/pcm,2)));
         subtract += log((1+kappa*csmax)/(1-kappa*csmax))*(1-x+x*x/2 -eps*eps/2)-kappa*(1-x)*csmax;
       }  
       pcm0=decayPcm(2*Mcdm0,pmass[ix],pmass[iX]);
       kappa=sqrt(1/(1+pow(pmass[nn[l]]/pcm0,2)));
       norm+=        log((1+csmax*kappa)/(1-csmax*kappa))*(1 -eps*eps/2)-kappa*csmax;
     }
     res-=subtract/norm*dSigmadE_x0/x; 
  }
  if(res<0) return 0;
  
  return res;
}

static double Xe;
static double FE(double cs)
{ 
  Egamma=2*Mcdm0*(1-Xe)/(1+cs);
  if(Egamma<X0*Mcdm0) return 0;
  if(Egamma/Mcdm0 -(1-Xe) < -1.E-4) return 0;
  return dSigmadCos23(cs)*2/(1+cs);
}

static double FEfi(double fi)
{ 
  if(fi< 1.E-4  || fi > M_PI - 1.E-4) return 0;
  return FE(cos(fi))*sin(fi);
}

static double dSigmadEe(double E)
{
   double xe,x1=0.96,x2=0.98;
   xe=Xe=E/Mcdm0; 
   if(xe> x2+1.E-4)
   { 
     return   ((x2-xe)*dSigmadEe(x1*Mcdm0) + (xe-x1)*dSigmadEe(x2*Mcdm0))/(x2-x1);
   }           
   if(Xe>X0 )
   { double csMin=(2*(1-Xe) -1)*0.9999;
     double csMax=2*(1-Xe)/X0 -1;
     double r;
/*     csMax=1;     

        if(csMin<-0.98) csMin=-0.98;
        if(csMax> 0.98) csMax=0.98;
        return simpson(FE,csMin,csMax,1.E-3);

        if(csMin<-1) csMin=-1;
        if(csMax> 1) csMax=1;
        return gauss(FE,csMin,csMax,7);     
*/
     if(csMin<-1) csMin=-1;
     if(csMax> 1) csMax=1;
     r= simpson(FEfi,acos(csMax),acos(csMin),1.E-4);
     return r;
   } else return 0;
}
#ifdef DISPLAY_SPECTRA
static double EdSigmadEe(double E) {return E*dSigmadEe(E);}
static double EdSigmadERest(double E) {return E*dSigmadERest(E);}
#endif

static double Spectra22A(char*name1,char*name2,double ** Spectra,txtList plusA)
{
  double vcs=0;
  int i,l;
  txtList cRec;
  int spin2Dm;
  
  for(l=0;l<6;l++) if(Spectra[l]) { Spectra[l][0]=Mcdm0; for(i=1;i<NZ;i++) Spectra[l][i]=0;}
  if(Spectra[0]==NULL && Spectra[1]==NULL) return 0;

if(Spectra[0])   
  for(l=0;l<nModelParticles;l++)
  {
     if(ModelPrtcls[l].NPDG==22) 
     { outNames[0]=ModelPrtcls[l].name;
       break;
     }
  } 
  if(l==nModelParticles) return 0;
  
  for(cRec=plusA;cRec;cRec=cRec->next)
  { 
     char lib[50]="";
     char*N[5];
     process2Lib(cRec->txt,lib);
     cc23=getMEcode(0,0,cRec->txt,NULL,NULL,lib);
     if(cc23==NULL) continue;
     if(passParameters(cc23)) continue; 
     *(cc23->interface->gtwidth)=0;
     *(cc23->interface->twidth)=0;
     *(cc23->interface->gswidth)=0;

     for(i=0;i<5;i++) N[i]=cc23->interface->pinf(1,i+1,pmass+i,code+i);
    
     cc23->interface->pinfAux(1,1,&spin2Dm,NULL,NULL);
     
     for(ix=0,i=2;i<5;i++) if(code[i]==22) iA=i; else if(!ix)ix=i;else iX=i;
     if(Spectra[0] && dSigmadE(X1*Mcdm0) > X1CUT*dSigmadE_x1 )
     {  double x2Sum; 
        dSigmadE_x0=3*X0*(dSigmadE(X0*Mcdm0)+dSigmadE(3*X0*Mcdm0)-2*dSigmadE(2*X0*Mcdm0));
#ifdef DISPLAY_SPECTRA
     {  char buff[100];
        sprintf(buff,"d(vSigma(%s))/dE(A) [pb/GeV]",cRec->txt);      
        displayFunc(dSigmadERest, Mcdm0*X0, Mcdm0,buff);
     }
#endif 
       x2Sum=0; 
       for(i=1;i<NZ;i++) 
       { double dSigmaDz=0,x=exp(Zi(i));
         if(x>X0)
         { dSigmaDz=x*Mcdm0*dSigmadERest(x*Mcdm0);
           Spectra[0][i]+=dSigmaDz;
           x2Sum+=(Zi(i)-Zi(i+1))*dSigmaDz;
         }else  Spectra[0][i]+=dSigmaDz;
       }
       { 
         vcs+=x2Sum;
         vSigmaCh=realloc(vSigmaCh, (nAnCh+2)*sizeof(aChannel));
         vSigmaCh[nAnCh].weight=x2Sum;   
         { int j; for(j=0;j<5;j++) vSigmaCh[nAnCh].prtcl[j]=N[j]; }
         nAnCh++;                     
       }
     }
     if(Spectra[1] && abs(code[iX])==11 && code[ix]+code[iX]==0  && pmass[ix]==0 && 
       code[0]==code[1] && spin2Dm==1 && dSigmadEe(X1*Mcdm0) > X1CUT*dSigmadE_x1_e  ) 
     {
        
#ifdef DISPLAY_SPECTRA 
  displayFunc(dSigmadEe, Mcdm0*X0, Mcdm0," electron spectrum");
{ double csA,csE,xcsA,xcsE; 
  csA=simpson(dSigmadE,Mcdm0*X0,Mcdm0,1.E-3);
  csE=simpson(dSigmadEe,Mcdm0*X0,Mcdm0,1.E-3);
  xcsA=simpson(EdSigmadERest,Mcdm0*X0,Mcdm0,1.E-3);
  xcsE=simpson(EdSigmadEe,Mcdm0*X0,Mcdm0,1.E-3);
/*  
  printf("vcs(A)= %E  vcs(E)= %E\n",csA,csE);
  printf("energy  fraction lost %E\n", (2*Mcdm0- xcsA/csA-2*xcsE/csA)/Mcdm0);  
*/  
}        
#endif
       for(i=1;i<NZ;i++)
       {
           double Ee=Mcdm0*exp(Zi(i));
           if(Ee>X0*Mcdm0) Spectra[1][i]+=Ee*dSigmadEe(Ee);
       }
     }         
  }  
  return vcs;
}

/* ------------------------------------------------- */


static int readSpectra(void)
{ static int rdOk=0;
  int k,l,i,n;
  FILE *f;
  char * buff;
  char *fnames[Nin]={"gg.dat","dd.dat","uu.dat","ss.dat","cc.dat",
                     "bb.dat","tt.dat","ee.dat","mm.dat","ll.dat",
                     "zz.dat","zz_t.dat","zz_l.dat",
                     "ww.dat","ww_t.dat","ww_l.dat"};

  if(rdOk) return 0;
  buff=malloc(strlen(micrO)+100);

  for(n=0;n<Nin;n++)
  {  sprintf(buff,"%s/sources/data/%s",micrO,fnames[n]);
     f=  fopen(buff,"r");
//     printf("f=%p\n",f);       
//     fclose(f); f=NULL;
     
     if(f==NULL) { free(buff);return 1;} 
//printf("%s\n", buff);        
     for(i=0;i<6;i++)
     { fscanf(f,"%*s"); 
       for(k=0;k<NEn;k++)
       {
         for(l=0;l<NZ;l++) if(1!=fscanf(f,"%f",phidiff[n][i][k]+l)) break;
         fscanf(f,"%*s"); 
         for(;l<NZ;l++)phidiff[n][i][k][l]=0;
       }
     }
//printf("ok before fclose\n");     
     fclose(f);
  }
  
  free(buff);
  rdOk=1;   

#ifdef ECTEST
printf("Energy conservation test\n");
for(n=0;n<Nin;n++) for(k=0;k<NEn;k++)
{
    double mi[NEn]={2,5,10,25,50,80.3,85,91.2,92,95,100,110,120,125,130,140,150,176,200,250,350,500,750,1000,1500,2000,3000,5000};

  double x[6];
  for(n=0;n<Nin;n++) for(k=0;k<NEn;k++)
  { double sum=0;


  for(l=0;l<6;l++) x[l]=0;
  for(l=0;l<6;l++) if(phidiff[n][l][k])
  { 
     for(i=0;i<NZ;i++)
     { double xx= pow(1.E-7, pow((i+0.5)/NZ,1.5));
       double dx;
       if(i==0) dx=-0.5*log(1.E-7)*pow((double)(1.)/NZ,1.5);
       else dx= 0.5*log(1.E-7)*( pow((double)(i-1)/NZ,1.5) - pow((double)(i+1)/NZ,1.5) );
       if(l==2) xx+=1/mi[k];
       x[l]+=phidiff[n][l][k][i]*dx*xx;   
     }
  }  
  sum=x[0]+2*(x[1]+x[2]+x[3]+x[4]+x[5]);
   
  if(sum && (sum>2.1 || sum<1.9))   
   printf("Channel = %s Energy=%.1E  %.2e + %.2e + %.2e + %.2e + %.2e + %.2e = %.2E\n",fnames[n],mi[k], x[0],x[1],x[2],x[3],x[4],x[5],sum);
  }
}  
   
#endif  

  
  return 0;
}


double zInterp(double zz, double * tab) 
{  
   double dz,r;
   int j0;   

   if(zz>0) return 0;
   
   j0=Iz(zz); 
   if(j0<1) j0=1;
   if(j0>=NZ-1) return tab[NZ-1];
   
   dz= (zz-Zi(j0))/(Zi(j0+1)-Zi(j0));
   
   r=(1-dz)*tab[j0]+dz*tab[j0+1];
   if(r<0)r=0;
   return r; 
}



static void mInterp(double Nmass,  int  CHin,int  CHout, double*tab)
{  
//  float mi[NEn]={10,25,50,80.3,91.2,100,150,176,200,250,350,500,750,1000,1500,2000,3000,5000};
   double mi[NEn]={2,5,10,25,50,80.3,85,91.2,92,95,100,110,120,125,130,140,150,176,200,250,350,500,750,1000,1500,2000,3000,5000};
   int l,i0;
   double c0,c1;
   float *p0,*p1;
   for(i0=0; i0<NEn && Nmass>=mi[i0] ;i0++);
   if(i0) i0--;
   switch(CHin)
   { 
     case 14: case 15: case 16: case 17: if(i0<5)
      { i0=6; for(l=1;l<NZ;l++) tab[l]=phidiff[CHin][CHout][i0][l-1]; tab[0]=Nmass; return; }
     case 10: case 11: case 12: case 13: if(i0<7)
      { i0=9; for(l=1;l<NZ;l++) tab[l]=phidiff[CHin][CHout][i0][l-1]; tab[0]=Nmass; return; }
   } 
   p0=phidiff[CHin][CHout][i0];
   p1=phidiff[CHin][CHout][i0+1];
   if(i0==NEn-1) for(l=1;l<NZ;l++) tab[l]= p0[l-1];
   else
   {
     c1=(Nmass*Nmass -mi[i0]*mi[i0])/(mi[i0+1]*mi[i0+1] - mi[i0]*mi[i0]);
     c0=1-c1;
     for(l=1;l<NZ;l++) tab[l]= c0*p0[l-1]+c1*p1[l-1];
   }
   tab[0]=Nmass;
}



static double*tabStat;
static double FUNN(double x) { return  zInterp(x,tabStat);}
static double FUNE(double x) { return  zInterp(x,tabStat)*exp(x);}

double  spectrInfo(double Emin,double*tab,double*Etot)
{
  if(Emin>=tab[0] ) 
  { 
    if(Etot)*Etot=0;
    return 0;
  } else 
  { int i1,i2;
    double Xmin=Emin/tab[0],zmin,zmax=0;
    if(Xmin<1.22E-7) Xmin=1.22E-7;
    zmin=log(Xmin); 

    for(i1=Iz(zmin); i1>1 && tab[i1]==0;i1--) continue;
    if(i1<NZ-1) i1++;
    if(zmin<Zi(i1)) zmin=Zi(i1)+1E-6;

    
    for(i2=1; tab[i2]==0 && i2<NZ-1 ;i2++ );
    if(i2>1) i2--;
    if(zmax>Zi(i2)) zmax=Zi(i2)-1E-6;

    if(zmax<zmin) return 0;    
    tabStat=tab;
    if(Etot)*Etot=tab[0]*simpson(FUNE, zmin, zmax,1.E-4);       
//    displayFunc(FUNN,Xmin, 0.,"integrand");
    return simpson(FUNN, zmin, zmax,1.E-4);
  }  
}


double spectrInt(double Emin,double Emax, double * tab)
{ 
  double M=tab[0], zmin,zmax;
  int i1,i2;

  if(Emin<M*exp(Zi(NZ-1))) zmin=Zi(NZ-1); else if( Emin>=M) zmin=0; else zmin=log(Emin/M);
  if(Emax<M*exp(Zi(NZ-1))) zmax=Zi(NZ-1); else if( Emax>=M) zmax=0; else zmax=log(Emax/M);
  
  if(zmin>=zmax) return 0;
  
  for(i1=Iz(zmin) ;i1>1 && tab[i1]==0;i1--) continue;
  if(i1<NZ-1) i1++;
  if(zmin<Zi(i1)) zmin=Zi(i1)+1E-6;
 
  i2=Iz(zmax)+1; if(i2>NZ-1) i2=NZ-1;
  for( ;i2<NZ-1 && tab[i2]==0;i2--) continue;
  if(i2<2) i2--;
  if(zmax>Zi(i2)) zmax=Zi(i2)-1E-6;
                
  
  tabStat=tab;
  return simpson(FUNN, zmin, zmax,1.E-4);
}


void  spectrMult( double *spect, double(*func)(double))
{ 
  int i; 
  double M=spect[0];
  for(i=1;i<NZ;i++)
  { double E=M*exp(Zi(i));
    spect[i]*=func(E);
  }  
}


static double m_;

static double FUNB(double e)
{ double r;
  if(e<=0) return 0;
  r=zInterp(log(e/tabStat[0]),tabStat)/(e*sqrt(e*(e+2*m_)));
  return r;
}


void boost(double Y, double M0, double mx, double*tab)
{ double chY=cosh(Y), shY=sinh(Y);
  int l;
  double tab_out[NZ];  

  if(Y<0.001) return;
//printf("boost: mDecay=%E 2*tab[0]=%E\n", mDecay,2*tab[0]);
  m_=mx;
    
  tabStat=tab;

  for(l=1;l<NZ;l++)
  { double e=M0*exp(Zi(l));
    double p=sqrt(e*(e+2*mx)); 
    double e1=chY*(e+mx)-shY*p-mx;
    double e2=chY*(e+mx)+shY*p-mx;
    int k=Iz(log(e1/tab[0]));
    if(e1>=tab[0]) {tab_out[l]=0; continue;}
    
    if(tab[k]==0)
    { 
      for(;k>2 && tab[k-1]==0 ;k--);
      e1=tab[0]*exp(Zi(k));
    }       
     
    if(e2>tab[0]) e2=tab[0];
    if (e1>=e2) tab_out[l]=0; else tab_out[l]=e*simpson(FUNB,e1,e2,1.E-4)/2/shY;

    
/*     
if(e1<1.E-5 && e2>3)    
{
  printf("e1=%E, e2=%E m_=%E \n",e1,e2, m_);
  displayFunc(FUNB,e1,0.01,"bad func");
  displayFunc(FUNB_,e1,0.01,"bad func_");
  
  exit(0);
} 
*/
  }
  
  for(l=1;l<NZ;l++) tab[l]=tab_out[l];
  tab[0]=M0;
}

static double outMass[6]= {0.,0.,0.939,0.,0.,0.};
char* outNames[6]={"gamma","e+","p-","nu_e","nu_mu","nu_tau"};

int basicSpectra(double Mass, int pdgN, int outN, double * tab)
{ 
  int inP=-1;
  int N=abs(pdgN);
  switch(N)
  { case 21:inP=0; break;  /*glu*/ 
    case 1: case 2: case 3: case 4: case 5: case 6:  inP=N; break; /* d,u,s,c,b,t*/
    case 11:case 13: case 15: inP=(N+1)/2+1; break; /*e,m,l*/  
    case 23:    inP=10; break;  /*z*/
    case 23+'T':inP=11; break;  
    case 23+'L':inP=12; break;     
    case 24:    inP=13; break;  /*w*/
    case 24+'T':inP=14; break;
    case 24+'L':inP=15; break;
    case 25    :inP=25; break;
  }
  if(inP==-1) return 1;
  readSpectra(); 
   if(inP!=25) mInterp(Mass,inP,outN,tab); else
  { double Mh=125;
    double tabV[NZ],Y;
    double br_b=0.60 , br_l=0.06 ,br_W=0.21, br_Z=0.03, br_G=0.08,br_c=0.017,br_A=0.003;  
    int i;
    for(i=1;i<NZ;i++) tab[i]=0;
    mInterp(Mh/2, 5,outN,tabV);  for(i=1;i<NZ;i++) tab[i]+=2*br_b*tabV[i];
    mInterp(Mh/2, 9,outN,tabV);  for(i=1;i<NZ;i++) tab[i]+=2*br_l*tabV[i];
    mInterp(Mh/2,10,outN,tabV);  for(i=1;i<NZ;i++) tab[i]+=2*br_Z*tabV[i];
    mInterp(Mh/2,13,outN,tabV);  for(i=1;i<NZ;i++) tab[i]+=2*br_W*tabV[i];
    mInterp(Mh/2, 0,outN,tabV);  for(i=1;i<NZ;i++) tab[i]+=2*br_G*tabV[i]; 
    mInterp(Mh/2, 4,outN,tabV);  for(i=1;i<NZ;i++) tab[i]+=2*br_c*tabV[i];
    tab[0]=tabV[0];
    if(outN==0) tab[1]+=br_A*8/(Zi(1)-Zi(2));
    Y=acosh(Mass/Mh);
//printf("Mass=%E Mcdm0=%E\n", Mass,Mcdm0);    
    boost(Y, Mass, outMass[outN], tab); 
  }
  return 0;
}


static void getSpectrum(int wPol, double M, double m1,double m2,char*n1,char*n2, int N1, int N2,int outP, double *tab)
{
  int i;
  int inP=-1;
  int N;
  GG=sqrt(4*M_PI*alphaQCD(2*Mcdm0));
  if(M<=m1+m2) wPol=0;
  tab[0]=M/2;
  for(i=1;i<NZ;i++) tab[i]=0;
   
  if(N1+N2==0  || (N1==21 && N2==21) || (N1==23 && N2==23) )
  { N=abs(N1);
    switch(N)
    { case 21:inP=0; break;  /*glu*/ 
      case 1: case 2: case 3: case 4: case 5: case 6:  inP=N; break; /* d,u,s,c,b,t*/
      case 11:case 13: case 15: inP=(N+1)/2+1; break; /*e,m,l*/  
      case 23:inP=10; break;  /*z*/
      case 24:inP=13; break;  /*w*/
    }
  }  
  if(inP>=0)
  {
    if(wPol &&(inP==10 ||inP==13 )) 
    { double left,right,lng;
      int err; 
      if(inP==10)
      { err=vPolar(23,12,-12, &left,&right,&lng); 
/*        if(PrintOn && outP==0 ) printf(" %.0f%% transverse Z produced\n",100*fabs(left+right));*/
      }
      else
      { err=vPolar(24,11,-12, &left,&right,&lng); 
/*        if(PrintOn && outP==0 ) printf(" %.0f%% transverse W produced\n",100*fabs(left+right));*/
      }    
      if(err)  mInterp(M/2,inP, outP,tab);  else
      { double tabL[NZ];
        mInterp(M/2,inP+1, outP,tab); 
        mInterp(M/2,inP+2, outP,tabL);
        for(i=1;i<NZ;i++) tab[i]=(1-lng)*tab[i]+lng*tabL[i];
      } 
    }   
    else  mInterp(M/2,inP, outP,tab); 
         
  }   
  else
  { char* nn[2];
    double mm[2];
    double E[2]; 
    double p2;
    int k;

    nn[0]=n1;
    nn[1]=n2;

    mm[0]=m1;
    mm[1]=m2;
    
    if(M>m1+m2) p2=sqrt((M*M-(m1+m2)*(m1+m2))*(M*M-(m1-m2)*(m1-m2)))/(2*M);
    else 
    { p2=0;
      if(abs(N1)==abs(N2)) { mm[0]=M/2; mm[1]=M/2;} else
      {
        if(N1==23 || abs(N1)==24) mm[0]=M-m2; else mm[1]=M-m1;
      }  
    } 
    E[0]=sqrt(mm[0]*mm[0]+p2*p2);
    E[1]=sqrt(mm[1]*mm[1]+p2*p2);
    
    for(i=1;i<NZ;i++) tab[i]=0;
    
    for(k=0;k<2;k++)
    { double tabAux[NZ];
      N=(k==0?abs(N1):abs(N2));
      inP=-1; 
      switch(N)
      {  
         case 21:inP=0; break;
         case  1: case 2: case 3: case 4: case  5: case  6:  inP=N; break; /* d,u,s,c,t,b*/
         case 11: case 13: case 15: inP=(N+1)/2+1; break;
         case 23:inP=10; break;  /*z*/
         case 24:inP=13; break;  /*w*/
         case 12: case 14: case 16: case 22:
         { int outPpdg;
           switch(outP)
           {
              case 0: outPpdg=22; break;
              case 1: outPpdg=-11;break;
             default:outPpdg=6+2*(outP);
           }  
           if((k==0 && outPpdg==N1)||(k==1 && outPpdg==N2)) 
           { int i=Iz(log(2*p2/M)); if(i<=0)i=1;
             if(i>1) tab[i]+=2/(Zi(i-1)-Zi(i+1)); else tab[i]+=2/(Zi(1)-Zi(2));
           }  
           continue;
         } 
      }
      if(inP>=0)
      { 
        mInterp(E[k],inP, outP,tabAux);     
        for(i=1;i<NZ;i++)
        {  double e=M/2*exp(Zi(i));
           double z=log(e/E[k]);
           if(z<=0) tab[i]+=0.5*zInterp(z,tabAux);
        }  
        tab[0]=M/2;
      }else
      { double w=0;
        numout * d2Proc;
        int l; 
        char* n[4];
        REAL m[4];
        double Y;
        double tab_p[NZ];
        char process[40],plib[40];
        int ntot;

        strcpy(plib,"2width_");
        sprintf(process,"%s->2*x",nn[k]);
        pname2lib(nn[k],plib+7);
        for(i=0;i<NZ;i++) tabAux[i]=0;
        if(mm[k]==0) { fprintf(stderr,"Can not hadronize zero mass %s\n",nn[k]);
                       continue;
                     }
                     
        d2Proc=getMEcode(0,ForceUG,process,NULL,NULL,plib);
        if(!d2Proc) continue;
        procInfo1(d2Proc,&ntot,NULL,NULL);
        {  double  Qstat;
           if(Qaddress) { Qstat=*Qaddress; setQforParticle(Qaddress,nn[k]);}
                         
           for(l=1;l<=ntot ;l++)
           {    
              double wP=pWidth2(d2Proc,l);
            
              if(wP>0)
              { int N2=d2Proc->interface->pinfAux(l,2,NULL,NULL,NULL);
                int N3=d2Proc->interface->pinfAux(l,3,NULL,NULL,NULL);
                procInfo2(d2Proc,l,n,m);    
                getSpectrum(0,m[0],m[1],m[2],n[1],n[2],N2,N3,outP, tab_p);
                for(i=1;i<NZ;i++) tabAux[i]+=wP*tab_p[i];
                w+=wP;
              }
           }
           tabAux[0]=m[0]/2;
           if(Qaddress){*Qaddress=Qstat; calcMainFunc();}
        } 
        if(w==0) {   if( !(  (CDM1 &&(strcmp(CDM1,nn[k])==0 ||strcmp(aCDM1,nn[k])==0))
                           ||(CDM2 &&(strcmp(CDM2,nn[k])==0 ||strcmp(aCDM2,nn[k])==0)) ))    
                      fprintf(stderr,"Can not find decays for  %s\n",nn[k]);     
                    continue;
                 }
        Y=acosh(E[k]/mm[k]);
        boost(Y, M/2, outMass[outP], tabAux);
        for(i=1;i<NZ;i++)tab[i]+=tabAux[i]/w; 
                
      }
    } 
  }
}

void sumSpectra(double*A,double*B,double*S)
{ double s[NZ],E,z;
  int i;
  if(A[0]==B[0]) {s[0]=A[0]; for(i=1;i<NZ;i++) s[i]=A[i]+B[i];}  else
  if(A[0]>B[0]) for( s[0]=A[0],i=1;i<NZ;i++) { z=Zi(i)+log(A[0]/B[0]); if(z<=0) s[i]+=zInterp(z,B); }
   else         for(s[0]=B[0],i=1;i<NZ;i++)  { z=Zi(i)+log(B[0]/A[0]); if(z<=0) s[i]+=zInterp(z,A); }
   
  for(i=0;i<NZ;i++) S[i]=s[i];
}

void addSpectrum(double *Spect, double * toAdd)
{
  double m1=Spect[0];
  double m2=toAdd[0];
  double buff[NZ];
  int i;

  if(m1>m2) for(i=1;i<NZ;i++) 
  { 
     double E= m1*exp(Zi(i));
     if(E>m2) return; 
     Spect[i]+=  SpectdNdE(E,toAdd)*E;  
  } else  
  { for(i=0;i<NZ;i++) buff[i]=Spect[i];
    for(i=0;i<NZ;i++) Spect[i]=toAdd[i];
    for(i=1;i<NZ;i++) 
    {  
       double E= m2*exp(Zi(i)); 
       if(E>m1) return;
       Spect[i]+=  SpectdNdE(E,buff)*E;
    } 
  }
} 



static double calcSpectrum0(char *name1,char*name2, int key, double **Spectra, txtList*plusA)
{
  int i,k,l;
  double vcsSum=0; 
  int ntot,err;
  double * v_cs;
  char * photonName=NULL;
  char name1L[10],name2L[10], lib[20],process[400];
  numout * libPtr;
    
  for(l=0;l<6;l++) if(Spectra[l]) { Spectra[l][0]=Mcdm0; for(i=1;i<NZ;i++) Spectra[l][i]=0;}  

  pname2lib(name1,name1L);
  pname2lib(name2,name2L);
  sprintf(lib,"omg_%s%s",name1L,name2L);
  sprintf(process,"%s,%s->AllEven,1*x{%s",name1,name2,EvenParticles());
// Warning!!   in should be done in the same manner as annihilation libraries for Omega
  libPtr=getMEcode(0,ForceUG,process,NULL,NULL,lib);

  if(!libPtr) return 0;
  if(Qaddress && *Qaddress!=pMass(name1)+pMass(name2)) 
  { *Qaddress=pMass(name1)+pMass(name2);
     calcMainFunc;
  }   
  passParameters(libPtr);
  if(plusA)
  { 
    for(l=0;l<nModelParticles;l++)
    {
      if(ModelPrtcls[l].NPDG==22) 
      { photonName=ModelPrtcls[l].name;
        break;
      }
    }  
    if(!photonName) plusA=NULL;
  } 

  procInfo1(libPtr,&ntot,NULL,NULL); 

  
  v_cs=malloc(sizeof(double)*ntot);
  (*libPtr->interface->twidth)=0;
  for(k=0;k<ntot;k++)
  { REAL m[4];
    double wV,br;
    char *N[4];
    int pdg[4];
    int l,l_;
    
    for(i=0;i<4;i++) N[i]=libPtr->interface->pinf(k+1,i+1,m+i,pdg+i);
    cc23=NULL;
    v_cs[k]=0;
    if(VZdecay||VWdecay)
    {  int nVV;
       int vd[4]={0,0,0,0};
       for(l=2;l<4;l++) if((pdg[l]==23&&VZdecay) || (abs(pdg[l])==24&&VWdecay)) vd[l]=1;
            
       for(l=2;l<4;l++) if(vd[l]) break;
       if(l<3)
       {  l_=5-l; 
          if(vd[l_])
          { nVV=2;
            if(m[l_]>m[l]) { l=l_; l_=5-l;}
          } else nVV=1;
          
          if(m[0]+m[1] >  m[l_] +20  && m[0] + m[1] <  m[2]+m[3] + 4*nVV)
           cc23=xVtoxll(2,2,N,pdg,l,&wV,&br);                
       }
    }
    if(cc23)
    { int i3W;  
      double  r,m1,v0=0.001;
      for(i3W=2;i3W<5;i3W++) if(strcmp(cc23->interface->pinf(1,i3W+1,NULL,NULL),N[l_])==0) break;
      r=v0*cs23(cc23,1,v0*Mcdm0/2,i3W)/br;
      if(pdg[l_]==23 || abs(pdg[l_])==24)
      { double wV2;
        
        wV2=pWidth(N[l_],NULL);
        r*=decayPcmW(2*Mcdm0,m[l],m[l_],wV,wV2,0)/decayPcmW(2*Mcdm0,m[l],m[l_],wV,0.,0);
        if(pdg[l]==pdg[l_]) r/=2;
      }
      v_cs[k]=r; 
      vcsSum+=r;                     
    }
    else  if(m[2]+m[3]< m[0]+m[1])
    {  err=0;
#ifdef V0    
      v_cs[k]=V0*cs22(libPtr,k+1,V0*m[0]*m[1]/(m[0]+m[1]),-1.,1.,&err); 
#else 
      v_cs[k]= vcs22(libPtr,k+1,&err);
#endif 
     if(v_cs[k]<0) v_cs[k]=0; 
      vcsSum+=v_cs[k];
    } else v_cs[k]=-1;
  }

   
  for(k=0;k<ntot ;k++) if(v_cs[k]>=0)
  { char * N[4];
    REAL m[4];
    int l,charge3[2],spin2[2],pdg[2];
    int PlusAok=0;

    procInfo2(libPtr,k+1,N,m);
    for(l=0;l<2;l++)  pdg[l]=qNumbers(N[2+l],spin2+l,charge3+l,NULL);

    if(Spectra[0] && plusA && (charge3[0] || charge3[1])&& (m[2]+m[3]< m[0]+m[1])) 
    {
       double m1=m[2], m2=m[3], Eg=X1*Mcdm0;
       double kappa=4*Mcdm0*(Mcdm0-Eg), ms=m1+m2, md=m1-m2;
       if(ms*ms<kappa)
       {  double dp=(Mcdm0-Eg/2)*sqrt((1-ms*ms/kappa)*(1-md*md/kappa));
          double p1= Eg/2*(1+ms*md/kappa)-dp, E1=sqrt(p1*p1+m1*m1);
          double p2= Eg/2*(1-ms*md/kappa)-dp, E2=sqrt(p2*p2+m2*m2);
             
          double Q1=Mcdm0*Mcdm0+m1*m1-2*Mcdm0*E1;
          double Q2=Mcdm0*Mcdm0+m2*m2-2*Mcdm0*E2;             

          double  m_min=10*Mcdm0;
          int n,m,w;
          char *s;
/*             
printf("energy conservation:0=%E=%E\n",  (E1+Eg+sqrt(pow(p2+2*dp,2)+m2*m2))/2/Mcdm0-1   ,
                                                   (E2+Eg+sqrt(pow(p1+2*dp,2)+m1*m1))/2/Mcdm0-1 );
*/                      
          for(n=1;(s=libPtr->interface->den_info(k+1,n,&m,&w));n++)
          {  double mass=fabs( libPtr->interface->va[m]);
                if( ( strcmp(s,"\1\3")==0  || strcmp(s,"\1\4")==0) && m  && m_min> mass) m_min=mass;
          }

          if(  m_min*m_min -Q1  < QCUT*Mcdm0*Mcdm0*abs(charge3[0])/3.  
            || m_min*m_min -Q2  < QCUT*Mcdm0*Mcdm0*abs(charge3[1])/3. 
            || (abs(pdg[0])==24 && abs(pdg[1])==24  && Mcdm0 > 500 && v_cs[k]>1.E-3*vcsSum ))
          { txtList new22A=malloc(sizeof(txtListStr));
               new22A->next=*plusA; 
               new22A->txt=malloc(50);
               *plusA=new22A;
               sprintf(new22A->txt ,"%s,%s->%s,%s,%s",N[0],N[1],N[2],N[3],photonName); 
               PlusAok=1; 
          }
       } 
    }
            
    if(v_cs[k]>0) 
    {  double tab2[NZ]; 
       int N3=pdg[0], N4=pdg[1];

//       if(PrintOn )
//       { char txt[100];
//         sprintf(txt,"%s,%s -> %s %s", N[0],N[1],N[2],N[3]);
//         printf("  %-20.20s  %.2E\n",txt,v_cs[k]*2.9979E-26);
//       }
       
       vSigmaCh=realloc(vSigmaCh, (nAnCh+2)*sizeof(aChannel));
       vSigmaCh[nAnCh].weight=v_cs[k];
       { int j; 
         for(j=0;j<4;j++) vSigmaCh[nAnCh].prtcl[j]=N[j];
         vSigmaCh[nAnCh].prtcl[4]=NULL;
       }
       nAnCh++;
              
//       if(N3!=25 && N4!=25)
       for(l=0;l<6;l++) if(Spectra[l])
       {
         getSpectrum(key&1,m[0]+m[1],m[2],m[3],N[2],N[3],N3,N4,l,tab2);
         for(i=1;i<NZ;i++) Spectra[l][i]+=tab2[i]*v_cs[k];
       }

       if(Spectra[0] && charge3[0])
       {
          for(l=0;l<2;l++) if(addGamma(pdg[l])&& m[2+l]!=0.) for(i=1;i<NZ;i++)
          {  double x=exp(Zi(i));
             if(2*Mcdm0*sqrt(1-x) > m[2]+m[3])
             {  double pcm,kappa,one_kappa,f;
                pcm=decayPcm(2*Mcdm0*sqrt(1-x), m[2],m[3]); 
                kappa=sqrt(1/(1+m[2+l]*m[2+l]/pcm/pcm)); 
                if( m[2+l]/pcm > 1.E-2) one_kappa=1-kappa; 
                                   else one_kappa=0.5*m[2+l]*m[2+l]/pcm/pcm; 
               f=(1./137.)*charge3[l]*charge3[l]/9/M_PI*log((1+kappa)/one_kappa);
          
               if(spin2[l]&1) Spectra[0][i]+=f*(1-x*(1-x*0.5))* v_cs[k];
               else           Spectra[0][i]+=f*(1-x          )* v_cs[k];
             }  
          }
       }
    }    
  }
  free(v_cs);
  
  return  vcsSum;
}


double calcSpectrum(int key, double *Sg,double*Se, double*Sp, double*Sne,double*Snm,double*Snl, int *errcode)
{ int n,i,j,l,err;
  double vcs;
  char  lop[20];
  double *Spectra[6],*Spectra_[6];
  double  buff[6][NZ];
  char * name, *aname;
  txtList plusA=NULL;
  txtList*plusAptr;
  
  char *WINPS[4]={CDM1,NULL,CDM2,NULL};
  double weight[4][4];
  int checkGam[4][4];
  double  chStat[3]={0,0,0};
  double NfracCDM2;
  
  err=readSpectra(); 
  if(err) { printf("calcSpectrum: Can not read data files for spectra\n");
            if(errcode) *errcode=-1; 
            return 0;
          }
          
//printf("?WINPS[2]=%s  fracCDM2=%e \n",WINPS[2],fracCDM2);
 
  if(fracCDM2==0) { WINPS[2]=NULL; NfracCDM2=0; } else
  if(fracCDM2==1) { WINPS[0]=NULL; NfracCDM2=1; } else
   NfracCDM2=  fracCDM2*Mcdm1/(fracCDM2*Mcdm1 +(1-fracCDM2)*Mcdm2); 

//printf("WINPS[2]=%s\n",WINPS[2]);
  if(WINPS[0])
  { int n=pTabPos(WINPS[0]);
    if( strcmp(ModelPrtcls[n-1].name,ModelPrtcls[n-1].aname)) WINPS[1]=ModelPrtcls[n-1].aname;
  }
  
  if(WINPS[2])
  { int n=pTabPos(WINPS[2]);
    if( strcmp(ModelPrtcls[n-1].name,ModelPrtcls[n-1].aname)) WINPS[3]=ModelPrtcls[n-1].aname;
  }
  
  double w1[4]={0.5*(1-NfracCDM2)*(1+dmAsymm)  ,0.5*(1-NfracCDM2)*(1-dmAsymm),
                0.5*NfracCDM2*(1+dmAsymm),      0.5*NfracCDM2*(1-dmAsymm)};
  if(!WINPS[1]) { w1[0]+=w1[1]; w1[1]=0;}
  if(!WINPS[3]) { w1[2]+=w1[3]; w1[3]=0;}

  for(i=0;i<4;i++) for(j=0;j<4;j++)
  {  weight[i][j]=w1[i]*w1[j];
     checkGam[i][j]=0;
     if(weight[i][j])
     { int ni=pTabPos(WINPS[i]);   
       int nj=pTabPos(WINPS[j]);
       if(ModelPrtcls[ni-1].spin2==0 && ModelPrtcls[nj-1].spin2==0) checkGam[i][j]=1;       
       if( WINPS[i]==WINPS[j]  && ModelPrtcls[nj-1].spin2==1)    checkGam[i][j]=1;
     } 
  }
  
    
  
   Mcdm0=0;
   if(weight[0][0]) Mcdm0=Mcdm1;
   if(weight[2][2] && Mcdm2>Mcdm0) Mcdm0=Mcdm2;

//for(i=0;i<4;i++) printf(" WINP=%s weight=%e\n", WINPS[i],w1[i]);  

  Spectra[0]=Sg; Spectra[1]=Se; Spectra[2]=Sp,Spectra[3]=Sne,Spectra[4]=Snm; Spectra[5]=Snl;
  for(l=0;l<6;l++) if(Spectra[l]) Spectra_[l]=buff[l];  else Spectra_[l]=NULL;
  for(l=0;l<6;l++)if(Spectra[l]) { Spectra[l][0]=Mcdm0; for(i=1;i<NZ;i++) Spectra[l][i]=0;} 
  vcs=0;


  nAnCh=0;
  vSigmaCh=realloc(vSigmaCh, 2*sizeof(aChannel));
  if(errcode) *errcode=0;
    
  if(key&4) { PrintOn=1; printf("    Channel          vcs[cm^3/s]\n");} else PrintOn=0;  

  for(i=0;i<4;i++) for(j=i;j<4;j++) if(weight[i][j])
  { double scale,c=weight[i][j];
    int nAnCh0,k;
    int key0=key&1;
    if(key&2 && checkGam[i][j]) key0+=2;
    if(i!=j) c*=2;

//printf("i=%d j=%d w=%e \n",i,j,weight[i][j]);
     
    Mcdm0=0.5*(pMass(WINPS[i])+pMass(WINPS[j]));
    err=findVal("Q",&scale);
    if(err==0 && scale!=2*Mcdm0) { assignValW("Q",2*Mcdm0); calcMainFunc();}
    
    if(key&2) plusAptr=&plusA; else plusAptr=NULL; 
    nAnCh0=nAnCh;
    { double vcsij=c*calcSpectrum0(WINPS[i],WINPS[j], key0, Spectra_,plusAptr);
      if( i<2 && j<2) chStat[0]+=vcsij;
      else if(i>1 && j>1) chStat[2]+=vcsij;
      else chStat[1]+=vcsij;
      vcs+=vcsij;      
    }  
    for(l=0;l<6;l++) if(Spectra[l])
    {  for(k=1;k<NZ;k++)Spectra_[l][k]*=c;
      addSpectrum(Spectra[l], Spectra_[l]);
       
    }
    for(k=nAnCh0;k<nAnCh;k++) vSigmaCh[k].weight*=c;     
    if(plusA)
    {  nAnCh0=nAnCh;
       if(Spectra[0]) dSigmadE_x1=zInterp(log(X1),Spectra_[0])/(X1*Mcdm0);  
       if(Spectra[1]) dSigmadE_x1_e=zInterp(log(X1),Spectra_[1])/(X1*Mcdm0);
       vcs+=c*Spectra22A(name,aname,Spectra_,plusA);

          
       for(l=0;l<6;l++) if(Spectra[l])
       { 
          for(k=1;k<NZ;k++)Spectra_[l][k]*=c;
          addSpectrum(Spectra[l], Spectra_[l]);
       }
        
       for(k=nAnCh0;k<nAnCh;k++) vSigmaCh[k].weight*=c;
       cleanTxtList(plusA);
       plusA=NULL;
    }    
  } 

  vSigmaCh[nAnCh].weight=0;
  for(j=0;j<5;j++) vSigmaCh[nAnCh].prtcl[j]=NULL;
  for(i=0;i<nAnCh-1;)
  {  if(vSigmaCh[i].weight >= vSigmaCh[i+1].weight) i++; 
     else
     {  aChannel buff;
        buff=vSigmaCh[i+1];vSigmaCh[i+1]=vSigmaCh[i];vSigmaCh[i]=buff;
        if(i)i--;else i++;
     }
  }           
 
  if(vcs)
  {  for(l=0;l<6;l++) if(Spectra[l])for(i=1;i<NZ;i++)Spectra[l][i]/=vcs;
     for(i=0;i<nAnCh;i++) vSigmaCh[i].weight/= vcs;
  } 
  
  
  vcs*=2.9979E-26;
  

  if(PrintOn )
  { int i=0;
    char txt[100];
    printf("==================================\n annihilation cross section %.2E cm^3/s\n",vcs  );
    printf(" contribution of processes\n");     
    for(i=0;vSigmaCh[i].weight>1.E-4;i++)
    {
    sprintf(txt,"%s,%s -> %s %s ", vSigmaCh[i].prtcl[0],
                                   vSigmaCh[i].prtcl[1],
                                   vSigmaCh[i].prtcl[2],
                                   vSigmaCh[i].prtcl[3]);
    if(vSigmaCh[i].prtcl[4]) strcat(txt,vSigmaCh[i].prtcl[4]);                               
    printf("  %-20.20s  %.2E\n",txt,vSigmaCh[i].weight);
    
     
    }
//    printf("chanStat: 11 -> %.2E  12-> %.2E 22->%.2E\n",    2.9979E-26*chStat[0],2.9979E-26*chStat[1],2.9979E-26*chStat[2]);
    
    
  }     

                                                                     
  if(Mcdm0 < 2) printf("WARNING! Spectra obtained at Mcdm=2GeV are used !\n");	 

//printf("Q=%E Mb=%E\n", findValW("Q"), findValW("Mb"));   
  return vcs; 
}


double SpectdNdE(double E, double *tab){
  double z;
  if(E>tab[0]) return 0;
  z=log(E/tab[0]); 
  return 1/E*zInterp(z,tab); 
}

int displaySpectrum( char*mess,double Emin,double Emax,double*tab)
{
  int i;
  double f[100];
  for(i=0;i<100;i++) f[i]=SpectdNdE(Emin+(i+0.5)*(Emax-Emin)/100.,tab);
  displayPlot(mess,Emin, Emax, "E[GeV]",100,0,1,f,NULL,"dN/dE");
  return 0;     
}

int displaySpectra(char * title, double Emin,double Emax, int N,...)
{
  int i,dim=100; 
  double **f,**ff,**nu; char**Y; 
  va_list ap;    
        
  nu=malloc(N*sizeof(double*)); 
  f=malloc(N*sizeof(double*));
  ff=malloc(N*sizeof(double*)); 
  Y = malloc(N*sizeof(char*));  
 
  va_start(ap,N);  
  for(i=0;i<N;i++)  
  { int j;
    nu[i]=va_arg(ap,double*);
    f[i]=malloc(dim*sizeof(double));
    for(j=0;j<dim;j++) f[i][j]=SpectdNdE(Emin+(j+0.5)*(Emax-Emin)/dim,nu[i]);  
    ff[i]=NULL; 
    Y[i]=va_arg(ap,char*); 
  }    
  va_end(ap); 
 
  displayPlotN(title,Emin,Emax,"E[GeV]", dim,0,N, f,ff,Y); 
  
  for(i=0;i<N;i++) free(f[i]);
  free(nu); free(f); free(ff);free(Y);
  return 0;
}

