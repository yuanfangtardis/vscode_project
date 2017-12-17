#include "../include/micromegas.h"
#include"../include/micromegas_aux.h"
#include "lib/pmodel.h"
#include <string>
#include <iostream>
#include <fstream>
using namespace std;

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
/* MAIN PROGRAM (by F.Staub, last change 28.07.2017)			     		    */
/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

int main(int argc, char** argv)
{
// yanang added for input parameter
for(int i=0;i<argc;i++)
{

   cout<<"argv["<<i<<"]="<<argv[i]<<endl;
}

if(argc==1)
{
   cout<<"argc="<<argc<<endl;
   cout<<"argument=1, exit..."<<endl;
   return -1;
} 
else if(argc==2)
{
    ifstream fin(argv[1]);
    if(!fin)
    {
       cout<<"Spheno SPectrum not found, exit..."<<endl;
       return -2;
     }
}

 



  
		int err, i;
	   	char lspname[10], nlspname[10];
		double Omega=-1, Xf=-1;
		double w;
		double cut = 0.01;		// cut-off for channel output								
		int fast = 1;			/* 0 = best accuracy, 1 = "fast option" accuracy ~1% 	     */
 		double Beps = 1.E-5;  		/* Criteqrium for including co-annihilations (1 = no coann.) */
 		VZdecay=0; VWdecay=0; cleanDecayTable();
		ForceUG=1; 		
			err = sortOddParticles(lspname);	
//following shl
printHiggs(stdout);

			printMasses(stdout,1);				
//following shl
cleanDecayTable();


	 		Omega = darkOmega(&Xf,fast,Beps);
			printf("Xf=%.2e Omega h^2=%.2e\n",Xf,Omega);

//following shl
if(Omega>0){
   			printChannels(Xf,cut,Beps,1,stdout);
}


			printf("\n");

//following shl
			printChannels(Xf,cut,Beps,1,stdout);

			FILE *omega = fopen("omg.out","w");

//following shl
//			fprintf(omega,"%i %6.6lf # relic density \n",1,Omega);
			fprintf(omega,"BLOCK DarkMatter\n"
"   1   %E   #dark matter relick densisty\n"
"   2   %E   #ratio omega_N/omega_0\n"
,Omega, Omega/0.1197);

			w = 1.;
			i = 0;
			while (w>cut) 
			{
			    fprintf(omega,"   %i %6.6lf # %s %s -> %s %s\n",100+i,omegaCh[i].weight,omegaCh[i].prtcl[0],omegaCh[i].prtcl[1],omegaCh[i].prtcl[2],omegaCh[i].prtcl[3]);
			    i++;
			    w = omegaCh[i].weight;
			}

//following shl
//				FILE *channels = fopen("channels.out","w");
//			w = 1.;
//			i = 0;
//			while (w>cut) 
//			{
//			fprintf(channels,"%li %li %li %li %6.6lf # %s %s -> %s %s\n",pNum(omegaCh[i].prtcl[0]),pNum(omegaCh[i].prtcl[1]),pNum(omegaCh[i].prtcl[2]),pNum(omegaCh[i].prtcl[3]),omegaCh[i].weight,omegaCh[i].prtcl[0],omegaCh[i].prtcl[1],omegaCh[i].prtcl[2],omegaCh[i].prtcl[3]);
//			    i++;
//			    w = omegaCh[i].weight;
//			}

//following shl
{
printf("\n====== Indirect detection =====\n");
   int err,i;
   double Emin=0.5, sigmaV;
   double vcs_gz, vcs_gg;
   char txt[100];
   double SpA[NZ], SpE[NZ], SpP[NZ];
   double FluxA[NZ], FluxE[NZ], FluxP[NZ];
   double SpNe[NZ], SpNm[NZ], SpN1[NZ];
   double Etest=Mcdm/2.0;

   sigmaV=calcSpectrum(0, SpA, NULL, NULL, NULL, NULL, NULL, &err);

   printf("sigmaV=%E [cm^3/s]\n", sigmaV);
   fprintf(omega, "   301  %E  #Dark Matter Mass (GeV)\n", Mcdm);
   fprintf(omega, "   302  %E  #SigmaV=[cm^3/s]\n", sigmaV);

   double E;
   for (i=1;i<250;i++){
       E=SpA[0]*exp(Zi(i));
       fprintf(omega, "%6i%12.6lf%12.6lf\n",400+i,E,SpA[i]/E);
   }

}


{
  printf("\n==== Calculation of CDM-nucleons amplitudes  =====\n");   

//following shl
//reset form factor
  calcScalarQuarkFF(0.553, 18.9, 34., 42.);


  double pA0[2],pA5[2],nA0[2],nA5[2];
  double Nmass=0.939; /*nucleon mass*/
  double SCcoeff;  
  

//following shl
//printf("         TREE LEVEL\n");
    nucleonAmplitudes(CDM1, pA0,pA5,nA0,nA5);
    printf("CDM-nucleon micrOMEGAs amplitudes:\n");
    printf("proton:  SI  %.3E  SD  %.3E\n",pA0[0],pA5[0]);
    printf("neutron: SI  %.3E  SD  %.3E\n",nA0[0],nA5[0]); 

//following shl
//printf("         BOX DIAGRAMS\n");  
//    nucleonAmplitudes(CDM1,  pA0,pA5,nA0,nA5);
//    printf("CDM-nucleon micrOMEGAs amplitudes:\n");
//    printf("proton:  SI  %.3E  SD  %.3E\n",pA0[0],pA5[0]);
//    printf("neutron: SI  %.3E  SD  %.3E\n",nA0[0],nA5[0]); 

  SCcoeff=4/M_PI*3.8937966E8*pow(Nmass*Mcdm/(Nmass+ Mcdm),2.);
    printf("CDM-nucleon cross sections[pb]:\n");
    printf(" proton  SI %.3E  SD %.3E\n",SCcoeff*pA0[0]*pA0[0],3*SCcoeff*pA5[0]*pA5[0]);
    printf(" neutron SI %.3E  SD %.3E\n",SCcoeff*nA0[0]*nA0[0],3*SCcoeff*nA5[0]*nA5[0]);
    

//following shl    
    fprintf(omega,"#CDM-nucleon cross sections[pb]:\n");
    fprintf(omega,"   201 %E #proton SI\n",SCcoeff*pA0[0]*pA0[0]);
    fprintf(omega,"   202 %E #proton SD\n",3*SCcoeff*pA5[0]*pA5[0]);
    fprintf(omega,"   203 %E #neutron SI\n",SCcoeff*nA0[0]*nA0[0]);
    fprintf(omega,"   204 %E #neutron SD\n",3*SCcoeff*nA5[0]*nA5[0]);
    
    
}



//following shl
//{
//  double dNdE[300];
//  double nEvents;
//  double nEventsCut;
//
//printf("\n======== Direct Detection ========\n");    
//
//  nEvents=nucleusRecoil(Maxwell,73,Z_Ge,J_Ge73,SxxGe73,dNdE);
//  printf("73Ge: Total number of events=%.2E /day/kg\n",nEvents);
//  nEventsCut=cutRecoilResult(dNdE,10,50);
//  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",nEventsCut);                                   ;
//  fprintf(omega,"301 %6.6lf #\n",nEvents);
//                                                                                                         
//  nEvents=nucleusRecoil(Maxwell,131,Z_Xe,J_Xe131,SxxXe131,dNdE);
//  printf("131Xe: Total number of events=%.2E /day/kg\n",nEvents);
//  nEventsCut=cutRecoilResult(dNdE,10,50);
//  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",nEventsCut);                                   
//  fprintf(omega,"302 %6.6lf #\n",nEvents);
//  
//  nEvents=nucleusRecoil(Maxwell,23,Z_Na,J_Na23,SxxNa23,dNdE);
//  printf("23Na: Total number of events=%.2E /day/kg\n",nEvents);
//  nEventsCut=cutRecoilResult(dNdE,10,50);
//  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",nEventsCut);  
//  fprintf(omega,"303 %6.6lf #\n",nEvents);
//  
//  nEvents=nucleusRecoil(Maxwell,127,Z_I,J_I127,SxxI127,dNdE);
//  printf("I127: Total number of events=%.2E /day/kg\n",nEvents);
//  nEventsCut=cutRecoilResult(dNdE,10,50);
//  printf("Number of events in 10 - 50 KeV region=%.2E /day/kg\n",nEventsCut);  
//  fprintf(omega,"304 %6.6lf #\n",nEvents);
//
//
//}



//following shl
//       fclose(channels);

       fclose(omega);

  	return 0;
}

