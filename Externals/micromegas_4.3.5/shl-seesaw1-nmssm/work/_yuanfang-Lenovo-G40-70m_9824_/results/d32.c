/*******************************
*    CalcHEP  3.6.28*
*******************************/
#include"num_in.h"
#include"num_out.h"
static void C32(REAL *);
extern DNN S32_ext;
REAL S32_ext(double GG, REAL * momenta,REAL*cb_coeff,int * err)
{REAL  ans=0;
REAL DP[6];
REAL* V=va_ext;
REAL mass[16],width[16];
char * Qtxt[16];
REAL Q0[16]; COMPLEX Q1[16]; REAL Q2[16];
 if(momenta)
 {width[15]=0.; mass[15]=V[32];  Qtxt[15]="\1\4";
width[14]=0.; mass[14]=V[31];  Qtxt[14]="\1\4";
width[13]=0.; mass[13]=V[30];  Qtxt[13]="\1\4";
width[12]=0.; mass[12]=V[29];  Qtxt[12]="\1\4";
width[11]=0.; mass[11]=V[28];  Qtxt[11]="\1\4";
width[10]=0.; mass[10]=V[32];  Qtxt[10]="\1\3";
width[9]=0.; mass[9]=V[31];  Qtxt[9]="\1\3";
width[8]=0.; mass[8]=V[30];  Qtxt[8]="\1\3";
width[7]=0.; mass[7]=V[29];  Qtxt[7]="\1\3";
width[6]=0.; mass[6]=V[28];  Qtxt[6]="\1\3";
width[5]=V[7764]; mass[5]=V[25];  Qtxt[5]="\1\2";
width[4]=V[7763]; mass[4]=V[24];  Qtxt[4]="\1\2";
width[3]=V[7762]; mass[3]=V[23];  Qtxt[3]="\1\2";
width[2]=V[7761]; mass[2]=V[22];  Qtxt[2]="\1\2";
width[1]=V[7760]; mass[1]=V[21];  Qtxt[1]="\1\2";
*err=*err|prepDen(15,nin_ext,BWrange_ext*
 BWrange_ext,mass,width,Qtxt,momenta,Q0,Q1,Q2);
sprod_(4, momenta, DP);
}
{
REAL N,D,R; COMPLEX Prop;
                                                                      
if(!momenta){ C32(C); return 0;}
  REAL N_p1p2_=1/DP[0];
N=+C[0];
D=+1;
R=+C[1]*DP[0]-C[2];
R*=(N/D);
Prop=1*Q2[1];
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[3];
D=+1;
R=+C[4]*DP[0]-C[5];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[2]):conj(
 Q1[2]));
if(gswidth_ext ) Prop=Prop*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[6];
D=+1;
R=+C[7]*DP[0]-C[8];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[9];
D=+1;
R=+C[10]*DP[0]-C[11];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[12];
D=+1;
R=+C[13]*DP[0]-C[14];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gswidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[15];
D=+1;
R=+C[17]*DP[0]-C[18]+C[16]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[15];
D=+1;
R=+C[20]*DP[0]-C[21]+C[19]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[15];
D=+1;
R=+C[23]*DP[0]-C[24]+C[22]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[15];
D=+1;
R=+C[26]*DP[0]-C[27]+C[25]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[15];
D=+1;
R=+C[29]*DP[0]-C[30]+C[28]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[15];
D=+1;
R=+C[32]-C[31]*DP[0]+C[16]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[15];
D=+1;
R=+C[34]-C[33]*DP[0]+C[19]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[15];
D=+1;
R=+C[36]-C[35]*DP[0]+C[22]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[15];
D=+1;
R=+C[38]-C[37]*DP[0]+C[25]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[15];
D=+1;
R=+C[40]-C[39]*DP[0]+C[28]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[1]):Q1[1])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[41];
D=+1;
R=+C[42]*DP[0]-C[43];
R*=(N/D);
Prop=1*Q2[2];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[44];
D=+1;
R=+C[45]*DP[0]-C[46];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gswidth_ext? creal(Q1[3]):conj(
 Q1[3]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[47];
D=+1;
R=+C[48]*DP[0]-C[49];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gswidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[50];
D=+1;
R=+C[51]*DP[0]-C[52];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gswidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[53];
D=+1;
R=+C[55]*DP[0]-C[56]+C[54]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[53];
D=+1;
R=+C[58]*DP[0]-C[59]+C[57]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[53];
D=+1;
R=+C[61]*DP[0]-C[62]+C[60]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[53];
D=+1;
R=+C[64]*DP[0]-C[65]+C[63]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[53];
D=+1;
R=+C[67]*DP[0]-C[68]+C[66]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+1;
R=+C[70]-C[69]*DP[0]+C[54]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+1;
R=+C[72]-C[71]*DP[0]+C[57]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+1;
R=+C[74]-C[73]*DP[0]+C[60]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+1;
R=+C[76]-C[75]*DP[0]+C[63]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[53];
D=+1;
R=+C[78]-C[77]*DP[0]+C[66]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[2]):Q1[2])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[79];
D=+1;
R=+C[80]*DP[0]-C[81];
R*=(N/D);
Prop=1*Q2[3];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[82];
D=+1;
R=+C[83]*DP[0]-C[84];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gswidth_ext? creal(Q1[4]):conj(
 Q1[4]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[85];
D=+1;
R=+C[86]*DP[0]-C[87];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gswidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[88];
D=+1;
R=+C[90]*DP[0]-C[91]+C[89]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[88];
D=+1;
R=+C[93]*DP[0]-C[94]+C[92]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[88];
D=+1;
R=+C[96]*DP[0]-C[97]+C[95]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[88];
D=+1;
R=+C[99]*DP[0]-C[100]+C[98]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[88];
D=+1;
R=+C[102]*DP[0]-C[103]+C[101]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[88];
D=+1;
R=+C[105]-C[104]*DP[0]+C[89]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[88];
D=+1;
R=+C[107]-C[106]*DP[0]+C[92]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[88];
D=+1;
R=+C[109]-C[108]*DP[0]+C[95]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[88];
D=+1;
R=+C[111]-C[110]*DP[0]+C[98]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[88];
D=+1;
R=+C[113]-C[112]*DP[0]+C[101]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[3]):Q1[3])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[114];
D=+1;
R=+C[115]*DP[0]-C[116];
R*=(N/D);
Prop=1*Q2[4];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[117];
D=+1;
R=+C[118]*DP[0]-C[119];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gswidth_ext? creal(Q1[5]):conj(
 Q1[5]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[120];
D=+1;
R=+C[122]*DP[0]-C[123]+C[121]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[120];
D=+1;
R=+C[125]*DP[0]-C[126]+C[124]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[120];
D=+1;
R=+C[128]*DP[0]-C[129]+C[127]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[120];
D=+1;
R=+C[131]*DP[0]-C[132]+C[130]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[120];
D=+1;
R=+C[134]*DP[0]-C[135]+C[133]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[120];
D=+1;
R=+C[137]-C[136]*DP[0]+C[121]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[120];
D=+1;
R=+C[139]-C[138]*DP[0]+C[124]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[120];
D=+1;
R=+C[141]-C[140]*DP[0]+C[127]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[120];
D=+1;
R=+C[143]-C[142]*DP[0]+C[130]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[120];
D=+1;
R=+C[145]-C[144]*DP[0]+C[133]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[4]):Q1[4])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[146];
D=+1;
R=+C[147]*DP[0]-C[148];
R*=(N/D);
Prop=1*Q2[5];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[149];
D=+1;
R=+C[151]*DP[0]-C[152]+C[150]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[6]):conj(
 Q1[6]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[149];
D=+1;
R=+C[154]*DP[0]-C[155]+C[153]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[149];
D=+1;
R=+C[157]*DP[0]-C[158]+C[156]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[149];
D=+1;
R=+C[160]*DP[0]-C[161]+C[159]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+C[149];
D=+1;
R=+C[163]*DP[0]-C[164]+C[162]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[149];
D=+1;
R=+C[166]-C[165]*DP[0]+C[150]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[149];
D=+1;
R=+C[168]-C[167]*DP[0]+C[153]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[149];
D=+1;
R=+C[170]-C[169]*DP[0]+C[156]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[149];
D=+1;
R=+C[172]-C[171]*DP[0]+C[159]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-C[149];
D=+1;
R=+C[174]-C[173]*DP[0]+C[162]*DP[1];
R*=(N/D);
Prop=1*(gswidth_ext? creal(Q1[5]):Q1[5])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[175]*(DP[1]-DP[0])-C[176])+C[178]+C[177]*DP[0];
R*=(N/D);
Prop=1*Q2[6];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[179]*(DP[1]-DP[0])-C[180])+C[182]-C[181]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[7]):conj(
 Q1[7]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[183]*(DP[1]-DP[0])-C[184])+C[186]-C[185]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[187]*(DP[1]-DP[0])-C[188])+C[190]-C[189]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[191]*(DP[1]-DP[0])-C[192])+C[194]-C[193]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[195]*(DP[1]-DP[0])+C[196])+C[197]*DP[0]-C[198];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[179]*(DP[1]-DP[0])+C[199])+C[200]*DP[0]-C[201];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[183]*(DP[1]-DP[0])+C[202])+C[203]*DP[0]-C[204];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[187]*(DP[1]-DP[0])+C[205])+C[206]*DP[0]-C[207];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[191]*(DP[1]-DP[0])+C[208])+C[209]*DP[0]-C[210];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[6]):Q1[6])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[211]*(DP[1]-DP[0])-C[212])+C[214]+C[213]*DP[0];
R*=(N/D);
Prop=1*Q2[7];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[215]*(DP[1]-DP[0])-C[216])+C[218]-C[217]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[8]):conj(
 Q1[8]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[219]*(DP[1]-DP[0])-C[220])+C[222]-C[221]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[223]*(DP[1]-DP[0])-C[224])+C[226]-C[225]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[179]*(DP[1]-DP[0])-C[227])+C[228]*DP[0]-C[229];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[230]*(DP[1]-DP[0])+C[231])+C[232]*DP[0]-C[233];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[215]*(DP[1]-DP[0])+C[234])+C[235]*DP[0]-C[236];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[219]*(DP[1]-DP[0])+C[237])+C[238]*DP[0]-C[239];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[223]*(DP[1]-DP[0])+C[240])+C[241]*DP[0]-C[242];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[7]):Q1[7])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[243]*(DP[1]-DP[0])-C[244])+C[246]+C[245]*DP[0];
R*=(N/D);
Prop=1*Q2[8];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[247]*(DP[1]-DP[0])-C[248])+C[250]-C[249]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[9]):conj(
 Q1[9]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[251]*(DP[1]-DP[0])-C[252])+C[254]-C[253]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[183]*(DP[1]-DP[0])-C[255])+C[256]*DP[0]-C[257];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[215]*(DP[1]-DP[0])-C[258])+C[259]*DP[0]-C[260];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[261]*(DP[1]-DP[0])+C[262])+C[263]*DP[0]-C[264];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[247]*(DP[1]-DP[0])+C[265])+C[266]*DP[0]-C[267];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[251]*(DP[1]-DP[0])+C[268])+C[269]*DP[0]-C[270];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[8]):Q1[8])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[271]*(DP[1]-DP[0])-C[272])+C[274]+C[273]*DP[0];
R*=(N/D);
Prop=1*Q2[9];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[275]*(DP[1]-DP[0])-C[276])+C[278]-C[277]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[10]):conj(
 Q1[10]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[187]*(DP[1]-DP[0])-C[279])+C[280]*DP[0]-C[281];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[219]*(DP[1]-DP[0])-C[282])+C[283]*DP[0]-C[284];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[247]*(DP[1]-DP[0])-C[285])+C[286]*DP[0]-C[287];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[288]*(DP[1]-DP[0])+C[289])+C[290]*DP[0]-C[291];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[275]*(DP[1]-DP[0])+C[292])+C[293]*DP[0]-C[294];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[9]):Q1[9])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[295]*(DP[1]-DP[0])-C[296])+C[298]+C[297]*DP[0];
R*=(N/D);
Prop=1*Q2[10];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[191]*(DP[1]-DP[0])-C[299])+C[300]*DP[0]-C[301];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[11]):conj(
 Q1[11]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[223]*(DP[1]-DP[0])-C[302])+C[303]*DP[0]-C[304];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[251]*(DP[1]-DP[0])-C[305])+C[306]*DP[0]-C[307];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[275]*(DP[1]-DP[0])-C[308])+C[309]*DP[0]-C[310];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=+2;
D=+1;
R=+DP[1]*(C[311]*(DP[1]-DP[0])+C[312])+C[313]*DP[0]-C[314];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[10]):Q1[10])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[175]*(DP[1]-DP[0])+C[315])+C[317]-C[316]*DP[0];
R*=(N/D);
Prop=1*Q2[11];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[179]*(DP[1]-DP[0])+C[318])+C[320]-C[319]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[12]):conj(
 Q1[12]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[183]*(DP[1]-DP[0])+C[321])+C[323]-C[322]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[187]*(DP[1]-DP[0])+C[324])+C[326]-C[325]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[191]*(DP[1]-DP[0])+C[327])+C[329]-C[328]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[11]):Q1[11])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[211]*(DP[1]-DP[0])+C[330])+C[332]-C[331]*DP[0];
R*=(N/D);
Prop=1*Q2[12];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[215]*(DP[1]-DP[0])+C[333])+C[335]-C[334]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[13]):conj(
 Q1[13]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[219]*(DP[1]-DP[0])+C[336])+C[338]-C[337]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[223]*(DP[1]-DP[0])+C[339])+C[341]-C[340]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[12]):Q1[12])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[243]*(DP[1]-DP[0])+C[342])+C[344]-C[343]*DP[0];
R*=(N/D);
Prop=1*Q2[13];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[247]*(DP[1]-DP[0])+C[345])+C[347]-C[346]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[14]):conj(
 Q1[14]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[251]*(DP[1]-DP[0])+C[348])+C[350]-C[349]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[13]):Q1[13])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[271]*(DP[1]-DP[0])+C[351])+C[353]-C[352]*DP[0];
R*=(N/D);
Prop=1*Q2[14];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[275]*(DP[1]-DP[0])+C[354])+C[356]-C[355]*DP[0];
R*=(N/D);
Prop=1*(gtwidth_ext? creal(Q1[14]):Q1[14])*(gtwidth_ext? creal(Q1[15]):conj(
 Q1[15]));
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;
N=-2;
D=+1;
R=+DP[1]*(C[295]*(DP[1]-DP[0])+C[357])+C[359]-C[358]*DP[0];
R*=(N/D);
Prop=1*Q2[15];
if(gswidth_ext ) Prop=Prop*Q0[1]*Q0[2]*Q0[3]*Q0[4]*Q0[5];
R*=creal(Prop);
 if(R>Fmax) Fmax=R; else if(R<-Fmax) Fmax=-R;
ans+=R;

}
return ans;
}

static void C32(REAL*C)
{
  REAL* V=va_ext;
                                                                      
S[0]=V[3]*V[3];
S[1]=V[32]*V[32];
S[2]=V[34]*V[34];
S[3]=V[33]*V[33];
S[4]=V[5775]*V[5775];
S[5]=V[5785]*V[5785];
S[6]=V[5765]*V[5765];
C[359]=+V[5755]*(V[5785]*(V[5765]*(V[5775]*(S[0]*(2*(S[0]-S[1])-3*S[2]-
 S[3])+S[2]*(S[2]+S[3]+S[1])+S[3]*S[1])+V[32]*(V[34]*(V[5785]*(S[2]+S[3]-2*
 S[0]))))+V[33]*(V[5755]*(V[34]*(V[34]*(V[5785]*V[34]+2*V[5775]*V[32])-
 V[5785]*S[0])-2*V[5775]*V[32]*S[0])))+S[4]*(V[32]*(V[34]*(V[5765]*(S[2]+
 S[3]-2*S[0])+V[5755]*V[33]*V[32]))))+S[6]*(V[33]*(V[34]*(V[5775]*(V[34]*(2*
 V[5785]*V[32]+V[5775]*V[34])-V[5775]*S[0])+S[5]*S[1])-2*V[5785]*V[5775]*
 V[32]*S[0]));
C[358]=+2*(V[5755]*(V[5785]*(V[5765]*(V[5775]*(S[2]+S[1]-S[0])+V[5785]*
 V[34]*V[32])+V[33]*(V[5755]*(V[5785]*V[34]+V[5775]*V[32])))+S[4]*V[5765]*
 V[34]*V[32])+S[6]*(V[33]*(V[5775]*(V[5785]*V[32]+V[5775]*V[34]))));
C[357]=+V[5755]*(V[5785]*(V[34]*(V[5765]*(2*V[5785]*V[32]+4*V[5775]*V[34])+
 2*V[5785]*V[5755]*V[33])+V[5775]*(2*V[5755]*V[33]*V[32]-4*V[5765]*S[0]))+2*
 S[4]*V[5765]*V[34]*V[32])+S[6]*(V[33]*(V[5775]*(2*(V[5785]*V[32]+V[5775]*
 V[34]))));
tmp[0]=+V[34]*(V[34]*(V[5635]*(V[5665]*(V[5765]*(V[5775]*(S[2]+S[3]-3*S[0])+
 V[5785]*V[34]*V[32])+V[33]*(V[5755]*(2*(V[5785]*V[34]+V[5775]*V[32]))))+
 V[31]*(V[5655]*(V[5765]*(V[5785]*V[32]+V[5775]*V[34])+2*V[5785]*V[5755]*
 V[33])))+V[5645]*(V[5655]*(V[5755]*(V[5785]*(S[2]+S[3]-3*S[0])+V[5775]*
 V[34]*V[32])+V[33]*(V[5765]*(2*(V[5785]*V[32]+V[5775]*V[34]))))+V[31]*(
 V[5665]*(V[5755]*(V[5785]*V[34]+V[5775]*V[32])+2*V[5775]*V[5765]*V[33]))))+
 V[33]*(V[31]*(V[32]*(2*(V[5785]*V[5765]*V[5665]*V[5645]+V[5775]*V[5755]*
 V[5655]*V[5635]))+V[33]*(V[5785]*V[5755]*V[5665]*V[5645]+V[5775]*V[5765]*
 V[5655]*V[5635]))+S[0]*(2*(-V[5785]*V[5755]*V[5665]*V[5635]-V[5775]*
 V[5765]*V[5655]*V[5645]))+V[32]*(V[33]*(V[5785]*V[5765]*V[5665]*V[5635]+
 V[5775]*V[5755]*V[5655]*V[5645])))+S[0]*(2*(V[31]*(-V[5785]*V[5755]*
 V[5665]*V[5645]-V[5775]*V[5765]*V[5655]*V[5635])+V[32]*(-V[5785]*V[5765]*
 V[5665]*V[5635]-V[5775]*V[5755]*V[5655]*V[5645]))));
C[356]=+S[0]*(2*(V[31]*(V[32]*(-V[5785]*V[5765]*V[5655]*V[5635]-V[5775]*
 V[5755]*V[5665]*V[5645])+V[33]*(-V[5785]*V[5755]*V[5655]*V[5635]-V[5775]*
 V[5765]*V[5665]*V[5645]))+S[0]*(V[5785]*V[5755]*V[5655]*V[5645]+V[5775]*
 V[5765]*V[5665]*V[5635])+V[32]*(V[33]*(-V[5785]*V[5765]*V[5655]*V[5645]-
 V[5775]*V[5755]*V[5665]*V[5635])))+S[3]*(-V[5785]*V[5755]*V[5655]*V[5645]-
 V[5775]*V[5765]*V[5665]*V[5635]))+S[3]*(V[31]*(V[32]*(V[5785]*V[5765]*
 V[5655]*V[5635]+V[5775]*V[5755]*V[5665]*V[5645])))+tmp[0];
C[355]=+2*(V[5635]*(V[5765]*(V[34]*(V[5665]*(V[5785]*V[32]+V[5775]*V[34])+
 V[5775]*V[5655]*V[31])+V[5785]*V[5655]*V[32]*V[31]-V[5775]*V[5665]*S[0])+
 V[33]*(V[5755]*(V[5785]*V[5655]*V[31]+V[5775]*V[5665]*V[32])))+V[5645]*(
 V[5755]*(V[34]*(V[5655]*(V[5785]*V[34]+V[5775]*V[32])+V[5785]*V[5665]*
 V[31])+V[5775]*V[5665]*V[32]*V[31]-V[5785]*V[5655]*S[0])+V[33]*(V[5765]*(
 V[5785]*V[5655]*V[32]+V[5775]*V[5665]*V[31]))))+V[33]*(V[34]*(4*(V[5785]*
 V[5755]*V[5665]*V[5635]+V[5775]*V[5765]*V[5655]*V[5645])));
C[354]=+V[34]*(V[5635]*(V[5665]*(V[5765]*(2*V[5785]*V[32]+4*V[5775]*V[34])+
 4*V[5785]*V[5755]*V[33])+2*V[5775]*V[5765]*V[5655]*V[31])+V[5645]*(V[5655]*
 (V[5755]*(4*V[5785]*V[34]+2*V[5775]*V[32])+4*V[5775]*V[5765]*V[33])+2*
 V[5785]*V[5755]*V[5665]*V[31]))+V[33]*(2*(V[31]*(V[5785]*V[5755]*V[5655]*
 V[5635]+V[5775]*V[5765]*V[5665]*V[5645])+V[32]*(V[5785]*V[5765]*V[5655]*
 V[5645]+V[5775]*V[5755]*V[5665]*V[5635])))+S[0]*(4*(-V[5785]*V[5755]*
 V[5655]*V[5645]-V[5775]*V[5765]*V[5665]*V[5635]));
S[7]=V[31]*V[31];
S[8]=V[5655]*V[5655];
S[9]=V[5665]*V[5665];
S[10]=V[5645]*V[5645];
C[353]=+V[5635]*(V[5665]*(V[5645]*(V[5655]*(S[0]*(2*(S[0]-S[7])-3*S[2]-
 S[3])+S[2]*(S[2]+S[3]+S[7])+S[3]*S[7])+V[31]*(V[34]*(V[5665]*(S[2]+S[3]-2*
 S[0]))))+V[33]*(V[5635]*(V[34]*(V[34]*(V[5665]*V[34]+2*V[5655]*V[31])-
 V[5665]*S[0])-2*V[5655]*V[31]*S[0])))+S[8]*(V[31]*(V[34]*(V[5645]*(S[2]+
 S[3]-2*S[0])+V[5635]*V[33]*V[31]))))+S[10]*(V[33]*(V[34]*(V[5655]*(V[34]*(
 2*V[5665]*V[31]+V[5655]*V[34])-V[5655]*S[0])+S[9]*S[7])-2*V[5665]*V[5655]*
 V[31]*S[0]));
C[352]=+2*(V[5635]*(V[5665]*(V[5645]*(V[5655]*(S[2]+S[7]-S[0])+V[5665]*
 V[34]*V[31])+V[33]*(V[5635]*(V[5665]*V[34]+V[5655]*V[31])))+S[8]*V[5645]*
 V[34]*V[31])+S[10]*(V[33]*(V[5655]*(V[5665]*V[31]+V[5655]*V[34]))));
C[351]=+V[5635]*(V[5665]*(V[34]*(V[5645]*(2*V[5665]*V[31]+4*V[5655]*V[34])+
 2*V[5665]*V[5635]*V[33])+V[5655]*(2*V[5635]*V[33]*V[31]-4*V[5645]*S[0]))+2*
 S[8]*V[5645]*V[34]*V[31])+S[10]*(V[33]*(V[5655]*(2*(V[5665]*V[31]+V[5655]*
 V[34]))));
tmp[0]=+V[34]*(V[34]*(V[5515]*(V[5545]*(V[5765]*(V[5775]*(S[2]+S[3]-3*S[0])+
 V[5785]*V[34]*V[32])+V[33]*(V[5755]*(2*(V[5785]*V[34]+V[5775]*V[32]))))+
 V[30]*(V[5535]*(V[5765]*(V[5785]*V[32]+V[5775]*V[34])+2*V[5785]*V[5755]*
 V[33])))+V[5525]*(V[5535]*(V[5755]*(V[5785]*(S[2]+S[3]-3*S[0])+V[5775]*
 V[34]*V[32])+V[33]*(V[5765]*(2*(V[5785]*V[32]+V[5775]*V[34]))))+V[30]*(
 V[5545]*(V[5755]*(V[5785]*V[34]+V[5775]*V[32])+2*V[5775]*V[5765]*V[33]))))+
 V[33]*(V[30]*(V[32]*(2*(V[5785]*V[5765]*V[5545]*V[5525]+V[5775]*V[5755]*
 V[5535]*V[5515]))+V[33]*(V[5785]*V[5755]*V[5545]*V[5525]+V[5775]*V[5765]*
 V[5535]*V[5515]))+S[0]*(2*(-V[5785]*V[5755]*V[5545]*V[5515]-V[5775]*
 V[5765]*V[5535]*V[5525]))+V[32]*(V[33]*(V[5785]*V[5765]*V[5545]*V[5515]+
 V[5775]*V[5755]*V[5535]*V[5525])))+S[0]*(2*(V[30]*(-V[5785]*V[5755]*
 V[5545]*V[5525]-V[5775]*V[5765]*V[5535]*V[5515])+V[32]*(-V[5785]*V[5765]*
 V[5545]*V[5515]-V[5775]*V[5755]*V[5535]*V[5525]))));
C[350]=+S[0]*(2*(V[30]*(V[32]*(-V[5785]*V[5765]*V[5535]*V[5515]-V[5775]*
 V[5755]*V[5545]*V[5525])+V[33]*(-V[5785]*V[5755]*V[5535]*V[5515]-V[5775]*
 V[5765]*V[5545]*V[5525]))+S[0]*(V[5785]*V[5755]*V[5535]*V[5525]+V[5775]*
 V[5765]*V[5545]*V[5515])+V[32]*(V[33]*(-V[5785]*V[5765]*V[5535]*V[5525]-
 V[5775]*V[5755]*V[5545]*V[5515])))+S[3]*(-V[5785]*V[5755]*V[5535]*V[5525]-
 V[5775]*V[5765]*V[5545]*V[5515]))+S[3]*(V[30]*(V[32]*(V[5785]*V[5765]*
 V[5535]*V[5515]+V[5775]*V[5755]*V[5545]*V[5525])))+tmp[0];
C[349]=+2*(V[5515]*(V[5765]*(V[34]*(V[5545]*(V[5785]*V[32]+V[5775]*V[34])+
 V[5775]*V[5535]*V[30])+V[5785]*V[5535]*V[32]*V[30]-V[5775]*V[5545]*S[0])+
 V[33]*(V[5755]*(V[5785]*V[5535]*V[30]+V[5775]*V[5545]*V[32])))+V[5525]*(
 V[5755]*(V[34]*(V[5535]*(V[5785]*V[34]+V[5775]*V[32])+V[5785]*V[5545]*
 V[30])+V[5775]*V[5545]*V[32]*V[30]-V[5785]*V[5535]*S[0])+V[33]*(V[5765]*(
 V[5785]*V[5535]*V[32]+V[5775]*V[5545]*V[30]))))+V[33]*(V[34]*(4*(V[5785]*
 V[5755]*V[5545]*V[5515]+V[5775]*V[5765]*V[5535]*V[5525])));
C[348]=+V[34]*(V[5515]*(V[5545]*(V[5765]*(2*V[5785]*V[32]+4*V[5775]*V[34])+
 4*V[5785]*V[5755]*V[33])+2*V[5775]*V[5765]*V[5535]*V[30])+V[5525]*(V[5535]*
 (V[5755]*(4*V[5785]*V[34]+2*V[5775]*V[32])+4*V[5775]*V[5765]*V[33])+2*
 V[5785]*V[5755]*V[5545]*V[30]))+V[33]*(2*(V[30]*(V[5785]*V[5755]*V[5535]*
 V[5515]+V[5775]*V[5765]*V[5545]*V[5525])+V[32]*(V[5785]*V[5765]*V[5535]*
 V[5525]+V[5775]*V[5755]*V[5545]*V[5515])))+S[0]*(4*(-V[5785]*V[5755]*
 V[5535]*V[5525]-V[5775]*V[5765]*V[5545]*V[5515]));
tmp[0]=+V[34]*(V[34]*(V[5515]*(V[5545]*(V[5645]*(V[5655]*(S[2]+S[3]-3*S[0])+
 V[5665]*V[34]*V[31])+V[33]*(V[5635]*(2*(V[5665]*V[34]+V[5655]*V[31]))))+
 V[30]*(V[5535]*(V[5645]*(V[5665]*V[31]+V[5655]*V[34])+2*V[5665]*V[5635]*
 V[33])))+V[5525]*(V[5535]*(V[5635]*(V[5665]*(S[2]+S[3]-3*S[0])+V[5655]*
 V[34]*V[31])+V[33]*(V[5645]*(2*(V[5665]*V[31]+V[5655]*V[34]))))+V[30]*(
 V[5545]*(V[5635]*(V[5665]*V[34]+V[5655]*V[31])+2*V[5655]*V[5645]*V[33]))))+
 V[33]*(V[30]*(V[31]*(2*(V[5665]*V[5645]*V[5545]*V[5525]+V[5655]*V[5635]*
 V[5535]*V[5515]))+V[33]*(V[5665]*V[5635]*V[5545]*V[5525]+V[5655]*V[5645]*
 V[5535]*V[5515]))+S[0]*(2*(-V[5665]*V[5635]*V[5545]*V[5515]-V[5655]*
 V[5645]*V[5535]*V[5525]))+V[31]*(V[33]*(V[5665]*V[5645]*V[5545]*V[5515]+
 V[5655]*V[5635]*V[5535]*V[5525])))+S[0]*(2*(V[30]*(-V[5665]*V[5635]*
 V[5545]*V[5525]-V[5655]*V[5645]*V[5535]*V[5515])+V[31]*(-V[5665]*V[5645]*
 V[5545]*V[5515]-V[5655]*V[5635]*V[5535]*V[5525]))));
C[347]=+S[0]*(2*(V[30]*(V[31]*(-V[5665]*V[5645]*V[5535]*V[5515]-V[5655]*
 V[5635]*V[5545]*V[5525])+V[33]*(-V[5665]*V[5635]*V[5535]*V[5515]-V[5655]*
 V[5645]*V[5545]*V[5525]))+S[0]*(V[5665]*V[5635]*V[5535]*V[5525]+V[5655]*
 V[5645]*V[5545]*V[5515])+V[31]*(V[33]*(-V[5665]*V[5645]*V[5535]*V[5525]-
 V[5655]*V[5635]*V[5545]*V[5515])))+S[3]*(-V[5665]*V[5635]*V[5535]*V[5525]-
 V[5655]*V[5645]*V[5545]*V[5515]))+S[3]*(V[30]*(V[31]*(V[5665]*V[5645]*
 V[5535]*V[5515]+V[5655]*V[5635]*V[5545]*V[5525])))+tmp[0];
C[346]=+2*(V[5515]*(V[5645]*(V[34]*(V[5545]*(V[5665]*V[31]+V[5655]*V[34])+
 V[5655]*V[5535]*V[30])+V[5665]*V[5535]*V[31]*V[30]-V[5655]*V[5545]*S[0])+
 V[33]*(V[5635]*(V[5665]*V[5535]*V[30]+V[5655]*V[5545]*V[31])))+V[5525]*(
 V[5635]*(V[34]*(V[5535]*(V[5665]*V[34]+V[5655]*V[31])+V[5665]*V[5545]*
 V[30])+V[5655]*V[5545]*V[31]*V[30]-V[5665]*V[5535]*S[0])+V[33]*(V[5645]*(
 V[5665]*V[5535]*V[31]+V[5655]*V[5545]*V[30]))))+V[33]*(V[34]*(4*(V[5665]*
 V[5635]*V[5545]*V[5515]+V[5655]*V[5645]*V[5535]*V[5525])));
C[345]=+V[34]*(V[5515]*(V[5545]*(V[5645]*(2*V[5665]*V[31]+4*V[5655]*V[34])+
 4*V[5665]*V[5635]*V[33])+2*V[5655]*V[5645]*V[5535]*V[30])+V[5525]*(V[5535]*
 (V[5635]*(4*V[5665]*V[34]+2*V[5655]*V[31])+4*V[5655]*V[5645]*V[33])+2*
 V[5665]*V[5635]*V[5545]*V[30]))+V[33]*(2*(V[30]*(V[5665]*V[5635]*V[5535]*
 V[5515]+V[5655]*V[5645]*V[5545]*V[5525])+V[31]*(V[5665]*V[5645]*V[5535]*
 V[5525]+V[5655]*V[5635]*V[5545]*V[5515])))+S[0]*(4*(-V[5665]*V[5635]*
 V[5535]*V[5525]-V[5655]*V[5645]*V[5545]*V[5515]));
S[11]=V[30]*V[30];
S[12]=V[5535]*V[5535];
S[13]=V[5545]*V[5545];
S[14]=V[5525]*V[5525];
C[344]=+V[5515]*(V[5545]*(V[5525]*(V[5535]*(S[0]*(2*(S[0]-S[11])-3*S[2]-
 S[3])+S[2]*(S[2]+S[3]+S[11])+S[3]*S[11])+V[30]*(V[34]*(V[5545]*(S[2]+S[3]-
 2*S[0]))))+V[33]*(V[5515]*(V[34]*(V[34]*(V[5545]*V[34]+2*V[5535]*V[30])-
 V[5545]*S[0])-2*V[5535]*V[30]*S[0])))+S[12]*(V[30]*(V[34]*(V[5525]*(S[2]+
 S[3]-2*S[0])+V[5515]*V[33]*V[30]))))+S[14]*(V[33]*(V[34]*(V[5535]*(V[34]*(
 2*V[5545]*V[30]+V[5535]*V[34])-V[5535]*S[0])+S[13]*S[11])-2*V[5545]*
 V[5535]*V[30]*S[0]));
C[343]=+2*(V[5515]*(V[5545]*(V[5525]*(V[5535]*(S[2]+S[11]-S[0])+V[5545]*
 V[34]*V[30])+V[33]*(V[5515]*(V[5545]*V[34]+V[5535]*V[30])))+S[12]*V[5525]*
 V[34]*V[30])+S[14]*(V[33]*(V[5535]*(V[5545]*V[30]+V[5535]*V[34]))));
C[342]=+V[5515]*(V[5545]*(V[34]*(V[5525]*(2*V[5545]*V[30]+4*V[5535]*V[34])+
 2*V[5545]*V[5515]*V[33])+V[5535]*(2*V[5515]*V[33]*V[30]-4*V[5525]*S[0]))+2*
 S[12]*V[5525]*V[34]*V[30])+S[14]*(V[33]*(V[5535]*(2*(V[5545]*V[30]+V[5535]*
 V[34]))));
tmp[0]=+V[34]*(V[34]*(V[5395]*(V[5425]*(V[5765]*(V[5775]*(S[2]+S[3]-3*S[0])+
 V[5785]*V[34]*V[32])+V[33]*(V[5755]*(2*(V[5785]*V[34]+V[5775]*V[32]))))+
 V[29]*(V[5415]*(V[5765]*(V[5785]*V[32]+V[5775]*V[34])+2*V[5785]*V[5755]*
 V[33])))+V[5405]*(V[5415]*(V[5755]*(V[5785]*(S[2]+S[3]-3*S[0])+V[5775]*
 V[34]*V[32])+V[33]*(V[5765]*(2*(V[5785]*V[32]+V[5775]*V[34]))))+V[29]*(
 V[5425]*(V[5755]*(V[5785]*V[34]+V[5775]*V[32])+2*V[5775]*V[5765]*V[33]))))+
 V[33]*(V[29]*(V[32]*(2*(V[5785]*V[5765]*V[5425]*V[5405]+V[5775]*V[5755]*
 V[5415]*V[5395]))+V[33]*(V[5785]*V[5755]*V[5425]*V[5405]+V[5775]*V[5765]*
 V[5415]*V[5395]))+S[0]*(2*(-V[5785]*V[5755]*V[5425]*V[5395]-V[5775]*
 V[5765]*V[5415]*V[5405]))+V[32]*(V[33]*(V[5785]*V[5765]*V[5425]*V[5395]+
 V[5775]*V[5755]*V[5415]*V[5405])))+S[0]*(2*(V[29]*(-V[5785]*V[5755]*
 V[5425]*V[5405]-V[5775]*V[5765]*V[5415]*V[5395])+V[32]*(-V[5785]*V[5765]*
 V[5425]*V[5395]-V[5775]*V[5755]*V[5415]*V[5405]))));
C[341]=+S[0]*(2*(V[29]*(V[32]*(-V[5785]*V[5765]*V[5415]*V[5395]-V[5775]*
 V[5755]*V[5425]*V[5405])+V[33]*(-V[5785]*V[5755]*V[5415]*V[5395]-V[5775]*
 V[5765]*V[5425]*V[5405]))+S[0]*(V[5785]*V[5755]*V[5415]*V[5405]+V[5775]*
 V[5765]*V[5425]*V[5395])+V[32]*(V[33]*(-V[5785]*V[5765]*V[5415]*V[5405]-
 V[5775]*V[5755]*V[5425]*V[5395])))+S[3]*(-V[5785]*V[5755]*V[5415]*V[5405]-
 V[5775]*V[5765]*V[5425]*V[5395]))+S[3]*(V[29]*(V[32]*(V[5785]*V[5765]*
 V[5415]*V[5395]+V[5775]*V[5755]*V[5425]*V[5405])))+tmp[0];
C[340]=+2*(V[5395]*(V[5765]*(V[34]*(V[5425]*(V[5785]*V[32]+V[5775]*V[34])+
 V[5775]*V[5415]*V[29])+V[5785]*V[5415]*V[32]*V[29]-V[5775]*V[5425]*S[0])+
 V[33]*(V[5755]*(V[5785]*V[5415]*V[29]+V[5775]*V[5425]*V[32])))+V[5405]*(
 V[5755]*(V[34]*(V[5415]*(V[5785]*V[34]+V[5775]*V[32])+V[5785]*V[5425]*
 V[29])+V[5775]*V[5425]*V[32]*V[29]-V[5785]*V[5415]*S[0])+V[33]*(V[5765]*(
 V[5785]*V[5415]*V[32]+V[5775]*V[5425]*V[29]))))+V[33]*(V[34]*(4*(V[5785]*
 V[5755]*V[5425]*V[5395]+V[5775]*V[5765]*V[5415]*V[5405])));
C[339]=+V[34]*(V[5395]*(V[5425]*(V[5765]*(2*V[5785]*V[32]+4*V[5775]*V[34])+
 4*V[5785]*V[5755]*V[33])+2*V[5775]*V[5765]*V[5415]*V[29])+V[5405]*(V[5415]*
 (V[5755]*(4*V[5785]*V[34]+2*V[5775]*V[32])+4*V[5775]*V[5765]*V[33])+2*
 V[5785]*V[5755]*V[5425]*V[29]))+V[33]*(2*(V[29]*(V[5785]*V[5755]*V[5415]*
 V[5395]+V[5775]*V[5765]*V[5425]*V[5405])+V[32]*(V[5785]*V[5765]*V[5415]*
 V[5405]+V[5775]*V[5755]*V[5425]*V[5395])))+S[0]*(4*(-V[5785]*V[5755]*
 V[5415]*V[5405]-V[5775]*V[5765]*V[5425]*V[5395]));
tmp[0]=+V[34]*(V[34]*(V[5395]*(V[5425]*(V[5645]*(V[5655]*(S[2]+S[3]-3*S[0])+
 V[5665]*V[34]*V[31])+V[33]*(V[5635]*(2*(V[5665]*V[34]+V[5655]*V[31]))))+
 V[29]*(V[5415]*(V[5645]*(V[5665]*V[31]+V[5655]*V[34])+2*V[5665]*V[5635]*
 V[33])))+V[5405]*(V[5415]*(V[5635]*(V[5665]*(S[2]+S[3]-3*S[0])+V[5655]*
 V[34]*V[31])+V[33]*(V[5645]*(2*(V[5665]*V[31]+V[5655]*V[34]))))+V[29]*(
 V[5425]*(V[5635]*(V[5665]*V[34]+V[5655]*V[31])+2*V[5655]*V[5645]*V[33]))))+
 V[33]*(V[29]*(V[31]*(2*(V[5665]*V[5645]*V[5425]*V[5405]+V[5655]*V[5635]*
 V[5415]*V[5395]))+V[33]*(V[5665]*V[5635]*V[5425]*V[5405]+V[5655]*V[5645]*
 V[5415]*V[5395]))+S[0]*(2*(-V[5665]*V[5635]*V[5425]*V[5395]-V[5655]*
 V[5645]*V[5415]*V[5405]))+V[31]*(V[33]*(V[5665]*V[5645]*V[5425]*V[5395]+
 V[5655]*V[5635]*V[5415]*V[5405])))+S[0]*(2*(V[29]*(-V[5665]*V[5635]*
 V[5425]*V[5405]-V[5655]*V[5645]*V[5415]*V[5395])+V[31]*(-V[5665]*V[5645]*
 V[5425]*V[5395]-V[5655]*V[5635]*V[5415]*V[5405]))));
C[338]=+S[0]*(2*(V[29]*(V[31]*(-V[5665]*V[5645]*V[5415]*V[5395]-V[5655]*
 V[5635]*V[5425]*V[5405])+V[33]*(-V[5665]*V[5635]*V[5415]*V[5395]-V[5655]*
 V[5645]*V[5425]*V[5405]))+S[0]*(V[5665]*V[5635]*V[5415]*V[5405]+V[5655]*
 V[5645]*V[5425]*V[5395])+V[31]*(V[33]*(-V[5665]*V[5645]*V[5415]*V[5405]-
 V[5655]*V[5635]*V[5425]*V[5395])))+S[3]*(-V[5665]*V[5635]*V[5415]*V[5405]-
 V[5655]*V[5645]*V[5425]*V[5395]))+S[3]*(V[29]*(V[31]*(V[5665]*V[5645]*
 V[5415]*V[5395]+V[5655]*V[5635]*V[5425]*V[5405])))+tmp[0];
C[337]=+2*(V[5395]*(V[5645]*(V[34]*(V[5425]*(V[5665]*V[31]+V[5655]*V[34])+
 V[5655]*V[5415]*V[29])+V[5665]*V[5415]*V[31]*V[29]-V[5655]*V[5425]*S[0])+
 V[33]*(V[5635]*(V[5665]*V[5415]*V[29]+V[5655]*V[5425]*V[31])))+V[5405]*(
 V[5635]*(V[34]*(V[5415]*(V[5665]*V[34]+V[5655]*V[31])+V[5665]*V[5425]*
 V[29])+V[5655]*V[5425]*V[31]*V[29]-V[5665]*V[5415]*S[0])+V[33]*(V[5645]*(
 V[5665]*V[5415]*V[31]+V[5655]*V[5425]*V[29]))))+V[33]*(V[34]*(4*(V[5665]*
 V[5635]*V[5425]*V[5395]+V[5655]*V[5645]*V[5415]*V[5405])));
C[336]=+V[34]*(V[5395]*(V[5425]*(V[5645]*(2*V[5665]*V[31]+4*V[5655]*V[34])+
 4*V[5665]*V[5635]*V[33])+2*V[5655]*V[5645]*V[5415]*V[29])+V[5405]*(V[5415]*
 (V[5635]*(4*V[5665]*V[34]+2*V[5655]*V[31])+4*V[5655]*V[5645]*V[33])+2*
 V[5665]*V[5635]*V[5425]*V[29]))+V[33]*(2*(V[29]*(V[5665]*V[5635]*V[5415]*
 V[5395]+V[5655]*V[5645]*V[5425]*V[5405])+V[31]*(V[5665]*V[5645]*V[5415]*
 V[5405]+V[5655]*V[5635]*V[5425]*V[5395])))+S[0]*(4*(-V[5665]*V[5635]*
 V[5415]*V[5405]-V[5655]*V[5645]*V[5425]*V[5395]));
tmp[0]=+V[34]*(V[34]*(V[5395]*(V[5425]*(V[5525]*(V[5535]*(S[2]+S[3]-3*S[0])+
 V[5545]*V[34]*V[30])+V[33]*(V[5515]*(2*(V[5545]*V[34]+V[5535]*V[30]))))+
 V[29]*(V[5415]*(V[5525]*(V[5545]*V[30]+V[5535]*V[34])+2*V[5545]*V[5515]*
 V[33])))+V[5405]*(V[5415]*(V[5515]*(V[5545]*(S[2]+S[3]-3*S[0])+V[5535]*
 V[34]*V[30])+V[33]*(V[5525]*(2*(V[5545]*V[30]+V[5535]*V[34]))))+V[29]*(
 V[5425]*(V[5515]*(V[5545]*V[34]+V[5535]*V[30])+2*V[5535]*V[5525]*V[33]))))+
 V[33]*(V[29]*(V[30]*(2*(V[5545]*V[5525]*V[5425]*V[5405]+V[5535]*V[5515]*
 V[5415]*V[5395]))+V[33]*(V[5545]*V[5515]*V[5425]*V[5405]+V[5535]*V[5525]*
 V[5415]*V[5395]))+S[0]*(2*(-V[5545]*V[5515]*V[5425]*V[5395]-V[5535]*
 V[5525]*V[5415]*V[5405]))+V[30]*(V[33]*(V[5545]*V[5525]*V[5425]*V[5395]+
 V[5535]*V[5515]*V[5415]*V[5405])))+S[0]*(2*(V[29]*(-V[5545]*V[5515]*
 V[5425]*V[5405]-V[5535]*V[5525]*V[5415]*V[5395])+V[30]*(-V[5545]*V[5525]*
 V[5425]*V[5395]-V[5535]*V[5515]*V[5415]*V[5405]))));
C[335]=+S[0]*(2*(V[29]*(V[30]*(-V[5545]*V[5525]*V[5415]*V[5395]-V[5535]*
 V[5515]*V[5425]*V[5405])+V[33]*(-V[5545]*V[5515]*V[5415]*V[5395]-V[5535]*
 V[5525]*V[5425]*V[5405]))+S[0]*(V[5545]*V[5515]*V[5415]*V[5405]+V[5535]*
 V[5525]*V[5425]*V[5395])+V[30]*(V[33]*(-V[5545]*V[5525]*V[5415]*V[5405]-
 V[5535]*V[5515]*V[5425]*V[5395])))+S[3]*(-V[5545]*V[5515]*V[5415]*V[5405]-
 V[5535]*V[5525]*V[5425]*V[5395]))+S[3]*(V[29]*(V[30]*(V[5545]*V[5525]*
 V[5415]*V[5395]+V[5535]*V[5515]*V[5425]*V[5405])))+tmp[0];
C[334]=+2*(V[5395]*(V[5525]*(V[34]*(V[5425]*(V[5545]*V[30]+V[5535]*V[34])+
 V[5535]*V[5415]*V[29])+V[5545]*V[5415]*V[30]*V[29]-V[5535]*V[5425]*S[0])+
 V[33]*(V[5515]*(V[5545]*V[5415]*V[29]+V[5535]*V[5425]*V[30])))+V[5405]*(
 V[5515]*(V[34]*(V[5415]*(V[5545]*V[34]+V[5535]*V[30])+V[5545]*V[5425]*
 V[29])+V[5535]*V[5425]*V[30]*V[29]-V[5545]*V[5415]*S[0])+V[33]*(V[5525]*(
 V[5545]*V[5415]*V[30]+V[5535]*V[5425]*V[29]))))+V[33]*(V[34]*(4*(V[5545]*
 V[5515]*V[5425]*V[5395]+V[5535]*V[5525]*V[5415]*V[5405])));
C[333]=+V[34]*(V[5395]*(V[5425]*(V[5525]*(2*V[5545]*V[30]+4*V[5535]*V[34])+
 4*V[5545]*V[5515]*V[33])+2*V[5535]*V[5525]*V[5415]*V[29])+V[5405]*(V[5415]*
 (V[5515]*(4*V[5545]*V[34]+2*V[5535]*V[30])+4*V[5535]*V[5525]*V[33])+2*
 V[5545]*V[5515]*V[5425]*V[29]))+V[33]*(2*(V[29]*(V[5545]*V[5515]*V[5415]*
 V[5395]+V[5535]*V[5525]*V[5425]*V[5405])+V[30]*(V[5545]*V[5525]*V[5415]*
 V[5405]+V[5535]*V[5515]*V[5425]*V[5395])))+S[0]*(4*(-V[5545]*V[5515]*
 V[5415]*V[5405]-V[5535]*V[5525]*V[5425]*V[5395]));
S[15]=V[29]*V[29];
S[16]=V[5415]*V[5415];
S[17]=V[5425]*V[5425];
S[18]=V[5405]*V[5405];
C[332]=+V[5395]*(V[5425]*(V[5405]*(V[5415]*(S[0]*(2*(S[0]-S[15])-3*S[2]-
 S[3])+S[2]*(S[2]+S[3]+S[15])+S[3]*S[15])+V[29]*(V[34]*(V[5425]*(S[2]+S[3]-
 2*S[0]))))+V[33]*(V[5395]*(V[34]*(V[34]*(V[5425]*V[34]+2*V[5415]*V[29])-
 V[5425]*S[0])-2*V[5415]*V[29]*S[0])))+S[16]*(V[29]*(V[34]*(V[5405]*(S[2]+
 S[3]-2*S[0])+V[5395]*V[33]*V[29]))))+S[18]*(V[33]*(V[34]*(V[5415]*(V[34]*(
 2*V[5425]*V[29]+V[5415]*V[34])-V[5415]*S[0])+S[17]*S[15])-2*V[5425]*
 V[5415]*V[29]*S[0]));
C[331]=+2*(V[5395]*(V[5425]*(V[5405]*(V[5415]*(S[2]+S[15]-S[0])+V[5425]*
 V[34]*V[29])+V[33]*(V[5395]*(V[5425]*V[34]+V[5415]*V[29])))+S[16]*V[5405]*
 V[34]*V[29])+S[18]*(V[33]*(V[5415]*(V[5425]*V[29]+V[5415]*V[34]))));
C[330]=+V[5395]*(V[5425]*(V[34]*(V[5405]*(2*V[5425]*V[29]+4*V[5415]*V[34])+
 2*V[5425]*V[5395]*V[33])+V[5415]*(2*V[5395]*V[33]*V[29]-4*V[5405]*S[0]))+2*
 S[16]*V[5405]*V[34]*V[29])+S[18]*(V[33]*(V[5415]*(2*(V[5425]*V[29]+V[5415]*
 V[34]))));
tmp[0]=+V[34]*(V[34]*(V[5275]*(V[5305]*(V[5765]*(V[5775]*(S[2]+S[3]-3*S[0])+
 V[5785]*V[34]*V[32])+V[33]*(V[5755]*(2*(V[5785]*V[34]+V[5775]*V[32]))))+
 V[28]*(V[5295]*(V[5765]*(V[5785]*V[32]+V[5775]*V[34])+2*V[5785]*V[5755]*
 V[33])))+V[5285]*(V[5295]*(V[5755]*(V[5785]*(S[2]+S[3]-3*S[0])+V[5775]*
 V[34]*V[32])+V[33]*(V[5765]*(2*(V[5785]*V[32]+V[5775]*V[34]))))+V[28]*(
 V[5305]*(V[5755]*(V[5785]*V[34]+V[5775]*V[32])+2*V[5775]*V[5765]*V[33]))))+
 V[33]*(V[28]*(V[32]*(2*(V[5785]*V[5765]*V[5305]*V[5285]+V[5775]*V[5755]*
 V[5295]*V[5275]))+V[33]*(V[5785]*V[5755]*V[5305]*V[5285]+V[5775]*V[5765]*
 V[5295]*V[5275]))+S[0]*(2*(-V[5785]*V[5755]*V[5305]*V[5275]-V[5775]*
 V[5765]*V[5295]*V[5285]))+V[32]*(V[33]*(V[5785]*V[5765]*V[5305]*V[5275]+
 V[5775]*V[5755]*V[5295]*V[5285])))+S[0]*(2*(V[28]*(-V[5785]*V[5755]*
 V[5305]*V[5285]-V[5775]*V[5765]*V[5295]*V[5275])+V[32]*(-V[5785]*V[5765]*
 V[5305]*V[5275]-V[5775]*V[5755]*V[5295]*V[5285]))));
C[329]=+S[0]*(2*(V[28]*(V[32]*(-V[5785]*V[5765]*V[5295]*V[5275]-V[5775]*
 V[5755]*V[5305]*V[5285])+V[33]*(-V[5785]*V[5755]*V[5295]*V[5275]-V[5775]*
 V[5765]*V[5305]*V[5285]))+S[0]*(V[5785]*V[5755]*V[5295]*V[5285]+V[5775]*
 V[5765]*V[5305]*V[5275])+V[32]*(V[33]*(-V[5785]*V[5765]*V[5295]*V[5285]-
 V[5775]*V[5755]*V[5305]*V[5275])))+S[3]*(-V[5785]*V[5755]*V[5295]*V[5285]-
 V[5775]*V[5765]*V[5305]*V[5275]))+S[3]*(V[28]*(V[32]*(V[5785]*V[5765]*
 V[5295]*V[5275]+V[5775]*V[5755]*V[5305]*V[5285])))+tmp[0];
C[328]=+2*(V[5275]*(V[5765]*(V[34]*(V[5305]*(V[5785]*V[32]+V[5775]*V[34])+
 V[5775]*V[5295]*V[28])+V[5785]*V[5295]*V[32]*V[28]-V[5775]*V[5305]*S[0])+
 V[33]*(V[5755]*(V[5785]*V[5295]*V[28]+V[5775]*V[5305]*V[32])))+V[5285]*(
 V[5755]*(V[34]*(V[5295]*(V[5785]*V[34]+V[5775]*V[32])+V[5785]*V[5305]*
 V[28])+V[5775]*V[5305]*V[32]*V[28]-V[5785]*V[5295]*S[0])+V[33]*(V[5765]*(
 V[5785]*V[5295]*V[32]+V[5775]*V[5305]*V[28]))))+V[33]*(V[34]*(4*(V[5785]*
 V[5755]*V[5305]*V[5275]+V[5775]*V[5765]*V[5295]*V[5285])));
C[327]=+V[34]*(V[5275]*(V[5305]*(V[5765]*(2*V[5785]*V[32]+4*V[5775]*V[34])+
 4*V[5785]*V[5755]*V[33])+2*V[5775]*V[5765]*V[5295]*V[28])+V[5285]*(V[5295]*
 (V[5755]*(4*V[5785]*V[34]+2*V[5775]*V[32])+4*V[5775]*V[5765]*V[33])+2*
 V[5785]*V[5755]*V[5305]*V[28]))+V[33]*(2*(V[28]*(V[5785]*V[5755]*V[5295]*
 V[5275]+V[5775]*V[5765]*V[5305]*V[5285])+V[32]*(V[5785]*V[5765]*V[5295]*
 V[5285]+V[5775]*V[5755]*V[5305]*V[5275])))+S[0]*(4*(-V[5785]*V[5755]*
 V[5295]*V[5285]-V[5775]*V[5765]*V[5305]*V[5275]));
tmp[0]=+V[34]*(V[34]*(V[5275]*(V[5305]*(V[5645]*(V[5655]*(S[2]+S[3]-3*S[0])+
 V[5665]*V[34]*V[31])+V[33]*(V[5635]*(2*(V[5665]*V[34]+V[5655]*V[31]))))+
 V[28]*(V[5295]*(V[5645]*(V[5665]*V[31]+V[5655]*V[34])+2*V[5665]*V[5635]*
 V[33])))+V[5285]*(V[5295]*(V[5635]*(V[5665]*(S[2]+S[3]-3*S[0])+V[5655]*
 V[34]*V[31])+V[33]*(V[5645]*(2*(V[5665]*V[31]+V[5655]*V[34]))))+V[28]*(
 V[5305]*(V[5635]*(V[5665]*V[34]+V[5655]*V[31])+2*V[5655]*V[5645]*V[33]))))+
 V[33]*(V[28]*(V[31]*(2*(V[5665]*V[5645]*V[5305]*V[5285]+V[5655]*V[5635]*
 V[5295]*V[5275]))+V[33]*(V[5665]*V[5635]*V[5305]*V[5285]+V[5655]*V[5645]*
 V[5295]*V[5275]))+S[0]*(2*(-V[5665]*V[5635]*V[5305]*V[5275]-V[5655]*
 V[5645]*V[5295]*V[5285]))+V[31]*(V[33]*(V[5665]*V[5645]*V[5305]*V[5275]+
 V[5655]*V[5635]*V[5295]*V[5285])))+S[0]*(2*(V[28]*(-V[5665]*V[5635]*
 V[5305]*V[5285]-V[5655]*V[5645]*V[5295]*V[5275])+V[31]*(-V[5665]*V[5645]*
 V[5305]*V[5275]-V[5655]*V[5635]*V[5295]*V[5285]))));
C[326]=+S[0]*(2*(V[28]*(V[31]*(-V[5665]*V[5645]*V[5295]*V[5275]-V[5655]*
 V[5635]*V[5305]*V[5285])+V[33]*(-V[5665]*V[5635]*V[5295]*V[5275]-V[5655]*
 V[5645]*V[5305]*V[5285]))+S[0]*(V[5665]*V[5635]*V[5295]*V[5285]+V[5655]*
 V[5645]*V[5305]*V[5275])+V[31]*(V[33]*(-V[5665]*V[5645]*V[5295]*V[5285]-
 V[5655]*V[5635]*V[5305]*V[5275])))+S[3]*(-V[5665]*V[5635]*V[5295]*V[5285]-
 V[5655]*V[5645]*V[5305]*V[5275]))+S[3]*(V[28]*(V[31]*(V[5665]*V[5645]*
 V[5295]*V[5275]+V[5655]*V[5635]*V[5305]*V[5285])))+tmp[0];
C[325]=+2*(V[5275]*(V[5645]*(V[34]*(V[5305]*(V[5665]*V[31]+V[5655]*V[34])+
 V[5655]*V[5295]*V[28])+V[5665]*V[5295]*V[31]*V[28]-V[5655]*V[5305]*S[0])+
 V[33]*(V[5635]*(V[5665]*V[5295]*V[28]+V[5655]*V[5305]*V[31])))+V[5285]*(
 V[5635]*(V[34]*(V[5295]*(V[5665]*V[34]+V[5655]*V[31])+V[5665]*V[5305]*
 V[28])+V[5655]*V[5305]*V[31]*V[28]-V[5665]*V[5295]*S[0])+V[33]*(V[5645]*(
 V[5665]*V[5295]*V[31]+V[5655]*V[5305]*V[28]))))+V[33]*(V[34]*(4*(V[5665]*
 V[5635]*V[5305]*V[5275]+V[5655]*V[5645]*V[5295]*V[5285])));
C[324]=+V[34]*(V[5275]*(V[5305]*(V[5645]*(2*V[5665]*V[31]+4*V[5655]*V[34])+
 4*V[5665]*V[5635]*V[33])+2*V[5655]*V[5645]*V[5295]*V[28])+V[5285]*(V[5295]*
 (V[5635]*(4*V[5665]*V[34]+2*V[5655]*V[31])+4*V[5655]*V[5645]*V[33])+2*
 V[5665]*V[5635]*V[5305]*V[28]))+V[33]*(2*(V[28]*(V[5665]*V[5635]*V[5295]*
 V[5275]+V[5655]*V[5645]*V[5305]*V[5285])+V[31]*(V[5665]*V[5645]*V[5295]*
 V[5285]+V[5655]*V[5635]*V[5305]*V[5275])))+S[0]*(4*(-V[5665]*V[5635]*
 V[5295]*V[5285]-V[5655]*V[5645]*V[5305]*V[5275]));
tmp[0]=+V[34]*(V[34]*(V[5275]*(V[5305]*(V[5525]*(V[5535]*(S[2]+S[3]-3*S[0])+
 V[5545]*V[34]*V[30])+V[33]*(V[5515]*(2*(V[5545]*V[34]+V[5535]*V[30]))))+
 V[28]*(V[5295]*(V[5525]*(V[5545]*V[30]+V[5535]*V[34])+2*V[5545]*V[5515]*
 V[33])))+V[5285]*(V[5295]*(V[5515]*(V[5545]*(S[2]+S[3]-3*S[0])+V[5535]*
 V[34]*V[30])+V[33]*(V[5525]*(2*(V[5545]*V[30]+V[5535]*V[34]))))+V[28]*(
 V[5305]*(V[5515]*(V[5545]*V[34]+V[5535]*V[30])+2*V[5535]*V[5525]*V[33]))))+
 V[33]*(V[28]*(V[30]*(2*(V[5545]*V[5525]*V[5305]*V[5285]+V[5535]*V[5515]*
 V[5295]*V[5275]))+V[33]*(V[5545]*V[5515]*V[5305]*V[5285]+V[5535]*V[5525]*
 V[5295]*V[5275]))+S[0]*(2*(-V[5545]*V[5515]*V[5305]*V[5275]-V[5535]*
 V[5525]*V[5295]*V[5285]))+V[30]*(V[33]*(V[5545]*V[5525]*V[5305]*V[5275]+
 V[5535]*V[5515]*V[5295]*V[5285])))+S[0]*(2*(V[28]*(-V[5545]*V[5515]*
 V[5305]*V[5285]-V[5535]*V[5525]*V[5295]*V[5275])+V[30]*(-V[5545]*V[5525]*
 V[5305]*V[5275]-V[5535]*V[5515]*V[5295]*V[5285]))));
C[323]=+S[0]*(2*(V[28]*(V[30]*(-V[5545]*V[5525]*V[5295]*V[5275]-V[5535]*
 V[5515]*V[5305]*V[5285])+V[33]*(-V[5545]*V[5515]*V[5295]*V[5275]-V[5535]*
 V[5525]*V[5305]*V[5285]))+S[0]*(V[5545]*V[5515]*V[5295]*V[5285]+V[5535]*
 V[5525]*V[5305]*V[5275])+V[30]*(V[33]*(-V[5545]*V[5525]*V[5295]*V[5285]-
 V[5535]*V[5515]*V[5305]*V[5275])))+S[3]*(-V[5545]*V[5515]*V[5295]*V[5285]-
 V[5535]*V[5525]*V[5305]*V[5275]))+S[3]*(V[28]*(V[30]*(V[5545]*V[5525]*
 V[5295]*V[5275]+V[5535]*V[5515]*V[5305]*V[5285])))+tmp[0];
C[322]=+2*(V[5275]*(V[5525]*(V[34]*(V[5305]*(V[5545]*V[30]+V[5535]*V[34])+
 V[5535]*V[5295]*V[28])+V[5545]*V[5295]*V[30]*V[28]-V[5535]*V[5305]*S[0])+
 V[33]*(V[5515]*(V[5545]*V[5295]*V[28]+V[5535]*V[5305]*V[30])))+V[5285]*(
 V[5515]*(V[34]*(V[5295]*(V[5545]*V[34]+V[5535]*V[30])+V[5545]*V[5305]*
 V[28])+V[5535]*V[5305]*V[30]*V[28]-V[5545]*V[5295]*S[0])+V[33]*(V[5525]*(
 V[5545]*V[5295]*V[30]+V[5535]*V[5305]*V[28]))))+V[33]*(V[34]*(4*(V[5545]*
 V[5515]*V[5305]*V[5275]+V[5535]*V[5525]*V[5295]*V[5285])));
C[321]=+V[34]*(V[5275]*(V[5305]*(V[5525]*(2*V[5545]*V[30]+4*V[5535]*V[34])+
 4*V[5545]*V[5515]*V[33])+2*V[5535]*V[5525]*V[5295]*V[28])+V[5285]*(V[5295]*
 (V[5515]*(4*V[5545]*V[34]+2*V[5535]*V[30])+4*V[5535]*V[5525]*V[33])+2*
 V[5545]*V[5515]*V[5305]*V[28]))+V[33]*(2*(V[28]*(V[5545]*V[5515]*V[5295]*
 V[5275]+V[5535]*V[5525]*V[5305]*V[5285])+V[30]*(V[5545]*V[5525]*V[5295]*
 V[5285]+V[5535]*V[5515]*V[5305]*V[5275])))+S[0]*(4*(-V[5545]*V[5515]*
 V[5295]*V[5285]-V[5535]*V[5525]*V[5305]*V[5275]));
tmp[0]=+V[34]*(V[34]*(V[5275]*(V[5305]*(V[5405]*(V[5415]*(S[2]+S[3]-3*S[0])+
 V[5425]*V[34]*V[29])+V[33]*(V[5395]*(2*(V[5425]*V[34]+V[5415]*V[29]))))+
 V[28]*(V[5295]*(V[5405]*(V[5425]*V[29]+V[5415]*V[34])+2*V[5425]*V[5395]*
 V[33])))+V[5285]*(V[5295]*(V[5395]*(V[5425]*(S[2]+S[3]-3*S[0])+V[5415]*
 V[34]*V[29])+V[33]*(V[5405]*(2*(V[5425]*V[29]+V[5415]*V[34]))))+V[28]*(
 V[5305]*(V[5395]*(V[5425]*V[34]+V[5415]*V[29])+2*V[5415]*V[5405]*V[33]))))+
 V[33]*(V[28]*(V[29]*(2*(V[5425]*V[5405]*V[5305]*V[5285]+V[5415]*V[5395]*
 V[5295]*V[5275]))+V[33]*(V[5425]*V[5395]*V[5305]*V[5285]+V[5415]*V[5405]*
 V[5295]*V[5275]))+S[0]*(2*(-V[5425]*V[5395]*V[5305]*V[5275]-V[5415]*
 V[5405]*V[5295]*V[5285]))+V[29]*(V[33]*(V[5425]*V[5405]*V[5305]*V[5275]+
 V[5415]*V[5395]*V[5295]*V[5285])))+S[0]*(2*(V[28]*(-V[5425]*V[5395]*
 V[5305]*V[5285]-V[5415]*V[5405]*V[5295]*V[5275])+V[29]*(-V[5425]*V[5405]*
 V[5305]*V[5275]-V[5415]*V[5395]*V[5295]*V[5285]))));
C[320]=+S[0]*(2*(V[28]*(V[29]*(-V[5425]*V[5405]*V[5295]*V[5275]-V[5415]*
 V[5395]*V[5305]*V[5285])+V[33]*(-V[5425]*V[5395]*V[5295]*V[5275]-V[5415]*
 V[5405]*V[5305]*V[5285]))+S[0]*(V[5425]*V[5395]*V[5295]*V[5285]+V[5415]*
 V[5405]*V[5305]*V[5275])+V[29]*(V[33]*(-V[5425]*V[5405]*V[5295]*V[5285]-
 V[5415]*V[5395]*V[5305]*V[5275])))+S[3]*(-V[5425]*V[5395]*V[5295]*V[5285]-
 V[5415]*V[5405]*V[5305]*V[5275]))+S[3]*(V[28]*(V[29]*(V[5425]*V[5405]*
 V[5295]*V[5275]+V[5415]*V[5395]*V[5305]*V[5285])))+tmp[0];
C[319]=+2*(V[5275]*(V[5405]*(V[34]*(V[5305]*(V[5425]*V[29]+V[5415]*V[34])+
 V[5415]*V[5295]*V[28])+V[5425]*V[5295]*V[29]*V[28]-V[5415]*V[5305]*S[0])+
 V[33]*(V[5395]*(V[5425]*V[5295]*V[28]+V[5415]*V[5305]*V[29])))+V[5285]*(
 V[5395]*(V[34]*(V[5295]*(V[5425]*V[34]+V[5415]*V[29])+V[5425]*V[5305]*
 V[28])+V[5415]*V[5305]*V[29]*V[28]-V[5425]*V[5295]*S[0])+V[33]*(V[5405]*(
 V[5425]*V[5295]*V[29]+V[5415]*V[5305]*V[28]))))+V[33]*(V[34]*(4*(V[5425]*
 V[5395]*V[5305]*V[5275]+V[5415]*V[5405]*V[5295]*V[5285])));
C[318]=+V[34]*(V[5275]*(V[5305]*(V[5405]*(2*V[5425]*V[29]+4*V[5415]*V[34])+
 4*V[5425]*V[5395]*V[33])+2*V[5415]*V[5405]*V[5295]*V[28])+V[5285]*(V[5295]*
 (V[5395]*(4*V[5425]*V[34]+2*V[5415]*V[29])+4*V[5415]*V[5405]*V[33])+2*
 V[5425]*V[5395]*V[5305]*V[28]))+V[33]*(2*(V[28]*(V[5425]*V[5395]*V[5295]*
 V[5275]+V[5415]*V[5405]*V[5305]*V[5285])+V[29]*(V[5425]*V[5405]*V[5295]*
 V[5285]+V[5415]*V[5395]*V[5305]*V[5275])))+S[0]*(4*(-V[5425]*V[5395]*
 V[5295]*V[5285]-V[5415]*V[5405]*V[5305]*V[5275]));
S[19]=V[28]*V[28];
S[20]=V[5295]*V[5295];
S[21]=V[5305]*V[5305];
S[22]=V[5285]*V[5285];
C[317]=+V[5275]*(V[5305]*(V[5285]*(V[5295]*(S[0]*(2*(S[0]-S[19])-3*S[2]-
 S[3])+S[2]*(S[2]+S[3]+S[19])+S[3]*S[19])+V[28]*(V[34]*(V[5305]*(S[2]+S[3]-
 2*S[0]))))+V[33]*(V[5275]*(V[34]*(V[34]*(V[5305]*V[34]+2*V[5295]*V[28])-
 V[5305]*S[0])-2*V[5295]*V[28]*S[0])))+S[20]*(V[28]*(V[34]*(V[5285]*(S[2]+
 S[3]-2*S[0])+V[5275]*V[33]*V[28]))))+S[22]*(V[33]*(V[34]*(V[5295]*(V[34]*(
 2*V[5305]*V[28]+V[5295]*V[34])-V[5295]*S[0])+S[21]*S[19])-2*V[5305]*
 V[5295]*V[28]*S[0]));
C[316]=+2*(V[5275]*(V[5305]*(V[5285]*(V[5295]*(S[2]+S[19]-S[0])+V[5305]*
 V[34]*V[28])+V[33]*(V[5275]*(V[5305]*V[34]+V[5295]*V[28])))+S[20]*V[5285]*
 V[34]*V[28])+S[22]*(V[33]*(V[5295]*(V[5305]*V[28]+V[5295]*V[34]))));
C[315]=+V[5275]*(V[5305]*(V[34]*(V[5285]*(2*V[5305]*V[28]+4*V[5295]*V[34])+
 2*V[5305]*V[5275]*V[33])+V[5295]*(2*V[5275]*V[33]*V[28]-4*V[5285]*S[0]))+2*
 S[20]*V[5285]*V[34]*V[28])+S[22]*(V[33]*(V[5295]*(2*(V[5305]*V[28]+V[5295]*
 V[34]))));
C[314]=+V[5755]*(V[5785]*(V[33]*(V[33]*(V[5765]*(V[5775]*(2*(S[1]-S[0])+4*
 S[2])+3*V[5785]*V[34]*V[32])+V[33]*(V[5755]*(V[5785]*V[34]+V[5775]*
 V[32])))+V[5755]*(V[34]*(V[34]*(V[5785]*V[34]+3*V[5775]*V[32])-2*V[5785]*
 S[0])-2*V[5775]*V[32]*S[0]))+V[5765]*(S[0]*(V[5775]*(4*(-S[1]-S[0])+2*
 S[2])-2*V[5785]*V[34]*V[32])+S[2]*(V[32]*(V[5785]*V[34]+2*V[5775]*
 V[32]))))+S[4]*(V[32]*(V[34]*(V[5765]*(S[2]+3*S[3]-2*S[0])+2*V[5755]*V[33]*
 V[32]))))+S[6]*(V[33]*(V[5775]*(V[34]*(V[5775]*(S[2]+S[3]-2*S[0])+3*
 V[5785]*V[34]*V[32])+V[32]*(V[5785]*(S[3]-2*S[0])))+2*S[5]*V[34]*S[1]));
C[313]=+V[5755]*(V[5765]*(V[5775]*(V[5785]*(4*(S[3]+S[1]+S[0]))+2*V[5775]*
 V[34]*V[32])+2*S[5]*V[34]*V[32])+2*V[5785]*V[5775]*V[5755]*V[33]*V[32])+2*
 V[5785]*V[5775]*S[6]*V[33]*V[32];
C[312]=+V[5755]*(V[5765]*(V[5775]*(V[5785]*(4*(S[2]-S[3])-8*S[0]))));
C[311]=+8*V[5785]*V[5775]*V[5765]*V[5755];
tmp[0]=+V[33]*(V[34]*(2*(V[5635]*(V[5775]*(V[31]*(V[5655]*(V[5765]*V[33]+
 V[5755]*V[32]))+V[34]*(V[5665]*(V[5765]*V[33]+V[5755]*V[32])))-V[5785]*
 V[5755]*V[5665]*S[0])+V[5645]*(V[5785]*(V[31]*(V[5665]*(V[5765]*V[32]+
 V[5755]*V[33]))+V[34]*(V[5655]*(V[5765]*V[32]+V[5755]*V[33])))-V[5775]*
 V[5765]*V[5655]*S[0]))+V[33]*(V[32]*(V[5785]*V[5765]*V[5665]*V[5635]+
 V[5775]*V[5755]*V[5655]*V[5645])+V[33]*(V[5785]*V[5755]*V[5665]*V[5635]+
 V[5775]*V[5765]*V[5655]*V[5645]))+V[34]*(V[31]*(V[5785]*V[5755]*V[5655]*
 V[5635]+V[5775]*V[5765]*V[5665]*V[5645])+V[34]*(V[5785]*V[5755]*V[5665]*
 V[5635]+V[5775]*V[5765]*V[5655]*V[5645])))+V[33]*(V[31]*(V[32]*(V[5785]*
 V[5765]*V[5655]*V[5635]+V[5775]*V[5755]*V[5665]*V[5645])+V[33]*(V[5785]*
 V[5755]*V[5655]*V[5635]+V[5775]*V[5765]*V[5665]*V[5645]))+S[0]*(-V[5785]*
 V[5755]*V[5655]*V[5645]-V[5775]*V[5765]*V[5665]*V[5635]))+S[0]*(V[32]*(2*(-
 V[5785]*V[5765]*V[5655]*V[5645]-V[5775]*V[5755]*V[5665]*V[5635]))));
C[310]=+S[0]*(2*(V[32]*(V[31]*(-V[5785]*V[5765]*V[5655]*V[5635]-V[5775]*
 V[5755]*V[5665]*V[5645])+V[34]*(-V[5785]*V[5765]*V[5665]*V[5635]-V[5775]*
 V[5755]*V[5655]*V[5645]))+S[0]*