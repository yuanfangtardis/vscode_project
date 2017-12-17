#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../CalcHEP_src/include/extern.h"
#include "../../CalcHEP_src/include/VandP.h"
#include "autoprot.h"
extern int  FError;
/*  Special model functions  */

int nModelParticles=63;
static ModelPrtclsStr ModelPrtcls_[63]=
{
  {"~sd1","~Sd1", 1000001, "Msd1","Wsd1",0,3,-1}
, {"~sd2","~Sd2", 1000003, "Msd2","Wsd2",0,3,-1}
, {"~sd3","~Sd3", 1000005, "Msd3","Wsd3",0,3,-1}
, {"~sd4","~Sd4", 2000001, "Msd4","Wsd4",0,3,-1}
, {"~sd5","~Sd5", 2000003, "Msd5","Wsd5",0,3,-1}
, {"~sd6","~Sd6", 2000005, "Msd6","Wsd6",0,3,-1}
, {"~nI1","~nI1", 4000012, "MnI1","WnI1",0,1,0}
, {"~nI2","~nI2", 4000014, "MnI2","WnI2",0,1,0}
, {"~nI3","~nI3", 4000016, "MnI3","WnI3",0,1,0}
, {"~nI4","~nI4", 5000012, "MnI4","WnI4",0,1,0}
, {"~nI5","~nI5", 5000014, "MnI5","WnI5",0,1,0}
, {"~nI6","~nI6", 5000016, "MnI6","WnI6",0,1,0}
, {"~nR1","~nR1", 1000012, "MnR1","WnR1",0,1,0}
, {"~nR2","~nR2", 1000014, "MnR2","WnR2",0,1,0}
, {"~nR3","~nR3", 1000016, "MnR3","WnR3",0,1,0}
, {"~nR4","~nR4", 2000012, "MnR4","WnR4",0,1,0}
, {"~nR5","~nR5", 2000014, "MnR5","WnR5",0,1,0}
, {"~nR6","~nR6", 2000016, "MnR6","WnR6",0,1,0}
, {"~su1","~Su1", 1000002, "Msu1","Wsu1",0,3,2}
, {"~su2","~Su2", 1000004, "Msu2","Wsu2",0,3,2}
, {"~su3","~Su3", 1000006, "Msu3","Wsu3",0,3,2}
, {"~su4","~Su4", 2000002, "Msu4","Wsu4",0,3,2}
, {"~su5","~Su5", 2000004, "Msu5","Wsu5",0,3,2}
, {"~su6","~Su6", 2000006, "Msu6","Wsu6",0,3,2}
, {"~se1","~Se1", 1000011, "Mse1","Wse1",0,1,-3}
, {"~se2","~Se2", 1000013, "Mse2","Wse2",0,1,-3}
, {"~se3","~Se3", 1000015, "Mse3","Wse3",0,1,-3}
, {"~se4","~Se4", 2000011, "Mse4","Wse4",0,1,-3}
, {"~se5","~Se5", 2000013, "Mse5","Wse5",0,1,-3}
, {"~se6","~Se6", 2000015, "Mse6","Wse6",0,1,-3}
, {"h1","h1", 25, "Mh1","Wh1",0,1,0}
, {"h2","h2", 35, "Mh2","Wh2",0,1,0}
, {"h3","h3", 45, "Mh3","Wh3",0,1,0}
, {"Ah2","Ah2", 36, "MAh2","WAh2",0,1,0}
, {"Ah3","Ah3", 46, "MAh3","WAh3",0,1,0}
, {"Hm2","Hp2", -37, "MHm2","WHm2",0,1,-3}
, {"g","g", 21, "0","0",2,8,0}
, {"A","A", 22, "0","0",2,1,0}
, {"Z","Z", 23, "MZ","WZ",2,1,0}
, {"Wm","Wp", -24, "MWm","WWm",2,1,-3}
, {"~go","~go", 1000021, "Mgo","Wgo",1,8,0}
, {"~N1","~N1", 1000022, "MN1","WN1",1,1,0}
, {"~N2","~N2", 1000023, "MN2","WN2",1,1,0}
, {"~N3","~N3", 1000025, "MN3","WN3",1,1,0}
, {"~N4","~N4", 1000035, "MN4","WN4",1,1,0}
, {"~N5","~N5", 1000045, "MN5","WN5",1,1,0}
, {"nu1","nu1", 12, "Mnu1","Wnu1",1,1,0}
, {"nu2","nu2", 14, "Mnu2","Wnu2",1,1,0}
, {"nu3","nu3", 16, "Mnu3","Wnu3",1,1,0}
, {"nu4","nu4", 112, "Mnu4","Wnu4",1,1,0}
, {"nu5","nu5", 114, "Mnu5","Wnu5",1,1,0}
, {"nu6","nu6", 116, "Mnu6","Wnu6",1,1,0}
, {"~C1","~c1", -1000024, "MC1","WC1",1,1,-3}
, {"~C2","~c2", -1000037, "MC2","WC2",1,1,-3}
, {"e1","E1", 11, "Me1","We1",1,1,-3}
, {"e2","E2", 13, "Me2","We2",1,1,-3}
, {"e3","E3", 15, "Me3","We3",1,1,-3}
, {"d1","D1", 1, "Md1","Wd1",1,3,-1}
, {"d2","D2", 3, "Md2","Wd2",1,3,-1}
, {"d3","D3", 5, "Md3","Wd3",1,3,-1}
, {"u1","U1", 2, "Mu1","Wu1",1,3,2}
, {"u2","U2", 4, "Mu2","Wu2",1,3,2}
, {"u3","U3", 6, "Mu3","Wu3",1,3,2}
};
ModelPrtclsStr *ModelPrtcls=ModelPrtcls_; 
int nModelVars=22;
int nModelFunc=500;
static char*varNames_[522]={
 "WZ","WWm","Wnu1","Wnu2","Wnu3","We1","We2","We3","Wd1","Wd2"
,"Wd3","Wu1","Wu2","Wu3","Maux","sqrt2","Pi","Q","alfSMZ","aS"
,"aEWinv","Gf","rd","Msd1","Msd2","Msd3","Msd4","Msd5","Msd6","MnI1"
,"MnI2","MnI3","MnI4","MnI5","MnI6","MnR1","MnR2","MnR3","MnR4","MnR5"
,"MnR6","Msu1","Msu2","Msu3","Msu4","Msu5","Msu6","Mse1","Mse2","Mse3"
,"Mse4","Mse5","Mse6","Mh1","Mh2","Mh3","MAh2","MAh3","MHm2","MZ"
,"Mgo","MN1","MN2","MN3","MN4","MN5","Mnu1","Mnu2","Mnu3","Mnu4"
,"Mnu5","Mnu6","MC1","MC2","Me1","Me2","Me3","Md1","Md2","Md3"
,"Mu1","Mu2","Mu3","Yd11","Yd12","Yd13","Yd21","Yd22","Yd23","Yd31"
,"Yd32","Yd33","Td11","Td12","Td13","Td21","Td22","Td23","Td31","Td32"
,"Td33","Ye11","Ye12","Ye13","Ye21","Ye22","Ye23","Ye31","Ye32","Ye33"
,"Te11","Te12","Te13","Te21","Te22","Te23","Te31","Te32","Te33","lam"
,"Tlam","kap","Tk","lamN11","lamN12","lamN13","lamN21","lamN22","lamN23","lamN31"
,"lamN32","lamN33","TLN11","TLN12","TLN13","TLN21","TLN22","TLN23","TLN31","TLN32"
,"TLN33","Yu11","Yu12","Yu13","Yu21","Yu22","Yu23","Yu31","Yu32","Yu33"
,"Tu11","Tu12","Tu13","Tu21","Tu22","Tu23","Tu31","Tu32","Tu33","Yv11"
,"Yv12","Yv13","Yv21","Yv22","Yv23","Yv31","Yv32","Yv33","Tv11","Tv12"
,"Tv13","Tv21","Tv22","Tv23","Tv31","Tv32","Tv33","vS","pG","ZD11"
,"ZD12","ZD13","ZD14","ZD15","ZD16","ZD21","ZD22","ZD23","ZD24","ZD25"
,"ZD26","ZD31","ZD32","ZD33","ZD34","ZD35","ZD36","ZD41","ZD42","ZD43"
,"ZD44","ZD45","ZD46","ZD51","ZD52","ZD53","ZD54","ZD55","ZD56","ZD61"
,"ZD62","ZD63","ZD64","ZD65","ZD66","ZVI11","ZVI12","ZVI13","ZVI14","ZVI15"
,"ZVI16","ZVI21","ZVI22","ZVI23","ZVI24","ZVI25","ZVI26","ZVI31","ZVI32","ZVI33"
,"ZVI34","ZVI35","ZVI36","ZVI41","ZVI42","ZVI43","ZVI44","ZVI45","ZVI46","ZVI51"
,"ZVI52","ZVI53","ZVI54","ZVI55","ZVI56","ZVI61","ZVI62","ZVI63","ZVI64","ZVI65"
,"ZVI66","ZVR11","ZVR12","ZVR13","ZVR14","ZVR15","ZVR16","ZVR21","ZVR22","ZVR23"
,"ZVR24","ZVR25","ZVR26","ZVR31","ZVR32","ZVR33","ZVR34","ZVR35","ZVR36","ZVR41"
,"ZVR42","ZVR43","ZVR44","ZVR45","ZVR46","ZVR51","ZVR52","ZVR53","ZVR54","ZVR55"
,"ZVR56","ZVR61","ZVR62","ZVR63","ZVR64","ZVR65","ZVR66","ZU11","ZU12","ZU13"
,"ZU14","ZU15","ZU16","ZU21","ZU22","ZU23","ZU24","ZU25","ZU26","ZU31"
,"ZU32","ZU33","ZU34","ZU35","ZU36","ZU41","ZU42","ZU43","ZU44","ZU45"
,"ZU46","ZU51","ZU52","ZU53","ZU54","ZU55","ZU56","ZU61","ZU62","ZU63"
,"ZU64","ZU65","ZU66","ZE11","ZE12","ZE13","ZE14","ZE15","ZE16","ZE21"
,"ZE22","ZE23","ZE24","ZE25","ZE26","ZE31","ZE32","ZE33","ZE34","ZE35"
,"ZE36","ZE41","ZE42","ZE43","ZE44","ZE45","ZE46","ZE51","ZE52","ZE53"
,"ZE54","ZE55","ZE56","ZE61","ZE62","ZE63","ZE64","ZE65","ZE66","ZH11"
,"ZH12","ZH13","ZH21","ZH22","ZH23","ZH31","ZH32","ZH33","ZA11","ZA12"
,"ZA13","ZA21","ZA22","ZA23","ZA31","ZA32","ZA33","ZP11","ZP12","ZP21"
,"ZP22","ZN11","ZN12","ZN13","ZN14","ZN15","ZN21","ZN22","ZN23","ZN24"
,"ZN25","ZN31","ZN32","ZN33","ZN34","ZN35","ZN41","ZN42","ZN43","ZN44"
,"ZN45","ZN51","ZN52","ZN53","ZN54","ZN55","UV11","UV12","UV13","UV14"
,"UV15","UV16","UV21","UV22","UV23","UV24","UV25","UV26","UV31","UV32"
,"UV33","UV34","UV35","UV36","UV41","UV42","UV43","UV44","UV45","UV46"
,"UV51","UV52","UV53","UV54","UV55","UV56","UV61","UV62","UV63","UV64"
,"UV65","UV66","UM11","UM12","UM21","UM22","UP11","UP12","UP21","UP22"
,"ZEL11","ZEL12","ZEL13","ZEL21","ZEL22","ZEL23","ZEL31","ZEL32","ZEL33","ZER11"
,"ZER12","ZER13","ZER21","ZER22","ZER23","ZER31","ZER32","ZER33","ZDL11","ZDL12"
,"ZDL13","ZDL21","ZDL22","ZDL23","ZDL31","ZDL32","ZDL33","ZDR11","ZDR12","ZDR13"
,"ZDR21","ZDR22","ZDR23","ZDR31","ZDR32","ZDR33","ZUL11","ZUL12","ZUL13","ZUL21"
,"ZUL22","ZUL23","ZUL31","ZUL32","ZUL33","ZUR11","ZUR12","ZUR13","ZUR21","ZUR22"
,"ZUR23","ZUR31","ZUR32","ZUR33","betaH","HPP1","HGG1","HPP2","HGG2","HPP3"
,"HGG3","APP2","AGG2","APP3","AGG3","QCDok","g3","Sb","Cb","Tb"
,"el","MWm"};
char**varNames=varNames_;
static REAL varValues_[522]={
   2.495200E+00,  2.141000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00,  0.000000E+00
,  0.000000E+00,  0.000000E+00,  0.000000E+00,  1.510000E+00,  1.000000E+00,  1.414214E+00,  3.141593E+00,  1.000000E+02,  1.172000E-01,  1.190000E-01
,  1.370360E+02,  1.166390E-05};
REAL*varValues=varValues_;
int calcMainFunc(void)
{
   int i;
   static REAL * VV=NULL;
   static int iQ=-1;
   static int cErr=1;
   REAL *V=varValues;
   FError=0;
   if(VV && cErr==0)
   { for(i=0;i<nModelVars;i++) if(i!=iQ && VV[i]!=V[i]) break;
     if(i==nModelVars)      {if(iQ>=0 && VV[iQ]!=V[iQ]) goto FirstQ; else return 0;} 
   }
  cErr=1;
   V[22]=slhaRead("SPheno.spc.seesaw1nmssm",0);
   if(!isfinite(V[22]) || FError) return 22;
 FirstQ:
 cErr=1;
   V[23]=slhaVal("MASS",V[17],1,1000001);
   if(!isfinite(V[23]) || FError) return 23;
   V[24]=slhaVal("MASS",V[17],1,1000003);
   if(!isfinite(V[24]) || FError) return 24;
   V[25]=slhaVal("MASS",V[17],1,1000005);
   if(!isfinite(V[25]) || FError) return 25;
   V[26]=slhaVal("MASS",V[17],1,2000001);
   if(!isfinite(V[26]) || FError) return 26;
   V[27]=slhaVal("MASS",V[17],1,2000003);
   if(!isfinite(V[27]) || FError) return 27;
   V[28]=slhaVal("MASS",V[17],1,2000005);
   if(!isfinite(V[28]) || FError) return 28;
   V[29]=slhaVal("MASS",V[17],1,4000012);
   if(!isfinite(V[29]) || FError) return 29;
   V[30]=slhaVal("MASS",V[17],1,4000014);
   if(!isfinite(V[30]) || FError) return 30;
   V[31]=slhaVal("MASS",V[17],1,4000016);
   if(!isfinite(V[31]) || FError) return 31;
   V[32]=slhaVal("MASS",V[17],1,5000012);
   if(!isfinite(V[32]) || FError) return 32;
   V[33]=slhaVal("MASS",V[17],1,5000014);
   if(!isfinite(V[33]) || FError) return 33;
   V[34]=slhaVal("MASS",V[17],1,5000016);
   if(!isfinite(V[34]) || FError) return 34;
   V[35]=slhaVal("MASS",V[17],1,1000012);
   if(!isfinite(V[35]) || FError) return 35;
   V[36]=slhaVal("MASS",V[17],1,1000014);
   if(!isfinite(V[36]) || FError) return 36;
   V[37]=slhaVal("MASS",V[17],1,1000016);
   if(!isfinite(V[37]) || FError) return 37;
   V[38]=slhaVal("MASS",V[17],1,2000012);
   if(!isfinite(V[38]) || FError) return 38;
   V[39]=slhaVal("MASS",V[17],1,2000014);
   if(!isfinite(V[39]) || FError) return 39;
   V[40]=slhaVal("MASS",V[17],1,2000016);
   if(!isfinite(V[40]) || FError) return 40;
   V[41]=slhaVal("MASS",V[17],1,1000002);
   if(!isfinite(V[41]) || FError) return 41;
   V[42]=slhaVal("MASS",V[17],1,1000004);
   if(!isfinite(V[42]) || FError) return 42;
   V[43]=slhaVal("MASS",V[17],1,1000006);
   if(!isfinite(V[43]) || FError) return 43;
   V[44]=slhaVal("MASS",V[17],1,2000002);
   if(!isfinite(V[44]) || FError) return 44;
   V[45]=slhaVal("MASS",V[17],1,2000004);
   if(!isfinite(V[45]) || FError) return 45;
   V[46]=slhaVal("MASS",V[17],1,2000006);
   if(!isfinite(V[46]) || FError) return 46;
   V[47]=slhaVal("MASS",V[17],1,1000011);
   if(!isfinite(V[47]) || FError) return 47;
   V[48]=slhaVal("MASS",V[17],1,1000013);
   if(!isfinite(V[48]) || FError) return 48;
   V[49]=slhaVal("MASS",V[17],1,1000015);
   if(!isfinite(V[49]) || FError) return 49;
   V[50]=slhaVal("MASS",V[17],1,2000011);
   if(!isfinite(V[50]) || FError) return 50;
   V[51]=slhaVal("MASS",V[17],1,2000013);
   if(!isfinite(V[51]) || FError) return 51;
   V[52]=slhaVal("MASS",V[17],1,2000015);
   if(!isfinite(V[52]) || FError) return 52;
   V[53]=slhaVal("MASS",V[17],1,25);
   if(!isfinite(V[53]) || FError) return 53;
   V[54]=slhaVal("MASS",V[17],1,35);
   if(!isfinite(V[54]) || FError) return 54;
   V[55]=slhaVal("MASS",V[17],1,45);
   if(!isfinite(V[55]) || FError) return 55;
   V[56]=slhaVal("MASS",V[17],1,36);
   if(!isfinite(V[56]) || FError) return 56;
   V[57]=slhaVal("MASS",V[17],1,46);
   if(!isfinite(V[57]) || FError) return 57;
   V[58]=slhaVal("MASS",V[17],1,37);
   if(!isfinite(V[58]) || FError) return 58;
   V[59]=slhaVal("MASS",V[17],1,23);
   if(!isfinite(V[59]) || FError) return 59;
   V[60]=slhaVal("MASS",V[17],1,1000021);
   if(!isfinite(V[60]) || FError) return 60;
   V[61]=slhaVal("MASS",V[17],1,1000022);
   if(!isfinite(V[61]) || FError) return 61;
   V[62]=slhaVal("MASS",V[17],1,1000023);
   if(!isfinite(V[62]) || FError) return 62;
   V[63]=slhaVal("MASS",V[17],1,1000025);
   if(!isfinite(V[63]) || FError) return 63;
   V[64]=slhaVal("MASS",V[17],1,1000035);
   if(!isfinite(V[64]) || FError) return 64;
   V[65]=slhaVal("MASS",V[17],1,1000045);
   if(!isfinite(V[65]) || FError) return 65;
   V[66]=slhaVal("MASS",V[17],1,12);
   if(!isfinite(V[66]) || FError) return 66;
   V[67]=slhaVal("MASS",V[17],1,14);
   if(!isfinite(V[67]) || FError) return 67;
   V[68]=slhaVal("MASS",V[17],1,16);
   if(!isfinite(V[68]) || FError) return 68;
   V[69]=slhaVal("MASS",V[17],1,112);
   if(!isfinite(V[69]) || FError) return 69;
   V[70]=slhaVal("MASS",V[17],1,114);
   if(!isfinite(V[70]) || FError) return 70;
   V[71]=slhaVal("MASS",V[17],1,116);
   if(!isfinite(V[71]) || FError) return 71;
   V[72]=slhaVal("MASS",V[17],1,1000024);
   if(!isfinite(V[72]) || FError) return 72;
   V[73]=slhaVal("MASS",V[17],1,1000037);
   if(!isfinite(V[73]) || FError) return 73;
   V[74]=slhaVal("MASS",V[17],1,11);
   if(!isfinite(V[74]) || FError) return 74;
   V[75]=slhaVal("MASS",V[17],1,13);
   if(!isfinite(V[75]) || FError) return 75;
   V[76]=slhaVal("MASS",V[17],1,15);
   if(!isfinite(V[76]) || FError) return 76;
   V[77]=slhaVal("MASS",V[17],1,1);
   if(!isfinite(V[77]) || FError) return 77;
   V[78]=slhaVal("MASS",V[17],1,3);
   if(!isfinite(V[78]) || FError) return 78;
   V[79]=slhaVal("MASS",V[17],1,5);
   if(!isfinite(V[79]) || FError) return 79;
   V[80]=slhaVal("MASS",V[17],1,2);
   if(!isfinite(V[80]) || FError) return 80;
   V[81]=slhaVal("MASS",V[17],1,4);
   if(!isfinite(V[81]) || FError) return 81;
   V[82]=slhaVal("MASS",V[17],1,6);
   if(!isfinite(V[82]) || FError) return 82;
   V[83]=slhaVal("YD",V[17],2,1,1);
   if(!isfinite(V[83]) || FError) return 83;
   V[84]=slhaVal("YD",V[17],2,1,2);
   if(!isfinite(V[84]) || FError) return 84;
   V[85]=slhaVal("YD",V[17],2,1,3);
   if(!isfinite(V[85]) || FError) return 85;
   V[86]=slhaVal("YD",V[17],2,2,1);
   if(!isfinite(V[86]) || FError) return 86;
   V[87]=slhaVal("YD",V[17],2,2,2);
   if(!isfinite(V[87]) || FError) return 87;
   V[88]=slhaVal("YD",V[17],2,2,3);
   if(!isfinite(V[88]) || FError) return 88;
   V[89]=slhaVal("YD",V[17],2,3,1);
   if(!isfinite(V[89]) || FError) return 89;
   V[90]=slhaVal("YD",V[17],2,3,2);
   if(!isfinite(V[90]) || FError) return 90;
   V[91]=slhaVal("YD",V[17],2,3,3);
   if(!isfinite(V[91]) || FError) return 91;
   V[92]=slhaVal("TD",V[17],2,1,1);
   if(!isfinite(V[92]) || FError) return 92;
   V[93]=slhaVal("TD",V[17],2,1,2);
   if(!isfinite(V[93]) || FError) return 93;
   V[94]=slhaVal("TD",V[17],2,1,3);
   if(!isfinite(V[94]) || FError) return 94;
   V[95]=slhaVal("TD",V[17],2,2,1);
   if(!isfinite(V[95]) || FError) return 95;
   V[96]=slhaVal("TD",V[17],2,2,2);
   if(!isfinite(V[96]) || FError) return 96;
   V[97]=slhaVal("TD",V[17],2,2,3);
   if(!isfinite(V[97]) || FError) return 97;
   V[98]=slhaVal("TD",V[17],2,3,1);
   if(!isfinite(V[98]) || FError) return 98;
   V[99]=slhaVal("TD",V[17],2,3,2);
   if(!isfinite(V[99]) || FError) return 99;
   V[100]=slhaVal("TD",V[17],2,3,3);
   if(!isfinite(V[100]) || FError) return 100;
   V[101]=slhaVal("YE",V[17],2,1,1);
   if(!isfinite(V[101]) || FError) return 101;
   V[102]=slhaVal("YE",V[17],2,1,2);
   if(!isfinite(V[102]) || FError) return 102;
   V[103]=slhaVal("YE",V[17],2,1,3);
   if(!isfinite(V[103]) || FError) return 103;
   V[104]=slhaVal("YE",V[17],2,2,1);
   if(!isfinite(V[104]) || FError) return 104;
   V[105]=slhaVal("YE",V[17],2,2,2);
   if(!isfinite(V[105]) || FError) return 105;
   V[106]=slhaVal("YE",V[17],2,2,3);
   if(!isfinite(V[106]) || FError) return 106;
   V[107]=slhaVal("YE",V[17],2,3,1);
   if(!isfinite(V[107]) || FError) return 107;
   V[108]=slhaVal("YE",V[17],2,3,2);
   if(!isfinite(V[108]) || FError) return 108;
   V[109]=slhaVal("YE",V[17],2,3,3);
   if(!isfinite(V[109]) || FError) return 109;
   V[110]=slhaVal("TE",V[17],2,1,1);
   if(!isfinite(V[110]) || FError) return 110;
   V[111]=slhaVal("TE",V[17],2,1,2);
   if(!isfinite(V[111]) || FError) return 111;
   V[112]=slhaVal("TE",V[17],2,1,3);
   if(!isfinite(V[112]) || FError) return 112;
   V[113]=slhaVal("TE",V[17],2,2,1);
   if(!isfinite(V[113]) || FError) return 113;
   V[114]=slhaVal("TE",V[17],2,2,2);
   if(!isfinite(V[114]) || FError) return 114;
   V[115]=slhaVal("TE",V[17],2,2,3);
   if(!isfinite(V[115]) || FError) return 115;
   V[116]=slhaVal("TE",V[17],2,3,1);
   if(!isfinite(V[116]) || FError) return 116;
   V[117]=slhaVal("TE",V[17],2,3,2);
   if(!isfinite(V[117]) || FError) return 117;
   V[118]=slhaVal("TE",V[17],2,3,3);
   if(!isfinite(V[118]) || FError) return 118;
   V[119]=slhaVal("NMSSMRUN",V[17],1,1);
   if(!isfinite(V[119]) || FError) return 119;
   V[120]=slhaVal("NMSSMRUN",V[17],1,3);
   if(!isfinite(V[120]) || FError) return 120;
   V[121]=slhaVal("NMSSMRUN",V[17],1,2);
   if(!isfinite(V[121]) || FError) return 121;
   V[122]=slhaVal("NMSSMRUN",V[17],1,4);
   if(!isfinite(V[122]) || FError) return 122;
   V[123]=slhaVal("LAMN",V[17],2,1,1);
   if(!isfinite(V[123]) || FError) return 123;
   V[124]=slhaVal("LAMN",V[17],2,1,2);
   if(!isfinite(V[124]) || FError) return 124;
   V[125]=slhaVal("LAMN",V[17],2,1,3);
   if(!isfinite(V[125]) || FError) return 125;
   V[126]=slhaVal("LAMN",V[17],2,2,1);
   if(!isfinite(V[126]) || FError) return 126;
   V[127]=slhaVal("LAMN",V[17],2,2,2);
   if(!isfinite(V[127]) || FError) return 127;
   V[128]=slhaVal("LAMN",V[17],2,2,3);
   if(!isfinite(V[128]) || FError) return 128;
   V[129]=slhaVal("LAMN",V[17],2,3,1);
   if(!isfinite(V[129]) || FError) return 129;
   V[130]=slhaVal("LAMN",V[17],2,3,2);
   if(!isfinite(V[130]) || FError) return 130;
   V[131]=slhaVal("LAMN",V[17],2,3,3);
   if(!isfinite(V[131]) || FError) return 131;
   V[132]=slhaVal("TLAMN",V[17],2,1,1);
   if(!isfinite(V[132]) || FError) return 132;
   V[133]=slhaVal("TLAMN",V[17],2,1,2);
   if(!isfinite(V[133]) || FError) return 133;
   V[134]=slhaVal("TLAMN",V[17],2,1,3);
   if(!isfinite(V[134]) || FError) return 134;
   V[135]=slhaVal("TLAMN",V[17],2,2,1);
   if(!isfinite(V[135]) || FError) return 135;
   V[136]=slhaVal("TLAMN",V[17],2,2,2);
   if(!isfinite(V[136]) || FError) return 136;
   V[137]=slhaVal("TLAMN",V[17],2,2,3);
   if(!isfinite(V[137]) || FError) return 137;
   V[138]=slhaVal("TLAMN",V[17],2,3,1);
   if(!isfinite(V[138]) || FError) return 138;
   V[139]=slhaVal("TLAMN",V[17],2,3,2);
   if(!isfinite(V[139]) || FError) return 139;
   V[140]=slhaVal("TLAMN",V[17],2,3,3);
   if(!isfinite(V[140]) || FError) return 140;
   V[141]=slhaVal("YU",V[17],2,1,1);
   if(!isfinite(V[141]) || FError) return 141;
   V[142]=slhaVal("YU",V[17],2,1,2);
   if(!isfinite(V[142]) || FError) return 142;
   V[143]=slhaVal("YU",V[17],2,1,3);
   if(!isfinite(V[143]) || FError) return 143;
   V[144]=slhaVal("YU",V[17],2,2,1);
   if(!isfinite(V[144]) || FError) return 144;
   V[145]=slhaVal("YU",V[17],2,2,2);
   if(!isfinite(V[145]) || FError) return 145;
   V[146]=slhaVal("YU",V[17],2,2,3);
   if(!isfinite(V[146]) || FError) return 146;
   V[147]=slhaVal("YU",V[17],2,3,1);
   if(!isfinite(V[147]) || FError) return 147;
   V[148]=slhaVal("YU",V[17],2,3,2);
   if(!isfinite(V[148]) || FError) return 148;
   V[149]=slhaVal("YU",V[17],2,3,3);
   if(!isfinite(V[149]) || FError) return 149;
   V[150]=slhaVal("TU",V[17],2,1,1);
   if(!isfinite(V[150]) || FError) return 150;
   V[151]=slhaVal("TU",V[17],2,1,2);
   if(!isfinite(V[151]) || FError) return 151;
   V[152]=slhaVal("TU",V[17],2,1,3);
   if(!isfinite(V[152]) || FError) return 152;
   V[153]=slhaVal("TU",V[17],2,2,1);
   if(!isfinite(V[153]) || FError) return 153;
   V[154]=slhaVal("TU",V[17],2,2,2);
   if(!isfinite(V[154]) || FError) return 154;
   V[155]=slhaVal("TU",V[17],2,2,3);
   if(!isfinite(V[155]) || FError) return 155;
   V[156]=slhaVal("TU",V[17],2,3,1);
   if(!isfinite(V[156]) || FError) return 156;
   V[157]=slhaVal("TU",V[17],2,3,2);
   if(!isfinite(V[157]) || FError) return 157;
   V[158]=slhaVal("TU",V[17],2,3,3);
   if(!isfinite(V[158]) || FError) return 158;
   V[159]=slhaVal("YV",V[17],2,1,1);
   if(!isfinite(V[159]) || FError) return 159;
   V[160]=slhaVal("YV",V[17],2,1,2);
   if(!isfinite(V[160]) || FError) return 160;
   V[161]=slhaVal("YV",V[17],2,1,3);
   if(!isfinite(V[161]) || FError) return 161;
   V[162]=slhaVal("YV",V[17],2,2,1);
   if(!isfinite(V[162]) || FError) return 162;
   V[163]=slhaVal("YV",V[17],2,2,2);
   if(!isfinite(V[163]) || FError) return 163;
   V[164]=slhaVal("YV",V[17],2,2,3);
   if(!isfinite(V[164]) || FError) return 164;
   V[165]=slhaVal("YV",V[17],2,3,1);
   if(!isfinite(V[165]) || FError) return 165;
   V[166]=slhaVal("YV",V[17],2,3,2);
   if(!isfinite(V[166]) || FError) return 166;
   V[167]=slhaVal("YV",V[17],2,3,3);
   if(!isfinite(V[167]) || FError) return 167;
   V[168]=slhaVal("TV",V[17],2,1,1);
   if(!isfinite(V[168]) || FError) return 168;
   V[169]=slhaVal("TV",V[17],2,1,2);
   if(!isfinite(V[169]) || FError) return 169;
   V[170]=slhaVal("TV",V[17],2,1,3);
   if(!isfinite(V[170]) || FError) return 170;
   V[171]=slhaVal("TV",V[17],2,2,1);
   if(!isfinite(V[171]) || FError) return 171;
   V[172]=slhaVal("TV",V[17],2,2,2);
   if(!isfinite(V[172]) || FError) return 172;
   V[173]=slhaVal("TV",V[17],2,2,3);
   if(!isfinite(V[173]) || FError) return 173;
   V[174]=slhaVal("TV",V[17],2,3,1);
   if(!isfinite(V[174]) || FError) return 174;
   V[175]=slhaVal("TV",V[17],2,3,2);
   if(!isfinite(V[175]) || FError) return 175;
   V[176]=slhaVal("TV",V[17],2,3,3);
   if(!isfinite(V[176]) || FError) return 176;
   V[177]=slhaVal("NMSSMRUN",V[17],1,5);
   if(!isfinite(V[177]) || FError) return 177;
   V[178]=slhaVal("PHASES",V[17],1,1);
   if(!isfinite(V[178]) || FError) return 178;
   V[179]=slhaVal("DSQMIX",V[17],2,1,1);
   if(!isfinite(V[179]) || FError) return 179;
   V[180]=slhaVal("DSQMIX",V[17],2,1,2);
   if(!isfinite(V[180]) || FError) return 180;
   V[181]=slhaVal("DSQMIX",V[17],2,1,3);
   if(!isfinite(V[181]) || FError) return 181;
   V[182]=slhaVal("DSQMIX",V[17],2,1,4);
   if(!isfinite(V[182]) || FError) return 182;
   V[183]=slhaVal("DSQMIX",V[17],2,1,5);
   if(!isfinite(V[183]) || FError) return 183;
   V[184]=slhaVal("DSQMIX",V[17],2,1,6);
   if(!isfinite(V[184]) || FError) return 184;
   V[185]=slhaVal("DSQMIX",V[17],2,2,1);
   if(!isfinite(V[185]) || FError) return 185;
   V[186]=slhaVal("DSQMIX",V[17],2,2,2);
   if(!isfinite(V[186]) || FError) return 186;
   V[187]=slhaVal("DSQMIX",V[17],2,2,3);
   if(!isfinite(V[187]) || FError) return 187;
   V[188]=slhaVal("DSQMIX",V[17],2,2,4);
   if(!isfinite(V[188]) || FError) return 188;
   V[189]=slhaVal("DSQMIX",V[17],2,2,5);
   if(!isfinite(V[189]) || FError) return 189;
   V[190]=slhaVal("DSQMIX",V[17],2,2,6);
   if(!isfinite(V[190]) || FError) return 190;
   V[191]=slhaVal("DSQMIX",V[17],2,3,1);
   if(!isfinite(V[191]) || FError) return 191;
   V[192]=slhaVal("DSQMIX",V[17],2,3,2);
   if(!isfinite(V[192]) || FError) return 192;
   V[193]=slhaVal("DSQMIX",V[17],2,3,3);
   if(!isfinite(V[193]) || FError) return 193;
   V[194]=slhaVal("DSQMIX",V[17],2,3,4);
   if(!isfinite(V[194]) || FError) return 194;
   V[195]=slhaVal("DSQMIX",V[17],2,3,5);
   if(!isfinite(V[195]) || FError) return 195;
   V[196]=slhaVal("DSQMIX",V[17],2,3,6);
   if(!isfinite(V[196]) || FError) return 196;
   V[197]=slhaVal("DSQMIX",V[17],2,4,1);
   if(!isfinite(V[197]) || FError) return 197;
   V[198]=slhaVal("DSQMIX",V[17],2,4,2);
   if(!isfinite(V[198]) || FError) return 198;
   V[199]=slhaVal("DSQMIX",V[17],2,4,3);
   if(!isfinite(V[199]) || FError) return 199;
   V[200]=slhaVal("DSQMIX",V[17],2,4,4);
   if(!isfinite(V[200]) || FError) return 200;
   V[201]=slhaVal("DSQMIX",V[17],2,4,5);
   if(!isfinite(V[201]) || FError) return 201;
   V[202]=slhaVal("DSQMIX",V[17],2,4,6);
   if(!isfinite(V[202]) || FError) return 202;
   V[203]=slhaVal("DSQMIX",V[17],2,5,1);
   if(!isfinite(V[203]) || FError) return 203;
   V[204]=slhaVal("DSQMIX",V[17],2,5,2);
   if(!isfinite(V[204]) || FError) return 204;
   V[205]=slhaVal("DSQMIX",V[17],2,5,3);
   if(!isfinite(V[205]) || FError) return 205;
   V[206]=slhaVal("DSQMIX",V[17],2,5,4);
   if(!isfinite(V[206]) || FError) return 206;
   V[207]=slhaVal("DSQMIX",V[17],2,5,5);
   if(!isfinite(V[207]) || FError) return 207;
   V[208]=slhaVal("DSQMIX",V[17],2,5,6);
   if(!isfinite(V[208]) || FError) return 208;
   V[209]=slhaVal("DSQMIX",V[17],2,6,1);
   if(!isfinite(V[209]) || FError) return 209;
   V[210]=slhaVal("DSQMIX",V[17],2,6,2);
   if(!isfinite(V[210]) || FError) return 210;
   V[211]=slhaVal("DSQMIX",V[17],2,6,3);
   if(!isfinite(V[211]) || FError) return 211;
   V[212]=slhaVal("DSQMIX",V[17],2,6,4);
   if(!isfinite(V[212]) || FError) return 212;
   V[213]=slhaVal("DSQMIX",V[17],2,6,5);
   if(!isfinite(V[213]) || FError) return 213;
   V[214]=slhaVal("DSQMIX",V[17],2,6,6);
   if(!isfinite(V[214]) || FError) return 214;
   V[215]=slhaVal("SNUMIXI",V[17],2,1,1);
   if(!isfinite(V[215]) || FError) return 215;
   V[216]=slhaVal("SNUMIXI",V[17],2,1,2);
   if(!isfinite(V[216]) || FError) return 216;
   V[217]=slhaVal("SNUMIXI",V[17],2,1,3);
   if(!isfinite(V[217]) || FError) return 217;
   V[218]=slhaVal("SNUMIXI",V[17],2,1,4);
   if(!isfinite(V[218]) || FError) return 218;
   V[219]=slhaVal("SNUMIXI",V[17],2,1,5);
   if(!isfinite(V[219]) || FError) return 219;
   V[220]=slhaVal("SNUMIXI",V[17],2,1,6);
   if(!isfinite(V[220]) || FError) return 220;
   V[221]=slhaVal("SNUMIXI",V[17],2,2,1);
   if(!isfinite(V[221]) || FError) return 221;
   V[222]=slhaVal("SNUMIXI",V[17],2,2,2);
   if(!isfinite(V[222]) || FError) return 222;
   V[223]=slhaVal("SNUMIXI",V[17],2,2,3);
   if(!isfinite(V[223]) || FError) return 223;
   V[224]=slhaVal("SNUMIXI",V[17],2,2,4);
   if(!isfinite(V[224]) || FError) return 224;
   V[225]=slhaVal("SNUMIXI",V[17],2,2,5);
   if(!isfinite(V[225]) || FError) return 225;
   V[226]=slhaVal("SNUMIXI",V[17],2,2,6);
   if(!isfinite(V[226]) || FError) return 226;
   V[227]=slhaVal("SNUMIXI",V[17],2,3,1);
   if(!isfinite(V[227]) || FError) return 227;
   V[228]=slhaVal("SNUMIXI",V[17],2,3,2);
   if(!isfinite(V[228]) || FError) return 228;
   V[229]=slhaVal("SNUMIXI",V[17],2,3,3);
   if(!isfinite(V[229]) || FError) return 229;
   V[230]=slhaVal("SNUMIXI",V[17],2,3,4);
   if(!isfinite(V[230]) || FError) return 230;
   V[231]=slhaVal("SNUMIXI",V[17],2,3,5);
   if(!isfinite(V[231]) || FError) return 231;
   V[232]=slhaVal("SNUMIXI",V[17],2,3,6);
   if(!isfinite(V[232]) || FError) return 232;
   V[233]=slhaVal("SNUMIXI",V[17],2,4,1);
   if(!isfinite(V[233]) || FError) return 233;
   V[234]=slhaVal("SNUMIXI",V[17],2,4,2);
   if(!isfinite(V[234]) || FError) return 234;
   V[235]=slhaVal("SNUMIXI",V[17],2,4,3);
   if(!isfinite(V[235]) || FError) return 235;
   V[236]=slhaVal("SNUMIXI",V[17],2,4,4);
   if(!isfinite(V[236]) || FError) return 236;
   V[237]=slhaVal("SNUMIXI",V[17],2,4,5);
   if(!isfinite(V[237]) || FError) return 237;
   V[238]=slhaVal("SNUMIXI",V[17],2,4,6);
   if(!isfinite(V[238]) || FError) return 238;
   V[239]=slhaVal("SNUMIXI",V[17],2,5,1);
   if(!isfinite(V[239]) || FError) return 239;
   V[240]=slhaVal("SNUMIXI",V[17],2,5,2);
   if(!isfinite(V[240]) || FError) return 240;
   V[241]=slhaVal("SNUMIXI",V[17],2,5,3);
   if(!isfinite(V[241]) || FError) return 241;
   V[242]=slhaVal("SNUMIXI",V[17],2,5,4);
   if(!isfinite(V[242]) || FError) return 242;
   V[243]=slhaVal("SNUMIXI",V[17],2,5,5);
   if(!isfinite(V[243]) || FError) return 243;
   V[244]=slhaVal("SNUMIXI",V[17],2,5,6);
   if(!isfinite(V[244]) || FError) return 244;
   V[245]=slhaVal("SNUMIXI",V[17],2,6,1);
   if(!isfinite(V[245]) || FError) return 245;
   V[246]=slhaVal("SNUMIXI",V[17],2,6,2);
   if(!isfinite(V[246]) || FError) return 246;
   V[247]=slhaVal("SNUMIXI",V[17],2,6,3);
   if(!isfinite(V[247]) || FError) return 247;
   V[248]=slhaVal("SNUMIXI",V[17],2,6,4);
   if(!isfinite(V[248]) || FError) return 248;
   V[249]=slhaVal("SNUMIXI",V[17],2,6,5);
   if(!isfinite(V[249]) || FError) return 249;
   V[250]=slhaVal("SNUMIXI",V[17],2,6,6);
   if(!isfinite(V[250]) || FError) return 250;
   V[251]=slhaVal("SNUMIXR",V[17],2,1,1);
   if(!isfinite(V[251]) || FError) return 251;
   V[252]=slhaVal("SNUMIXR",V[17],2,1,2);
   if(!isfinite(V[252]) || FError) return 252;
   V[253]=slhaVal("SNUMIXR",V[17],2,1,3);
   if(!isfinite(V[253]) || FError) return 253;
   V[254]=slhaVal("SNUMIXR",V[17],2,1,4);
   if(!isfinite(V[254]) || FError) return 254;
   V[255]=slhaVal("SNUMIXR",V[17],2,1,5);
   if(!isfinite(V[255]) || FError) return 255;
   V[256]=slhaVal("SNUMIXR",V[17],2,1,6);
   if(!isfinite(V[256]) || FError) return 256;
   V[257]=slhaVal("SNUMIXR",V[17],2,2,1);
   if(!isfinite(V[257]) || FError) return 257;
   V[258]=slhaVal("SNUMIXR",V[17],2,2,2);
   if(!isfinite(V[258]) || FError) return 258;
   V[259]=slhaVal("SNUMIXR",V[17],2,2,3);
   if(!isfinite(V[259]) || FError) return 259;
   V[260]=slhaVal("SNUMIXR",V[17],2,2,4);
   if(!isfinite(V[260]) || FError) return 260;
   V[261]=slhaVal("SNUMIXR",V[17],2,2,5);
   if(!isfinite(V[261]) || FError) return 261;
   V[262]=slhaVal("SNUMIXR",V[17],2,2,6);
   if(!isfinite(V[262]) || FError) return 262;
   V[263]=slhaVal("SNUMIXR",V[17],2,3,1);
   if(!isfinite(V[263]) || FError) return 263;
   V[264]=slhaVal("SNUMIXR",V[17],2,3,2);
   if(!isfinite(V[264]) || FError) return 264;
   V[265]=slhaVal("SNUMIXR",V[17],2,3,3);
   if(!isfinite(V[265]) || FError) return 265;
   V[266]=slhaVal("SNUMIXR",V[17],2,3,4);
   if(!isfinite(V[266]) || FError) return 266;
   V[267]=slhaVal("SNUMIXR",V[17],2,3,5);
   if(!isfinite(V[267]) || FError) return 267;
   V[268]=slhaVal("SNUMIXR",V[17],2,3,6);
   if(!isfinite(V[268]) || FError) return 268;
   V[269]=slhaVal("SNUMIXR",V[17],2,4,1);
   if(!isfinite(V[269]) || FError) return 269;
   V[270]=slhaVal("SNUMIXR",V[17],2,4,2);
   if(!isfinite(V[270]) || FError) return 270;
   V[271]=slhaVal("SNUMIXR",V[17],2,4,3);
   if(!isfinite(V[271]) || FError) return 271;
   V[272]=slhaVal("SNUMIXR",V[17],2,4,4);
   if(!isfinite(V[272]) || FError) return 272;
   V[273]=slhaVal("SNUMIXR",V[17],2,4,5);
   if(!isfinite(V[273]) || FError) return 273;
   V[274]=slhaVal("SNUMIXR",V[17],2,4,6);
   if(!isfinite(V[274]) || FError) return 274;
   V[275]=slhaVal("SNUMIXR",V[17],2,5,1);
   if(!isfinite(V[275]) || FError) return 275;
   V[276]=slhaVal("SNUMIXR",V[17],2,5,2);
   if(!isfinite(V[276]) || FError) return 276;
   V[277]=slhaVal("SNUMIXR",V[17],2,5,3);
   if(!isfinite(V[277]) || FError) return 277;
   V[278]=slhaVal("SNUMIXR",V[17],2,5,4);
   if(!isfinite(V[278]) || FError) return 278;
   V[279]=slhaVal("SNUMIXR",V[17],2,5,5);
   if(!isfinite(V[279]) || FError) return 279;
   V[280]=slhaVal("SNUMIXR",V[17],2,5,6);
   if(!isfinite(V[280]) || FError) return 280;
   V[281]=slhaVal("SNUMIXR",V[17],2,6,1);
   if(!isfinite(V[281]) || FError) return 281;
   V[282]=slhaVal("SNUMIXR",V[17],2,6,2);
   if(!isfinite(V[282]) || FError) return 282;
   V[283]=slhaVal("SNUMIXR",V[17],2,6,3);
   if(!isfinite(V[283]) || FError) return 283;
   V[284]=slhaVal("SNUMIXR",V[17],2,6,4);
   if(!isfinite(V[284]) || FError) return 284;
   V[285]=slhaVal("SNUMIXR",V[17],2,6,5);
   if(!isfinite(V[285]) || FError) return 285;
   V[286]=slhaVal("SNUMIXR",V[17],2,6,6);
   if(!isfinite(V[286]) || FError) return 286;
   V[287]=slhaVal("USQMIX",V[17],2,1,1);
   if(!isfinite(V[287]) || FError) return 287;
   V[288]=slhaVal("USQMIX",V[17],2,1,2);
   if(!isfinite(V[288]) || FError) return 288;
   V[289]=slhaVal("USQMIX",V[17],2,1,3);
   if(!isfinite(V[289]) || FError) return 289;
   V[290]=slhaVal("USQMIX",V[17],2,1,4);
   if(!isfinite(V[290]) || FError) return 290;
   V[291]=slhaVal("USQMIX",V[17],2,1,5);
   if(!isfinite(V[291]) || FError) return 291;
   V[292]=slhaVal("USQMIX",V[17],2,1,6);
   if(!isfinite(V[292]) || FError) return 292;
   V[293]=slhaVal("USQMIX",V[17],2,2,1);
   if(!isfinite(V[293]) || FError) return 293;
   V[294]=slhaVal("USQMIX",V[17],2,2,2);
   if(!isfinite(V[294]) || FError) return 294;
   V[295]=slhaVal("USQMIX",V[17],2,2,3);
   if(!isfinite(V[295]) || FError) return 295;
   V[296]=slhaVal("USQMIX",V[17],2,2,4);
   if(!isfinite(V[296]) || FError) return 296;
   V[297]=slhaVal("USQMIX",V[17],2,2,5);
   if(!isfinite(V[297]) || FError) return 297;
   V[298]=slhaVal("USQMIX",V[17],2,2,6);
   if(!isfinite(V[298]) || FError) return 298;
   V[299]=slhaVal("USQMIX",V[17],2,3,1);
   if(!isfinite(V[299]) || FError) return 299;
   V[300]=slhaVal("USQMIX",V[17],2,3,2);
   if(!isfinite(V[300]) || FError) return 300;
   V[301]=slhaVal("USQMIX",V[17],2,3,3);
   if(!isfinite(V[301]) || FError) return 301;
   V[302]=slhaVal("USQMIX",V[17],2,3,4);
   if(!isfinite(V[302]) || FError) return 302;
   V[303]=slhaVal("USQMIX",V[17],2,3,5);
   if(!isfinite(V[303]) || FError) return 303;
   V[304]=slhaVal("USQMIX",V[17],2,3,6);
   if(!isfinite(V[304]) || FError) return 304;
   V[305]=slhaVal("USQMIX",V[17],2,4,1);
   if(!isfinite(V[305]) || FError) return 305;
   V[306]=slhaVal("USQMIX",V[17],2,4,2);
   if(!isfinite(V[306]) || FError) return 306;
   V[307]=slhaVal("USQMIX",V[17],2,4,3);
   if(!isfinite(V[307]) || FError) return 307;
   V[308]=slhaVal("USQMIX",V[17],2,4,4);
   if(!isfinite(V[308]) || FError) return 308;
   V[309]=slhaVal("USQMIX",V[17],2,4,5);
   if(!isfinite(V[309]) || FError) return 309;
   V[310]=slhaVal("USQMIX",V[17],2,4,6);
   if(!isfinite(V[310]) || FError) return 310;
   V[311]=slhaVal("USQMIX",V[17],2,5,1);
   if(!isfinite(V[311]) || FError) return 311;
   V[312]=slhaVal("USQMIX",V[17],2,5,2);
   if(!isfinite(V[312]) || FError) return 312;
   V[313]=slhaVal("USQMIX",V[17],2,5,3);
   if(!isfinite(V[313]) || FError) return 313;
   V[314]=slhaVal("USQMIX",V[17],2,5,4);
   if(!isfinite(V[314]) || FError) return 314;
   V[315]=slhaVal("USQMIX",V[17],2,5,5);
   if(!isfinite(V[315]) || FError) return 315;
   V[316]=slhaVal("USQMIX",V[17],2,5,6);
   if(!isfinite(V[316]) || FError) return 316;
   V[317]=slhaVal("USQMIX",V[17],2,6,1);
   if(!isfinite(V[317]) || FError) return 317;
   V[318]=slhaVal("USQMIX",V[17],2,6,2);
   if(!isfinite(V[318]) || FError) return 318;
   V[319]=slhaVal("USQMIX",V[17],2,6,3);
   if(!isfinite(V[319]) || FError) return 319;
   V[320]=slhaVal("USQMIX",V[17],2,6,4);
   if(!isfinite(V[320]) || FError) return 320;
   V[321]=slhaVal("USQMIX",V[17],2,6,5);
   if(!isfinite(V[321]) || FError) return 321;
   V[322]=slhaVal("USQMIX",V[17],2,6,6);
   if(!isfinite(V[322]) || FError) return 322;
   V[323]=slhaVal("SELMIX",V[17],2,1,1);
   if(!isfinite(V[323]) || FError) return 323;
   V[324]=slhaVal("SELMIX",V[17],2,1,2);
   if(!isfinite(V[324]) || FError) return 324;
   V[325]=slhaVal("SELMIX",V[17],2,1,3);
   if(!isfinite(V[325]) || FError) return 325;
   V[326]=slhaVal("SELMIX",V[17],2,1,4);
   if(!isfinite(V[326]) || FError) return 326;
   V[327]=slhaVal("SELMIX",V[17],2,1,5);
   if(!isfinite(V[327]) || FError) return 327;
   V[328]=slhaVal("SELMIX",V[17],2,1,6);
   if(!isfinite(V[328]) || FError) return 328;
   V[329]=slhaVal("SELMIX",V[17],2,2,1);
   if(!isfinite(V[329]) || FError) return 329;
   V[330]=slhaVal("SELMIX",V[17],2,2,2);
   if(!isfinite(V[330]) || FError) return 330;
   V[331]=slhaVal("SELMIX",V[17],2,2,3);
   if(!isfinite(V[331]) || FError) return 331;
   V[332]=slhaVal("SELMIX",V[17],2,2,4);
   if(!isfinite(V[332]) || FError) return 332;
   V[333]=slhaVal("SELMIX",V[17],2,2,5);
   if(!isfinite(V[333]) || FError) return 333;
   V[334]=slhaVal("SELMIX",V[17],2,2,6);
   if(!isfinite(V[334]) || FError) return 334;
   V[335]=slhaVal("SELMIX",V[17],2,3,1);
   if(!isfinite(V[335]) || FError) return 335;
   V[336]=slhaVal("SELMIX",V[17],2,3,2);
   if(!isfinite(V[336]) || FError) return 336;
   V[337]=slhaVal("SELMIX",V[17],2,3,3);
   if(!isfinite(V[337]) || FError) return 337;
   V[338]=slhaVal("SELMIX",V[17],2,3,4);
   if(!isfinite(V[338]) || FError) return 338;
   V[339]=slhaVal("SELMIX",V[17],2,3,5);
   if(!isfinite(V[339]) || FError) return 339;
   V[340]=slhaVal("SELMIX",V[17],2,3,6);
   if(!isfinite(V[340]) || FError) return 340;
   V[341]=slhaVal("SELMIX",V[17],2,4,1);
   if(!isfinite(V[341]) || FError) return 341;
   V[342]=slhaVal("SELMIX",V[17],2,4,2);
   if(!isfinite(V[342]) || FError) return 342;
   V[343]=slhaVal("SELMIX",V[17],2,4,3);
   if(!isfinite(V[343]) || FError) return 343;
   V[344]=slhaVal("SELMIX",V[17],2,4,4);
   if(!isfinite(V[344]) || FError) return 344;
   V[345]=slhaVal("SELMIX",V[17],2,4,5);
   if(!isfinite(V[345]) || FError) return 345;
   V[346]=slhaVal("SELMIX",V[17],2,4,6);
   if(!isfinite(V[346]) || FError) return 346;
   V[347]=slhaVal("SELMIX",V[17],2,5,1);
   if(!isfinite(V[347]) || FError) return 347;
   V[348]=slhaVal("SELMIX",V[17],2,5,2);
   if(!isfinite(V[348]) || FError) return 348;
   V[349]=slhaVal("SELMIX",V[17],2,5,3);
   if(!isfinite(V[349]) || FError) return 349;
   V[350]=slhaVal("SELMIX",V[17],2,5,4);
   if(!isfinite(V[350]) || FError) return 350;
   V[351]=slhaVal("SELMIX",V[17],2,5,5);
   if(!isfinite(V[351]) || FError) return 351;
   V[352]=slhaVal("SELMIX",V[17],2,5,6);
   if(!isfinite(V[352]) || FError) return 352;
   V[353]=slhaVal("SELMIX",V[17],2,6,1);
   if(!isfinite(V[353]) || FError) return 353;
   V[354]=slhaVal("SELMIX",V[17],2,6,2);
   if(!isfinite(V[354]) || FError) return 354;
   V[355]=slhaVal("SELMIX",V[17],2,6,3);
   if(!isfinite(V[355]) || FError) return 355;
   V[356]=slhaVal("SELMIX",V[17],2,6,4);
   if(!isfinite(V[356]) || FError) return 356;
   V[357]=slhaVal("SELMIX",V[17],2,6,5);
   if(!isfinite(V[357]) || FError) return 357;
   V[358]=slhaVal("SELMIX",V[17],2,6,6);
   if(!isfinite(V[358]) || FError) return 358;
   V[359]=slhaVal("NMHMIX",V[17],2,1,1);
   if(!isfinite(V[359]) || FError) return 359;
   V[360]=slhaVal("NMHMIX",V[17],2,1,2);
   if(!isfinite(V[360]) || FError) return 360;
   V[361]=slhaVal("NMHMIX",V[17],2,1,3);
   if(!isfinite(V[361]) || FError) return 361;
   V[362]=slhaVal("NMHMIX",V[17],2,2,1);
   if(!isfinite(V[362]) || FError) return 362;
   V[363]=slhaVal("NMHMIX",V[17],2,2,2);
   if(!isfinite(V[363]) || FError) return 363;
   V[364]=slhaVal("NMHMIX",V[17],2,2,3);
   if(!isfinite(V[364]) || FError) return 364;
   V[365]=slhaVal("NMHMIX",V[17],2,3,1);
   if(!isfinite(V[365]) || FError) return 365;
   V[366]=slhaVal("NMHMIX",V[17],2,3,2);
   if(!isfinite(V[366]) || FError) return 366;
   V[367]=slhaVal("NMHMIX",V[17],2,3,3);
   if(!isfinite(V[367]) || FError) return 367;
   V[368]=slhaVal("NMAMIX",V[17],2,1,1);
   if(!isfinite(V[368]) || FError) return 368;
   V[369]=slhaVal("NMAMIX",V[17],2,1,2);
   if(!isfinite(V[369]) || FError) return 369;
   V[370]=slhaVal("NMAMIX",V[17],2,1,3);
   if(!isfinite(V[370]) || FError) return 370;
   V[371]=slhaVal("NMAMIX",V[17],2,2,1);
   if(!isfinite(V[371]) || FError) return 371;
   V[372]=slhaVal("NMAMIX",V[17],2,2,2);
   if(!isfinite(V[372]) || FError) return 372;
   V[373]=slhaVal("NMAMIX",V[17],2,2,3);
   if(!isfinite(V[373]) || FError) return 373;
   V[374]=slhaVal("NMAMIX",V[17],2,3,1);
   if(!isfinite(V[374]) || FError) return 374;
   V[375]=slhaVal("NMAMIX",V[17],2,3,2);
   if(!isfinite(V[375]) || FError) return 375;
   V[376]=slhaVal("NMAMIX",V[17],2,3,3);
   if(!isfinite(V[376]) || FError) return 376;
   V[377]=slhaVal("CHARGEMIX",V[17],2,1,1);
   if(!isfinite(V[377]) || FError) return 377;
   V[378]=slhaVal("CHARGEMIX",V[17],2,1,2);
   if(!isfinite(V[378]) || FError) return 378;
   V[379]=slhaVal("CHARGEMIX",V[17],2,2,1);
   if(!isfinite(V[379]) || FError) return 379;
   V[380]=slhaVal("CHARGEMIX",V[17],2,2,2);
   if(!isfinite(V[380]) || FError) return 380;
   V[381]=slhaVal("NMNMIX",V[17],2,1,1);
   if(!isfinite(V[381]) || FError) return 381;
   V[382]=slhaVal("NMNMIX",V[17],2,1,2);
   if(!isfinite(V[382]) || FError) return 382;
   V[383]=slhaVal("NMNMIX",V[17],2,1,3);
   if(!isfinite(V[383]) || FError) return 383;
   V[384]=slhaVal("NMNMIX",V[17],2,1,4);
   if(!isfinite(V[384]) || FError) return 384;
   V[385]=slhaVal("NMNMIX",V[17],2,1,5);
   if(!isfinite(V[385]) || FError) return 385;
   V[386]=slhaVal("NMNMIX",V[17],2,2,1);
   if(!isfinite(V[386]) || FError) return 386;
   V[387]=slhaVal("NMNMIX",V[17],2,2,2);
   if(!isfinite(V[387]) || FError) return 387;
   V[388]=slhaVal("NMNMIX",V[17],2,2,3);
   if(!isfinite(V[388]) || FError) return 388;
   V[389]=slhaVal("NMNMIX",V[17],2,2,4);
   if(!isfinite(V[389]) || FError) return 389;
   V[390]=slhaVal("NMNMIX",V[17],2,2,5);
   if(!isfinite(V[390]) || FError) return 390;
   V[391]=slhaVal("NMNMIX",V[17],2,3,1);
   if(!isfinite(V[391]) || FError) return 391;
   V[392]=slhaVal("NMNMIX",V[17],2,3,2);
   if(!isfinite(V[392]) || FError) return 392;
   V[393]=slhaVal("NMNMIX",V[17],2,3,3);
   if(!isfinite(V[393]) || FError) return 393;
   V[394]=slhaVal("NMNMIX",V[17],2,3,4);
   if(!isfinite(V[394]) || FError) return 394;
   V[395]=slhaVal("NMNMIX",V[17],2,3,5);
   if(!isfinite(V[395]) || FError) return 395;
   V[396]=slhaVal("NMNMIX",V[17],2,4,1);
   if(!isfinite(V[396]) || FError) return 396;
   V[397]=slhaVal("NMNMIX",V[17],2,4,2);
   if(!isfinite(V[397]) || FError) return 397;
   V[398]=slhaVal("NMNMIX",V[17],2,4,3);
   if(!isfinite(V[398]) || FError) return 398;
   V[399]=slhaVal("NMNMIX",V[17],2,4,4);
   if(!isfinite(V[399]) || FError) return 399;
   V[400]=slhaVal("NMNMIX",V[17],2,4,5);
   if(!isfinite(V[400]) || FError) return 400;
   V[401]=slhaVal("NMNMIX",V[17],2,5,1);
   if(!isfinite(V[401]) || FError) return 401;
   V[402]=slhaVal("NMNMIX",V[17],2,5,2);
   if(!isfinite(V[402]) || FError) return 402;
   V[403]=slhaVal("NMNMIX",V[17],2,5,3);
   if(!isfinite(V[403]) || FError) return 403;
   V[404]=slhaVal("NMNMIX",V[17],2,5,4);
   if(!isfinite(V[404]) || FError) return 404;
   V[405]=slhaVal("NMNMIX",V[17],2,5,5);
   if(!isfinite(V[405]) || FError) return 405;
   V[406]=slhaVal("UVMIX",V[17],2,1,1);
   if(!isfinite(V[406]) || FError) return 406;
   V[407]=slhaVal("UVMIX",V[17],2,1,2);
   if(!isfinite(V[407]) || FError) return 407;
   V[408]=slhaVal("UVMIX",V[17],2,1,3);
   if(!isfinite(V[408]) || FError) return 408;
   V[409]=slhaVal("UVMIX",V[17],2,1,4);
   if(!isfinite(V[409]) || FError) return 409;
   V[410]=slhaVal("UVMIX",V[17],2,1,5);
   if(!isfinite(V[410]) || FError) return 410;
   V[411]=slhaVal("UVMIX",V[17],2,1,6);
   if(!isfinite(V[411]) || FError) return 411;
   V[412]=slhaVal("UVMIX",V[17],2,2,1);
   if(!isfinite(V[412]) || FError) return 412;
   V[413]=slhaVal("UVMIX",V[17],2,2,2);
   if(!isfinite(V[413]) || FError) return 413;
   V[414]=slhaVal("UVMIX",V[17],2,2,3);
   if(!isfinite(V[414]) || FError) return 414;
   V[415]=slhaVal("UVMIX",V[17],2,2,4);
   if(!isfinite(V[415]) || FError) return 415;
   V[416]=slhaVal("UVMIX",V[17],2,2,5);
   if(!isfinite(V[416]) || FError) return 416;
   V[417]=slhaVal("UVMIX",V[17],2,2,6);
   if(!isfinite(V[417]) || FError) return 417;
   V[418]=slhaVal("UVMIX",V[17],2,3,1);
   if(!isfinite(V[418]) || FError) return 418;
   V[419]=slhaVal("UVMIX",V[17],2,3,2);
   if(!isfinite(V[419]) || FError) return 419;
   V[420]=slhaVal("UVMIX",V[17],2,3,3);
   if(!isfinite(V[420]) || FError) return 420;
   V[421]=slhaVal("UVMIX",V[17],2,3,4);
   if(!isfinite(V[421]) || FError) return 421;
   V[422]=slhaVal("UVMIX",V[17],2,3,5);
   if(!isfinite(V[422]) || FError) return 422;
   V[423]=slhaVal("UVMIX",V[17],2,3,6);
   if(!isfinite(V[423]) || FError) return 423;
   V[424]=slhaVal("UVMIX",V[17],2,4,1);
   if(!isfinite(V[424]) || FError) return 424;
   V[425]=slhaVal("UVMIX",V[17],2,4,2);
   if(!isfinite(V[425]) || FError) return 425;
   V[426]=slhaVal("UVMIX",V[17],2,4,3);
   if(!isfinite(V[426]) || FError) return 426;
   V[427]=slhaVal("UVMIX",V[17],2,4,4);
   if(!isfinite(V[427]) || FError) return 427;
   V[428]=slhaVal("UVMIX",V[17],2,4,5);
   if(!isfinite(V[428]) || FError) return 428;
   V[429]=slhaVal("UVMIX",V[17],2,4,6);
   if(!isfinite(V[429]) || FError) return 429;
   V[430]=slhaVal("UVMIX",V[17],2,5,1);
   if(!isfinite(V[430]) || FError) return 430;
   V[431]=slhaVal("UVMIX",V[17],2,5,2);
   if(!isfinite(V[431]) || FError) return 431;
   V[432]=slhaVal("UVMIX",V[17],2,5,3);
   if(!isfinite(V[432]) || FError) return 432;
   V[433]=slhaVal("UVMIX",V[17],2,5,4);
   if(!isfinite(V[433]) || FError) return 433;
   V[434]=slhaVal("UVMIX",V[17],2,5,5);
   if(!isfinite(V[434]) || FError) return 434;
   V[435]=slhaVal("UVMIX",V[17],2,5,6);
   if(!isfinite(V[435]) || FError) return 435;
   V[436]=slhaVal("UVMIX",V[17],2,6,1);
   if(!isfinite(V[436]) || FError) return 436;
   V[437]=slhaVal("UVMIX",V[17],2,6,2);
   if(!isfinite(V[437]) || FError) return 437;
   V[438]=slhaVal("UVMIX",V[17],2,6,3);
   if(!isfinite(V[438]) || FError) return 438;
   V[439]=slhaVal("UVMIX",V[17],2,6,4);
   if(!isfinite(V[439]) || FError) return 439;
   V[440]=slhaVal("UVMIX",V[17],2,6,5);
   if(!isfinite(V[440]) || FError) return 440;
   V[441]=slhaVal("UVMIX",V[17],2,6,6);
   if(!isfinite(V[441]) || FError) return 441;
   V[442]=slhaVal("UMIX",V[17],2,1,1);
   if(!isfinite(V[442]) || FError) return 442;
   V[443]=slhaVal("UMIX",V[17],2,1,2);
   if(!isfinite(V[443]) || FError) return 443;
   V[444]=slhaVal("UMIX",V[17],2,2,1);
   if(!isfinite(V[444]) || FError) return 444;
   V[445]=slhaVal("UMIX",V[17],2,2,2);
   if(!isfinite(V[445]) || FError) return 445;
   V[446]=slhaVal("VMIX",V[17],2,1,1);
   if(!isfinite(V[446]) || FError) return 446;
   V[447]=slhaVal("VMIX",V[17],2,1,2);
   if(!isfinite(V[447]) || FError) return 447;
   V[448]=slhaVal("VMIX",V[17],2,2,1);
   if(!isfinite(V[448]) || FError) return 448;
   V[449]=slhaVal("VMIX",V[17],2,2,2);
   if(!isfinite(V[449]) || FError) return 449;
   V[450]=slhaVal("UELMIX",V[17],2,1,1);
   if(!isfinite(V[450]) || FError) return 450;
   V[451]=slhaVal("UELMIX",V[17],2,1,2);
   if(!isfinite(V[451]) || FError) return 451;
   V[452]=slhaVal("UELMIX",V[17],2,1,3);
   if(!isfinite(V[452]) || FError) return 452;
   V[453]=slhaVal("UELMIX",V[17],2,2,1);
   if(!isfinite(V[453]) || FError) return 453;
   V[454]=slhaVal("UELMIX",V[17],2,2,2);
   if(!isfinite(V[454]) || FError) return 454;
   V[455]=slhaVal("UELMIX",V[17],2,2,3);
   if(!isfinite(V[455]) || FError) return 455;
   V[456]=slhaVal("UELMIX",V[17],2,3,1);
   if(!isfinite(V[456]) || FError) return 456;
   V[457]=slhaVal("UELMIX",V[17],2,3,2);
   if(!isfinite(V[457]) || FError) return 457;
   V[458]=slhaVal("UELMIX",V[17],2,3,3);
   if(!isfinite(V[458]) || FError) return 458;
   V[459]=slhaVal("UERMIX",V[17],2,1,1);
   if(!isfinite(V[459]) || FError) return 459;
   V[460]=slhaVal("UERMIX",V[17],2,1,2);
   if(!isfinite(V[460]) || FError) return 460;
   V[461]=slhaVal("UERMIX",V[17],2,1,3);
   if(!isfinite(V[461]) || FError) return 461;
   V[462]=slhaVal("UERMIX",V[17],2,2,1);
   if(!isfinite(V[462]) || FError) return 462;
   V[463]=slhaVal("UERMIX",V[17],2,2,2);
   if(!isfinite(V[463]) || FError) return 463;
   V[464]=slhaVal("UERMIX",V[17],2,2,3);
   if(!isfinite(V[464]) || FError) return 464;
   V[465]=slhaVal("UERMIX",V[17],2,3,1);
   if(!isfinite(V[465]) || FError) return 465;
   V[466]=slhaVal("UERMIX",V[17],2,3,2);
   if(!isfinite(V[466]) || FError) return 466;
   V[467]=slhaVal("UERMIX",V[17],2,3,3);
   if(!isfinite(V[467]) || FError) return 467;
   V[468]=slhaVal("UDLMIX",V[17],2,1,1);
   if(!isfinite(V[468]) || FError) return 468;
   V[469]=slhaVal("UDLMIX",V[17],2,1,2);
   if(!isfinite(V[469]) || FError) return 469;
   V[470]=slhaVal("UDLMIX",V[17],2,1,3);
   if(!isfinite(V[470]) || FError) return 470;
   V[471]=slhaVal("UDLMIX",V[17],2,2,1);
   if(!isfinite(V[471]) || FError) return 471;
   V[472]=slhaVal("UDLMIX",V[17],2,2,2);
   if(!isfinite(V[472]) || FError) return 472;
   V[473]=slhaVal("UDLMIX",V[17],2,2,3);
   if(!isfinite(V[473]) || FError) return 473;
   V[474]=slhaVal("UDLMIX",V[17],2,3,1);
   if(!isfinite(V[474]) || FError) return 474;
   V[475]=slhaVal("UDLMIX",V[17],2,3,2);
   if(!isfinite(V[475]) || FError) return 475;
   V[476]=slhaVal("UDLMIX",V[17],2,3,3);
   if(!isfinite(V[476]) || FError) return 476;
   V[477]=slhaVal("UDRMIX",V[17],2,1,1);
   if(!isfinite(V[477]) || FError) return 477;
   V[478]=slhaVal("UDRMIX",V[17],2,1,2);
   if(!isfinite(V[478]) || FError) return 478;
   V[479]=slhaVal("UDRMIX",V[17],2,1,3);
   if(!isfinite(V[479]) || FError) return 479;
   V[480]=slhaVal("UDRMIX",V[17],2,2,1);
   if(!isfinite(V[480]) || FError) return 480;
   V[481]=slhaVal("UDRMIX",V[17],2,2,2);
   if(!isfinite(V[481]) || FError) return 481;
   V[482]=slhaVal("UDRMIX",V[17],2,2,3);
   if(!isfinite(V[482]) || FError) return 482;
   V[483]=slhaVal("UDRMIX",V[17],2,3,1);
   if(!isfinite(V[483]) || FError) return 483;
   V[484]=slhaVal("UDRMIX",V[17],2,3,2);
   if(!isfinite(V[484]) || FError) return 484;
   V[485]=slhaVal("UDRMIX",V[17],2,3,3);
   if(!isfinite(V[485]) || FError) return 485;
   V[486]=slhaVal("UULMIX",V[17],2,1,1);
   if(!isfinite(V[486]) || FError) return 486;
   V[487]=slhaVal("UULMIX",V[17],2,1,2);
   if(!isfinite(V[487]) || FError) return 487;
   V[488]=slhaVal("UULMIX",V[17],2,1,3);
   if(!isfinite(V[488]) || FError) return 488;
   V[489]=slhaVal("UULMIX",V[17],2,2,1);
   if(!isfinite(V[489]) || FError) return 489;
   V[490]=slhaVal("UULMIX",V[17],2,2,2);
   if(!isfinite(V[490]) || FError) return 490;
   V[491]=slhaVal("UULMIX",V[17],2,2,3);
   if(!isfinite(V[491]) || FError) return 491;
   V[492]=slhaVal("UULMIX",V[17],2,3,1);
   if(!isfinite(V[492]) || FError) return 492;
   V[493]=slhaVal("UULMIX",V[17],2,3,2);
   if(!isfinite(V[493]) || FError) return 493;
   V[494]=slhaVal("UULMIX",V[17],2,3,3);
   if(!isfinite(V[494]) || FError) return 494;
   V[495]=slhaVal("UURMIX",V[17],2,1,1);
   if(!isfinite(V[495]) || FError) return 495;
   V[496]=slhaVal("UURMIX",V[17],2,1,2);
   if(!isfinite(V[496]) || FError) return 496;
   V[497]=slhaVal("UURMIX",V[17],2,1,3);
   if(!isfinite(V[497]) || FError) return 497;
   V[498]=slhaVal("UURMIX",V[17],2,2,1);
   if(!isfinite(V[498]) || FError) return 498;
   V[499]=slhaVal("UURMIX",V[17],2,2,2);
   if(!isfinite(V[499]) || FError) return 499;
   V[500]=slhaVal("UURMIX",V[17],2,2,3);
   if(!isfinite(V[500]) || FError) return 500;
   V[501]=slhaVal("UURMIX",V[17],2,3,1);
   if(!isfinite(V[501]) || FError) return 501;
   V[502]=slhaVal("UURMIX",V[17],2,3,2);
   if(!isfinite(V[502]) || FError) return 502;
   V[503]=slhaVal("UURMIX",V[17],2,3,3);
   if(!isfinite(V[503]) || FError) return 503;
   V[504]=slhaVal("HMIX",V[17],1,10);
   if(!isfinite(V[504]) || FError) return 504;
   V[505]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,25,22,22);
   if(!isfinite(V[505]) || FError) return 505;
   V[506]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,25,21,21);
   if(!isfinite(V[506]) || FError) return 506;
   V[507]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,35,22,22);
   if(!isfinite(V[507]) || FError) return 507;
   V[508]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,35,21,21);
   if(!isfinite(V[508]) || FError) return 508;
   V[509]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,45,22,22);
   if(!isfinite(V[509]) || FError) return 509;
   V[510]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,45,21,21);
   if(!isfinite(V[510]) || FError) return 510;
   V[511]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,36,22,22);
   if(!isfinite(V[511]) || FError) return 511;
   V[512]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,36,21,21);
   if(!isfinite(V[512]) || FError) return 512;
   V[513]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,46,22,22);
   if(!isfinite(V[513]) || FError) return 513;
   V[514]=slhaVal("EFFHIGGSCOUPLINGS",V[17],3,46,21,21);
   if(!isfinite(V[514]) || FError) return 514;
   V[515]=initQCD(V[18],V[81],V[79],V[82]);
   if(!isfinite(V[515]) || FError) return 515;
   V[516]=sqrt(alphaQCD(V[17])*4*3.1415927)*1;
   if(!isfinite(V[516]) || FError) return 516;
   V[517]=sin(V[504]);
   if(!isfinite(V[517]) || FError) return 517;
   V[518]=cos(V[504]);
   if(!isfinite(V[518]) || FError) return 518;
   V[519]=tan(V[504]);
   if(!isfinite(V[519]) || FError) return 519;
   V[520]=2*sqrt(1/(V[20]))*sqrt(V[16]);
   if(!isfinite(V[520]) || FError) return 520;
   V[521]=sqrt(pow(V[59],2)/(2.)+sqrt(pow(V[59],4)/(4.)-pow(V[59],2)*V[16]/(V[15]*V[20]*V[21])));
   if(!isfinite(V[521]) || FError) return 521;
   if(VV==NULL) 
   {  VV=malloc(sizeof(REAL)*nModelVars);
      for(i=0;i<nModelVars;i++) if(strcmp(varNames[i],"Q")==0) iQ=i;
   }
   for(i=0;i<nModelVars;i++) VV[i]=V[i];
   cErr=0;
   return 0;
}