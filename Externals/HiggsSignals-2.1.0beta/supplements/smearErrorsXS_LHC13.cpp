#include <iostream>
#include <vector>
#include "TRandom3.h"
#include "TMath.h"
//#include <stdio.h>

void smearErrorsXS_LHC13 () {


  cout << "#----------------------------------------------------#" << endl;
  cout << "#                                                    #" << endl;
  cout << "#      Covariance matrix calculator for the          #" << endl;
  cout << "#     Higgs boson cross section uncertainties        #" << endl;
  cout << "#      for LHC 13 TeV, following the YR4.            #" << endl;
  cout << "#                                                    #" << endl;  
  cout << "#          This ROOT macro is part of the            #" << endl;
  cout << "#              HiggsSignals package.                 #" << endl;
  cout << "#                                                    #" << endl;
  cout << "#      (latest change on 29/03/2017, PB & TS)        #" << endl;
  cout << "#----------------------------------------------------#" << endl;
  cout << endl;
 
  const int    shape            = 0; // 0: gauss, 1: box
  const double errorScaleFactor = 1.;
  const bool   error100percCorr = false;
  const bool   errorScaleZW100percCorr = true;
  const bool   errorPdf100percCorr = false;
  const bool   errorPdfOnlyProc100percCorr = true;
  const int    nErrors          = 3;
  const int    nXS              = 5;
  const int    nRandomNumbers   = nXS*nErrors;
  const int    nToys            = 1000000;
  double       upperRelError[nXS][nErrors];
  double       lowerRelError[nXS][nErrors];
  double       centralValueXS[nXS];
  vector< vector<double> > toyXSset;
  double       covarianceMatrixXS[nXS][nXS];
//Scale factors for various types of uncertainties:
  const double       pdfsf=1.0;
  const double       qcdsf=1.0;
  const double       thsf = 1.0;  

  TRandom3 random;

 
  cout << "Filling input relative parameteric and theoretical uncertainties..." << endl;

  // Values for mH = 125.09 GeV
  centralValueXS[0] = 48510.0; // ggF
  centralValueXS[1] = 3779.0; // VBF
  centralValueXS[2] = 1373.0; // WH
  centralValueXS[3] =  882.1; // ZH
  centralValueXS[4] =  506.5; // ttH

  // ggF 13 TeV
  // xs    QCDscale PDF+alphas
  // 48510 3.9 3.2
  // VBF 13 TeV
  // xs   deltaEW PDF QCD scale
  // 3779 −5.3    2.1 0.5
  // WH 13 TeV
  // xs     QCD scale PDF    
  // 1373.0     ±0.9     ±1.7
  // ZH 13 TeV 126 
  // xs    QCD scale PDF
  // 882.10 ±0.9      ±1.3
  // ttH 13 TeV 126 
  // xs    QCD scale  PDF+alphas
  // 506.5 +5.8 −9.2  ±3.6

  lowerRelError[0][0] = pdfsf*3.2; // ggF PDF(+alphas)
  lowerRelError[0][1] = qcdsf*3.9; // ggF QCD scale
  lowerRelError[0][2] = thsf*0.0; // ggF EW
  lowerRelError[1][0] = pdfsf*2.1; // VBF PDF(+alphas)
  lowerRelError[1][1] = qcdsf*0.5; // VBF QCD scale
  lowerRelError[1][2] = thsf*5.3; // VBF EW
  lowerRelError[2][0] = pdfsf*1.7; // WH  PDF(+alphas)
  lowerRelError[2][1] = qcdsf*0.9; // WH  QCD scale
  lowerRelError[2][2] = thsf*0.0; // WH  EW
  lowerRelError[3][0] = pdfsf*1.3; // ZH  PDF(+alphas)
  lowerRelError[3][1] = qcdsf*0.9; // ZH  QCD scale
  lowerRelError[3][2] = thsf*0.0; // ZH  EW
  lowerRelError[4][0] = pdfsf*3.6; // ttH PDF(+alphas)
  lowerRelError[4][1] = qcdsf*9.2; // ttH QCD scale
  lowerRelError[4][2] = thsf*0.0; // ttH EW

  upperRelError[0][0] = pdfsf*3.2; // ggF PDF(+alphas)
  upperRelError[0][1] = qcdsf*3.9; // ggF QCD scale
  upperRelError[0][2] = thsf*0.0; // ggF EW
  upperRelError[1][0] = pdfsf*2.1; // VBF PDF(+alphas)
  upperRelError[1][1] = qcdsf*0.5; // VBF QCD scale
  upperRelError[1][2] = thsf*0.0; // VBF EW
  upperRelError[2][0] = pdfsf*1.7; // WH  PDF(+alphas)
  upperRelError[2][1] = qcdsf*0.9; // WH  QCD scale
  upperRelError[2][2] = thsf*0.0; // WH  EW
  upperRelError[3][0] = pdfsf*1.3; // ZH  PDF(+alphas)
  upperRelError[3][1] = qcdsf*0.9; // ZH  QCD scale
  upperRelError[3][2] = thsf*0.0; // ZH  EW
  upperRelError[4][0] = pdfsf*3.6; // ttH PDF(+alphas)
  upperRelError[4][1] = qcdsf*5.8; // ttH QCD scale
  upperRelError[4][2] = thsf*0.0; // ttH EW
  
  // convert to percent
  for (int iXS = 0; iXS < nXS; iXS++) {
    for (int iError = 0; iError < nErrors; iError++) {
      lowerRelError[iXS][iError] = lowerRelError[iXS][iError]*0.01;
      upperRelError[iXS][iError] = upperRelError[iXS][iError]*0.01;
    }
  }

  cout << "Start generating toys..." << endl;

  for (int iToy = 0; iToy < nToys; iToy++) {
    double thisErrorSmearing[nRandomNumbers];
    for (int iError = 0; iError < nRandomNumbers; iError++) {
      if (shape == 0) {
	thisErrorSmearing[iError] = random.Gaus(0,errorScaleFactor);
      } else if (shape == 1) {
	thisErrorSmearing[iError] = random.Uniform(-errorScaleFactor,errorScaleFactor);
      } else  {
	cout << " not implemented " << endl;
	return;
      }
    }    
    vector<double> thisXSset;
    for (int iXS = 0; iXS < nXS; iXS++) {
      thisXSset.push_back(centralValueXS[iXS]);
      for (int iError = 0; iError < nErrors; iError++) {
	// first enter correlations into error smearings
	if (errorScaleZW100percCorr && iXS == 3 && iError == 1) {
	  thisErrorSmearing[nErrors*iXS+iError] = thisErrorSmearing[nErrors*(iXS-1)+iError];
	} 
	if (errorPdfOnlyProc100percCorr) {
	  if (iXS == 4 && iError == 0) {
	    thisErrorSmearing[nErrors*iXS+iError] = thisErrorSmearing[nErrors*0+iError];
	  }
	  if ((iXS == 2 || iXS == 3)&& iError == 0) {
	    thisErrorSmearing[nErrors*iXS+iError] = thisErrorSmearing[nErrors*(iXS-1)+iError];
	  }
	} else if (errorPdf100percCorr) {
	  if (iXS > 0 && iError == 0) {
	    thisErrorSmearing[nErrors*iXS+iError] = thisErrorSmearing[nErrors*(iXS-1)+iError];
	  }
	}
       	// then apply error smearings
	if (error100percCorr) {
	  thisXSset[iXS] += upperRelError[iXS][iError]*thisXSset[iXS]*thisErrorSmearing[0];
	} else {
	  if (thisErrorSmearing[nErrors*iXS+iError] > 0.) {
	    thisXSset[iXS] += upperRelError[iXS][iError]*thisXSset[iXS]*thisErrorSmearing[nErrors*iXS+iError];
	  } else {
	    thisXSset[iXS] += lowerRelError[iXS][iError]*thisXSset[iXS]*thisErrorSmearing[nErrors*iXS+iError];
	  }
	}
      }
    }
    toyXSset.push_back(thisXSset);
  }
    
  cout << "Calculated the toys, now calculate the covariance matrix..." << endl;

  for (int iXS = 0; iXS < nXS; iXS++) {
    // calculate E[iXS]
    double meanXSI = 0;
    for (int iToy = 0; iToy < nToys; iToy++) {
      meanXSI += toyXSset[iToy][iXS];
    }
    meanXSI = meanXSI/(double)nToys;
    for (int jXS = 0; jXS < nXS; jXS++) {
      double meanXSJ = 0;
      double meanXSIJ = 0;
      for (int iToy = 0; iToy < nToys; iToy++) {
	meanXSJ  += toyXSset[iToy][jXS];
	meanXSIJ += toyXSset[iToy][jXS]*toyXSset[iToy][iXS];
      }
      meanXSJ  = meanXSJ/(double)nToys;
      meanXSIJ = meanXSIJ/(double)nToys;
      covarianceMatrixXS[iXS][jXS] = meanXSIJ - meanXSI*meanXSJ;
    }
  }
  

  cout << "#---------------------------------------------------------------"<< endl;
  cout << "Covariance matrix for the XS:\n" << endl;
 
  for (int iXS = 0; iXS < nXS; iXS++) {
    for (int jXS = 0; jXS < nXS; jXS++) {
      cout << " " << covarianceMatrixXS[iXS][jXS];
    }    
    cout << endl;
  }
  cout << "#---------------------------------------------------------------"<< endl;
  cout << "Covariance matrix for the XS with relative errors:" << endl;
  cout << "(to be used in HiggsSignals under the name XScov.in or XScovSM.in)\n" << endl;
  for (int iXS = 0; iXS < nXS; iXS++) {
    for (int jXS = 0; jXS < nXS; jXS++) {
      cout << " " << covarianceMatrixXS[iXS][jXS]/(centralValueXS[iXS]*centralValueXS[jXS]);
    }    
    cout << endl;
  }

  cout << "\nCorrelation matrix for the XS:\n" << endl;

  for (int iXS = 0; iXS < nXS; iXS++) {
    for (int jXS = 0; jXS < nXS; jXS++) {
      cout << " " << covarianceMatrixXS[iXS][jXS]/
	TMath::Sqrt(covarianceMatrixXS[iXS][iXS]*covarianceMatrixXS[jXS][jXS]);
    }    
    cout << endl;
  }

  cout << "#---------------------------------------------------------------"<< endl;


 cout << "comparison quantities:" << endl;
 cout << "relative error on sigma(ggH)/fb = " <<
   TMath::Sqrt(covarianceMatrixXS[0][0]/(centralValueXS[0]*centralValueXS[0])) << endl;
 cout << "relative error on sigma(VBF)/fb = " <<
   TMath::Sqrt(covarianceMatrixXS[1][1]/(centralValueXS[1]*centralValueXS[1])) << endl;
 cout << "relative error on sigma(WH)/fb  = " <<
   TMath::Sqrt(covarianceMatrixXS[2][2]/(centralValueXS[2]*centralValueXS[2])) << endl;
 cout << "relative error on sigma(ZH)/fb  = " <<
   TMath::Sqrt(covarianceMatrixXS[3][3]/(centralValueXS[3]*centralValueXS[3])) << endl;
 cout << "relative error on sigma(ttH)/fb = " <<
   TMath::Sqrt(covarianceMatrixXS[4][4]/(centralValueXS[4]*centralValueXS[4])) << endl;
   
  return;

}
