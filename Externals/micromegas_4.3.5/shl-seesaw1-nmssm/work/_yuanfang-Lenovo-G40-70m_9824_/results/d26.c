/*******************************
*    CalcHEP  3.6.28*
*******************************/
#include"num_in.h"
#include"num_out.h"
static void C26(REAL *);
extern DNN S26_ext;
REAL S26_ext(double GG, REAL * momenta,REAL*cb_coeff,int * err)
{REAL  ans=0;
REAL DP[6];
REAL* V=va_ext;
REAL mass[16],width[16];
char * Qtxt[16];
REAL Q0[16]; COMPLEX Q1[16]; REAL Q2[16];
 if(momenta)
 {width[15]=0.; mass[15]=V[14];  Qtxt[15]="\1\3";
width[14]=0.; mass[14]=V[13];  Qtxt[14]="\1\3";
width[13]=0.; mass[13]=V[12];  Qtxt[13]="\1\3";
width[12]=0.; mass[12]=V[11];  Qtxt[12]="\1\3";
width[11]=0.; mass[11]=V[10];  Qtxt[11]="\1\3";
width[10]=0.; mass[10]=V[9];  Qtxt[10]="\1\3";
width[9]=0.; mass[9]=V[14];  Qtxt[9]="\1\4";
width[8]=0.; mass[8]=V[13];  Qtxt[8]="\1\4";
width[7]=0.; mass[7]=V[12];  Qtxt[7]="\1\4";
width[6]=0.; mass[6]=V[11];  Qtxt[6]="\1\4";
width[5]=0.; mass[5]=V[10];  Qtxt[5]="\1\4";
width[4]=0.; mass[4]=V[9];  Qtxt[4]="\1\4";
width[3]=V[7762]; mass[3]=V[23];  Qtxt[3]="\1\2";
width[2]=V[7761]; mass[2]=V[22];  Qtxt[2]="\1\2";
width[1]=V[7760]; mass[1]=V[21];  Qtxt[1]="\1\2";
*err=*err|prepDen(15,nin_ext,BWrange_ext*
 BWrange_ext,mass,width,Qtxt,momenta,Q0,Q1,Q2);
sprod_(4, momenta, DP);
}
{
REAL N,D,R; COMPLEX Prop;
static REAL C[71];REAL S[2];                                          
if(!momenta){ C26(C); return 0;}
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
D=+C[5];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[2]):conj(
 Q1[2]));
if(gswidth_ext ) Prop=Prop*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[6];
D=+C[5];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[7];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[14];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[15];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[16];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[17];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[18];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[19];
D=+C[5];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1]);
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[20];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*Q2[2];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[21];
D=+C[5];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[1];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[22];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[23];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[24];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[25];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[26];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[27];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[28];
D=+C[5];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[29];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*Q2[3];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[30];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[31];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[32];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[33];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[34];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[35];
D=+C[5];
R=+DP[0]*(DP[0]*(DP[0]-C[11]-2*DP[1])+DP[1]*(DP[1]-C[9])+C[12])+DP[1]*(C[8]*
 DP[1]-C[10])-C[13];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[36];
D=+C[5];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[37];
D=+C[5];
S[0]=DP[1]*DP[1];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*Q2[10];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[37];
D=+C[5];
S[1]=DP[0]*DP[0];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[44];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[44];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[45];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[45];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[46];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[46];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[47];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[47];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[48];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[48];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[49];
D=+C[5];
R=+DP[1]*(DP[0]*(DP[1]-C[43])+C[8]*DP[1]-C[38])+C[5]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[50];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*Q2[11];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[50];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[51];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[51];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[52];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[52];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[54];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[54];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[55];
D=+C[5];
R=+DP[1]*(DP[0]*(DP[1]-C[43])+C[8]*DP[1]-C[38])+C[5]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[56];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*Q2[12];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[56];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[57];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[57];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[58];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[58];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[59];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[59];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[60];
D=+C[5];
R=+DP[1]*(DP[0]*(DP[1]-C[43])+C[8]*DP[1]-C[38])+C[5]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[61];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*Q2[13];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[61];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[62];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[62];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[63];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[63];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[64];
D=+C[5];
R=+DP[1]*(DP[0]*(DP[1]-C[43])+C[8]*DP[1]-C[38])+C[5]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[65];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*Q2[14];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[65];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[14]):Q1[14])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[66];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[14]):Q1[14])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[66];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[14]):Q1[14])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[67];
D=+C[5];
R=+DP[1]*(DP[0]*(DP[1]-C[43])+C[8]*DP[1]-C[38])+C[5]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[14]):Q1[14]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[68];
D=+C[5];
R=+S[0]*(S[0]-C[38])+C[39];
R*=(N/D);
Prop=1*Q2[15];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[68];
D=+C[5];
R=+DP[1]*(DP[1]*(DP[0]*(C[41]+DP[0]-2*DP[1])+DP[1]*(DP[1]-C[40])+C[42])+
 DP[0]*(-C[38]-C[43]*DP[0]))+C[5]*S[1];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[15]):Q1[15])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[69];
D=+C[5];
R=+DP[1]*(DP[0]*(DP[1]-C[43])+C[8]*DP[1]-C[38])+C[5]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[15]):Q1[15]);
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[70];
D=+C[1];
R=+DP[0]*(DP[0]-C[2])+C[3];
R*=(N/D);
Prop=1;
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;

}
return ans;
}

static void C26(REAL*C)
{
  REAL* V=va_ext;
REAL S[23];                                                           
S[0]=V[7759]*V[7759];
C[70]=+S[0];
S[1]=V[4134]*V[4134];
C[69]=+8*V[7759]*S[1];
S[2]=V[4134]*V[4134]*V[4134]*V[4134];
C[68]=+16*S[2];
S[3]=V[4132]*V[4132];
C[67]=+8*V[7759]*S[3];
C[66]=+32*S[1]*S[3];
S[4]=V[4132]*V[4132]*V[4132]*V[4132];
C[65]=+16*S[4];
S[5]=V[4130]*V[4130];
C[64]=+8*V[7759]*S[5];
C[63]=+32*S[1]*S[5];
C[62]=+32*S[3]*S[5];
S[6]=V[4130]*V[4130]*V[4130]*V[4130];
C[61]=+16*S[6];
S[7]=V[4128]*V[4128];
C[60]=+8*V[7759]*S[7];
C[59]=+32*S[1]*S[7];
C[58]=+32*S[3]*S[7];
C[57]=+32*S[5]*S[7];
S[8]=V[4128]*V[4128]*V[4128]*V[4128];
C[56]=+16*S[8];
S[9]=V[4126]*V[4126];
C[55]=+8*V[7759]*S[9];
C[54]=+32*S[1]*S[9];
C[53]=+32*S[3]*S[9];
C[52]=+32*S[5]*S[9];
C[51]=+32*S[7]*S[9];
S[10]=V[4126]*V[4126]*V[4126]*V[4126];
C[50]=+16*S[10];
S[11]=V[4124]*V[4124];
C[49]=+8*V[7759]*S[11];
C[48]=+32*S[1]*S[11];
C[47]=+32*S[3]*S[11];
C[46]=+32*S[5]*S[11];
C[45]=+32*S[7]*S[11];
C[44]=+32*S[9]*S[11];
S[12]=V[27]*V[27];
C[43]=+2*S[12];
S[13]=V[3]*V[3]*V[3]*V[3];
C[42]=+S[13];
S[14]=V[3]*V[3];
C[41]=+2*(S[12]+S[14]);
C[40]=+2*S[14];
S[15]=V[27]*V[27]*V[27]*V[27];
C[39]=+S[15]*S[13];
C[38]=+2*S[12]*S[14];
S[16]=V[4124]*V[4124]*V[4124]*V[4124];
C[37]=+16*S[16];
C[36]=+V[7759]*V[4149]*V[2954];
C[35]=+8*V[4149]*S[1]*V[2954];
C[34]=+8*V[4149]*S[3]*V[2954];
C[33]=+8*V[4149]*S[5]*V[2954];
C[32]=+8*V[4149]*S[7]*V[2954];
C[31]=+8*V[4149]*S[9]*V[2954];
C[30]=+8*V[4149]*S[11]*V[2954];
S[17]=V[4149]*V[4149];
S[18]=V[2954]*V[2954];
C[29]=+S[17]*S[18];
C[28]=+V[7759]*V[4147]*V[2306];
C[27]=+8*V[4147]*S[1]*V[2306];
C[26]=+8*V[4147]*S[3]*V[2306];
C[25]=+8*V[4147]*S[5]*V[2306];
C[24]=+8*V[4147]*S[7]*V[2306];
C[23]=+8*V[4147]*S[9]*V[2306];
C[22]=+8*V[4147]*S[11]*V[2306];
C[21]=+V[4149]*V[4147]*V[2954]*V[2306];
S[19]=V[4147]*V[4147];
S[20]=V[2306]*V[2306];
C[20]=+S[19]*S[20];
C[19]=+V[7759]*V[4145]*V[1658];
C[18]=+8*V[4145]*S[1]*V[1658];
C[17]=+8*V[4145]*S[3]*V[1658];
C[16]=+8*V[4145]*S[5]*V[1658];
C[15]=+8*V[4145]*S[7]*V[1658];
C[14]=+8*V[4145]*S[9]*V[1658];
C[13]=+S[13]*(S[12]-S[14]);
C[12]=+S[14]*(3*S[14]-2*S[12])+S[15];
C[11]=+S[12]-3*S[14];
C[10]=+2*S[13];
C[9]=+4*S[14];
C[8]=+S[12]+S[14];
C[7]=+8*V[4145]*S[11]*V[1658];
C[6]=+V[4149]*V[4145]*V[2954]*V[1658];
C[5]=+S[15];
C[4]=+V[4147]*V[4145]*V[2306]*V[1658];
C[3]=+S[14]*(S[14]-2*S[12])+3*S[15];
C[2]=+2*(S[12]-S[14]);
C[1]=+2*S[15];
S[21]=V[4145]*V[4145];
S[22]=V[1658]*V[1658];
C[0]=+S[21]*S[22];
}
