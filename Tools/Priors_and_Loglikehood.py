#! /usr/bin/env python
# logarithm of likelihood function
## External modules.
import os,sys,math
sys.path.append(os.path.join(os.path.split(os.path.split(os.path.realpath(__file__))[0])[0], "Tools"))
## Internal modules.
from my_globals import *

ES=easy_globals['ES']
Programs=easy_globals['Programs']
CS=easy_globals['CS']
Ploter=easy_globals['Ploter']
parallel_flag=easy_globals['parallel_flag']
ProgID=easy_globals['ProgID']


def LogLikelihood(cube, ndim, nparams):
    # pass the input value from cube to InPar
    for i,name in enumerate(ES.InPar) :
        ES.InPar [name]=cube[i]
        ES.AllPar[name]=cube[i]
    # Run each programs
    for ii in ProgID:
        if Programs[ii].getRunFlag(ES.AllPar):
            Programs[ii].WriteInputFile(ES.AllPar)
            Programs[ii].RunProgram()
            Phy = Programs[ii].ReadOutputFile(ES.AllPar,ES.getFileName())
        else:
            Phy = Programs[ii].SetOutput(ES.AllPar)
        # if the point is unphysical, return log(0)
        if not Phy :
            return sf.log_zero
    
    # if physical, pass parametrs to cube
    for i,name in enumerate(ES.OutPar):
# yuanfang modified in 11.6
        if ES.getScanMethod() == 'MULTINEST' or 'PolyChord'.upper():
            try:
                float(ES.AllPar[name])
            except:
                cube[i+ndim]=0.0
                continue 
        cube[i+ndim]   = ES.AllPar[name]
        
    mychisq=- CS.getChisq(ES.AllPar)/2.0
    # yy=raw_input('my chisq')
    print 'INFO: loglikelihood: mychisq=',mychisq
    # yy=raw_input("yy to find same end...")
    # if(mychisq > -20.0):
    #     sys.exit('reached the desired chisq,exit...')
    return - CS.getChisq(ES.AllPar)/2.0


def Prior(cube, ndim, nparams):
    # print 'prior1 cube='
    # for i in range(nparams):
    #     print 'cube[%i]=%f'%(i,cube[i])
    # a=raw_input('yuanfang in Prior in easyscan.py')

    for i,name in enumerate(ES.InPar):
        if ES.InputPar[name][1].lower() == 'flat':
            min = float(ES.InputPar[name][2])
            max = float(ES.InputPar[name][3])
            cube[i] = cube[i] * (max - min) + min
            
        elif ES.InputPar[name][1].lower() == 'log':
            min = math.log10(float(ES.InputPar[name][2]))
            max = math.log10(float(ES.InputPar[name][3]))
            cube[i] = 10.0**(cube[i]*(max - min) + min )
        else:
            sf.ErrorStop( 'Not ready. Only "flat" and "log" prior can be used.' )
    # print 'prior2 cube='
    # for i in range(ndim):
    #     print 'cube[%i]=%f'%(i,cube[i])
    # a=raw_input('yuanfang in Prior in easyscan.py')
    