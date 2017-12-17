/*******************************
*    CalcHEP  3.6.28*
*******************************/
#include"num_in.h"
#include"num_out.h"
static void C27(REAL *);
extern DNN S27_ext;
REAL S27_ext(double GG, REAL * momenta,REAL*cb_coeff,int * err)
{REAL  ans=0;
REAL DP[6];
REAL* V=va_ext;
REAL mass[16],width[16];
char * Qtxt[16];
REAL Q0[16]; COMPLEX Q1[16]; REAL Q2[16];
 if(momenta)
 {width[15]=0.; mass[15]=V[20];  Qtxt[15]="\1\4";
width[14]=0.; mass[14]=V[19];  Qtxt[14]="\1\4";
width[13]=0.; mass[13]=V[18];  Qtxt[13]="\1\4";
width[12]=0.; mass[12]=V[17];  Qtxt[12]="\1\4";
width[11]=0.; mass[11]=V[16];  Qtxt[11]="\1\4";
width[10]=0.; mass[10]=V[15];  Qtxt[10]="\1\4";
width[9]=0.; mass[9]=V[20];  Qtxt[9]="\1\3";
width[8]=0.; mass[8]=V[19];  Qtxt[8]="\1\3";
width[7]=0.; mass[7]=V[18];  Qtxt[7]="\1\3";
width[6]=0.; mass[6]=V[17];  Qtxt[6]="\1\3";
width[5]=0.; mass[5]=V[16];  Qtxt[5]="\1\3";
width[4]=0.; mass[4]=V[15];  Qtxt[4]="\1\3";
width[3]=V[7762]; mass[3]=V[23];  Qtxt[3]="\1\2";
width[2]=V[7761]; mass[2]=V[22];  Qtxt[2]="\1\2";
width[1]=V[7760]; mass[1]=V[21];  Qtxt[1]="\1\2";
*err=*err|prepDen(15,nin_ext,BWrange_ext*
 BWrange_ext,mass,width,Qtxt,momenta,Q0,Q1,Q2);
sprod_(4, momenta, DP);
}
{
REAL N,D,R; COMPLEX Prop;
static REAL C[81];REAL S[2];                                          
if(!momenta){ C27(C); return 0;}
  REAL N_p1p2_=1/DP[0];
N=+C[0];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*Q2[1];
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[4];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[2]):conj(
 Q1[2]));
if(gswidth_ext ) Prop=Prop*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[5];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[6];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[10];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[11];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[12];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[13];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[14];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[15];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1]);
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[6];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[10];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[11];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[12];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[13];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[14];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[21];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*Q2[2];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[22];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[1];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[23];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[24];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[25];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[26];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[27];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[28];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[29];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[23];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[24];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[25];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[26];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[27];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[28];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[30];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*Q2[3];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[31];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[32];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[33];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[34];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[35];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[36];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[37];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[31];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[32];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[33];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[34];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[35];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[36];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[38];
D=+C[1];
S[0]=DP[1]*DP[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*Q2[4];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[40];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[41];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[42];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[43];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[44];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[45];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[46];
D=+C[1];
S[1]=DP[0]*DP[0];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[40];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[41];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[42];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[43];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[44];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[50];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*Q2[5];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[51];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[52];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[54];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[55];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[40];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[56];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[51];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[52];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[54];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[57];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*Q2[6];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[58];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[59];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[60];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[61];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[41];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[51];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[62];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[58];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[59];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[60];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[63];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*Q2[7];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[64];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[65];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[66];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[42];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[52];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[58];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[67];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[64];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[65];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[68];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*Q2[8];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[69];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[70];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[43];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[59];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[64];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[71];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[69];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[72];
D=+C[1];
R=+S[0]*(S[0]-C[9])+C[39];
R*=(N/D);
Prop=1*Q2[9];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[73];
D=+C[1];
R=+DP[1]*(DP[0]*(DP[1]-C[8])+C[7]*DP[1]-C[9])+C[1]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[44];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[54];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[60];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[65];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[69];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[74];
D=+C[1];
R=+DP[1]*(DP[1]*(DP[0]*(C[48]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[47])+C[49])+
 DP[0]*(-C[9]-C[8]*DP[0]))+C[1]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[75];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1;
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[45];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):conj(Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[55];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):conj(Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[61];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):conj(Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[66];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):conj(Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[70];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[14]):conj(Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[73];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]-C[18]-2*DP[1])+DP[1]*(DP[1]-C[16])+C[19])+DP[1]*(
 C[7]*DP[1]-C[17])-C[20];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[15]):conj(Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[38];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*Q2[10];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[40];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[41];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[42];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[43];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[44];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[50];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*Q2[11];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[51];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[52];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[54];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[57];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*Q2[12];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[58];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[59];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[60];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[63];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*Q2[13];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[64];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[65];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[68];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*Q2[14];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[69];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[14]):Q1[14])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[72];
D=+C[1];
R=+DP[0]*(DP[0]*(DP[0]*(C[16]+DP[0]-4*DP[1])+DP[1]*(6*DP[1]-C[76])-C[77])+
 DP[1]*(DP[1]*(C[76]-4*DP[1])+C[78])-C[79])+DP[1]*(DP[1]*(DP[1]*(DP[1]-
 C[16])-C[77])+C[79])+C[80];
R*=(N/D);
Prop=1*Q2[15];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;

}
return ans;
}

static void C27(REAL*C)
{
  REAL* V=va_ext;
REAL S[23];                                                           
S[0]=V[3]*V[3];
S[1]=V[381]*V[381];
S[2]=V[381]*V[381]*V[381]*V[381];
S[3]=V[3]*V[3]*V[3]*V[3];
C[80]=+S[3]*(S[0]*(S[0]-2*S[1])+S[2]);
C[79]=+S[3]*(4*(S[1]-S[0]));
C[78]=+S[0]*(4*S[1]-12*S[0]);
C[77]=+S[0]*(2*S[1]-6*S[0]);
C[76]=+12*S[0];
S[4]=V[7756]*V[7756];
C[75]=+S[4];
S[5]=V[4140]*V[4140];
S[6]=V[4122]*V[4122];
C[74]=+32*S[5]*S[6];
C[73]=+8*V[7756]*V[4140]*V[4122];
C[72]=+16*S[5]*S[6];
S[7]=V[4139]*V[4139];
S[8]=V[4121]*V[4121];
C[71]=+32*S[7]*S[8];
C[70]=+8*V[7756]*V[4139]*V[4121];
C[69]=+32*V[4140]*V[4139]*V[4122]*V[4121];
C[68]=+16*S[7]*S[8];
S[9]=V[4138]*V[4138];
S[10]=V[4120]*V[4120];
C[67]=+32*S[9]*S[10];
C[66]=+8*V[7756]*V[4138]*V[4120];
C[65]=+32*V[4140]*V[4138]*V[4122]*V[4120];
C[64]=+32*V[4139]*V[4138]*V[4121]*V[4120];
C[63]=+16*S[9]*S[10];
S[11]=V[4137]*V[4137];
S[12]=V[4119]*V[4119];
C[62]=+32*S[11]*S[12];
C[61]=+8*V[7756]*V[4137]*V[4119];
C[60]=+32*V[4140]*V[4137]*V[4122]*V[4119];
C[59]=+32*V[4139]*V[4137]*V[4121]*V[4119];
C[58]=+32*V[4138]*V[4137]*V[4120]*V[4119];
C[57]=+16*S[11]*S[12];
S[13]=V[4136]*V[4136];
S[14]=V[4118]*V[4118];
C[56]=+32*S[13]*S[14];
C[55]=+8*V[7756]*V[4136]*V[4118];
C[54]=+32*V[4140]*V[4136]*V[4122]*V[4118];
C[53]=+32*V[4139]*V[4136]*V[4121]*V[4118];
C[52]=+32*V[4138]*V[4136]*V[4120]*V[4118];
C[51]=+32*V[4137]*V[4136]*V[4119]*V[4118];
C[50]=+16*S[13]*S[14];
C[49]=+S[3];
C[48]=+2*(S[1]+S[0]);
C[47]=+2*S[0];
S[15]=V[4135]*V[4135];
S[16]=V[4117]*V[4117];
C[46]=+32*S[15]*S[16];
C[45]=+8*V[7756]*V[4135]*V[4117];
C[44]=+32*V[4140]*V[4135]*V[4122]*V[4117];
C[43]=+32*V[4139]*V[4135]*V[4121]*V[4117];
C[42]=+32*V[4138]*V[4135]*V[4120]*V[4117];
C[41]=+32*V[4137]*V[4135]*V[4119]*V[4117];
C[40]=+32*V[4136]*V[4135]*V[4118]*V[4117];
C[39]=+S[2]*S[3];
C[38]=+16*S[15]*S[16];
C[37]=+2*V[7756]*V[4143]*V[2954];
C[36]=+8*V[4143]*V[4140]*V[4122]*V[2954];
C[35]=+8*V[4143]*V[4139]*V[4121]*V[2954];
C[34]=+8*V[4143]*V[4138]*V[4120]*V[2954];
C[33]=+8*V[4143]*V[4137]*V[4119]*V[2954];
C[32]=+8*V[4143]*V[4136]*V[4118]*V[2954];
C[31]=+8*V[4143]*V[4135]*V[4117]*V[2954];
S[17]=V[4143]*V[4143];
S[18]=V[2954]*V[2954];
C[30]=+S[17]*S[18];
C[29]=+2*V[7756]*V[4142]*V[2306];
C[28]=+8*V[4142]*V[4140]*V[4122]*V[2306];
C[27]=+8*V[4142]*V[4139]*V[4121]*V[2306];
C[26]=+8*V[4142]*V[4138]*V[4120]*V[2306];
C[25]=+8*V[4142]*V[4137]*V[4119]*V[2306];
C[24]=+8*V[4142]*V[4136]*V[4118]*V[2306];
C[23]=+8*V[4142]*V[4135]*V[4117]*V[2306];
C[22]=+2*V[4143]*V[4142]*V[2954]*V[2306];
S[19]=V[4142]*V[4142];
S[20]=V[2306]*V[2306];
C[21]=+S[19]*S[20];
C[20]=+S[3]*(S[1]-S[0]);
C[19]=+S[0]*(3*S[0]-2*S[1])+S[2];
C[18]=+S[1]-3*S[0];
C[17]=+2*S[3];
C[16]=+4*S[0];
C[15]=+2*V[7756]*V[4141]*V[1658];
C[14]=+8*V[4141]*V[4140]*V[4122]*V[1658];
C[13]=+8*V[4141]*V[4139]*V[4121]*V[1658];
C[12]=+8*V[4141]*V[4138]*V[4120]*V[1658];
C[11]=+8*V[4141]*V[4137]*V[4119]*V[1658];
C[10]=+8*V[4141]*V[4136]*V[4118]*V[1658];
C[9]=+2*S[1]*S[0];
C[8]=+2*S[1];
C[7]=+S[1]+S[0];
C[6]=+8*V[4141]*V[4135]*V[4117]*V[1658];
C[5]=+2*V[4143]*V[4141]*V[2954]*V[1658];
C[4]=+2*V[4142]*V[4141]*V[2306]*V[1658];
C[3]=+S[0]*(S[0]-2*S[1])+3*S[2];
C[2]=+2*(S[1]-S[0]);
C[1]=+S[2];
S[21]=V[4141]*V[4141];
S[22]=V[1658]*V[1658];
C[0]=+S[21]*S[22];
}
