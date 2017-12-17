/*******************************
*    CalcHEP  3.6.28*
*******************************/
#include"num_in.h"
#include"num_out.h"
static void C25(REAL *);
extern DNN S25_ext;
REAL S25_ext(double GG, REAL * momenta,REAL*cb_coeff,int * err)
{REAL  ans=0;
REAL DP[6];
REAL* V=va_ext;
REAL mass[6],width[6];
char * Qtxt[6];
REAL Q0[6]; COMPLEX Q1[6]; REAL Q2[6];
 if(momenta)
 {width[5]=V[7764]; mass[5]=V[25];  Qtxt[5]="\1\2";
width[4]=V[7763]; mass[4]=V[24];  Qtxt[4]="\1\2";
width[3]=V[7762]; mass[3]=V[23];  Qtxt[3]="\1\2";
width[2]=V[7761]; mass[2]=V[22];  Qtxt[2]="\1\2";
width[1]=V[7760]; mass[1]=V[21];  Qtxt[1]="\1\2";
*err=*err|prepDen(5,nin_ext,BWrange_ext*
 BWrange_ext,mass,width,Qtxt,momenta,Q0,Q1,Q2);
sprod_(4, momenta, DP);
}
{
REAL N,D,R; COMPLEX Prop;
static REAL C[11];                                                    
if(!momenta){ C25(C); return 0;}
  REAL N_p1p2_=1/DP[0];
N=+C[0];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*Q2[1];
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[3];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[2]):conj(
 Q1[2]));
if(gswidth_ext ) Prop=Prop*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[4];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[5];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*Q2[2];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[6];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[7];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*Q2[3];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[8];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*Q2[4];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[9];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gswidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[10];
D=+1;
R=+DP[0]*(C[1]+DP[0])+C[2];
R*=(N/D);
Prop=1*Q2[5];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;

}
return ans;
}

static void C25(REAL*C)
{
  REAL* V=va_ext;
REAL S[12];                                                           
S[0]=V[499]*V[499];
S[1]=V[376]*V[376];
C[10]=+S[0]*S[1];
C[9]=+2*V[499]*V[493]*V[376]*V[374];
S[2]=V[493]*V[493];
S[3]=V[374]*V[374];
C[8]=+S[2]*S[3];
S[4]=V[2954]*V[2954];
S[5]=V[372]*V[372];
C[7]=+S[4]*S[5];
C[6]=+2*V[2954]*V[2306]*V[372]*V[370];
S[6]=V[2306]*V[2306];
S[7]=V[370]*V[370];
C[5]=+S[6]*S[7];
C[4]=+2*V[2954]*V[1658]*V[372]*V[368];
C[3]=+2*V[2306]*V[1658]*V[370]*V[368];
S[8]=V[3]*V[3]*V[3]*V[3];
C[2]=+S[8];
S[9]=V[3]*V[3];
C[1]=+2*S[9];
S[10]=V[1658]*V[1658];
S[11]=V[368]*V[368];
C[0]=+S[10]*S[11];
}
