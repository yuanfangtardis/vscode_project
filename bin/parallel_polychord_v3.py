#! /usr/bin/env python
# standard alone program to parallelly run polychord alone
# yuanfang 
# usage example for parallel: mpiexec -n 4 python parallel_polychord_2.py yf_polychord_test.ini
import os,sys
sys.path.append(os.path.join(os.path.split(os.path.split(os.path.realpath(__file__))[0])[0], "Tools"))
import manfun as mf
import readin
import PyPolyChord
from scanmanner import PolyChordrun
from mpi4py import MPI 
import subprocess
import subfun as sf
# from mpi4py import MPI

comm=MPI.COMM_WORLD
rank=comm.Get_rank()
print 'rank=',rank

# # common_object=dict()
# common_object['ES']       = mf.EasyScanInput()
# common_object['Programs'] ={}
# common_object['CS']       = mf.constraint()
# common_object['Ploter']   = mf.plot()
# common_object['ProgID']   = readin.ReadIn(sys.argv[1],common_object['ES'],common_object['Programs'],common_object['CS'],common_object['Ploter'])
# print 'Broad Casting ...'
# comm.bcast(common_object,root=0)

# define basic class object
ES       = mf.EasyScanInput()
Programs ={}
CS       = mf.constraint()
Ploter   = mf.plot()
ProgID   = readin.ReadIn(sys.argv[1],ES,Programs,CS,Ploter)
log_zero=-1e+100
print 'main: programs=',Programs
print 'main:ProgID=',ProgID
def LogLikelihood(cube, ndim, nparams):
    for i,name in enumerate(ES.InPar) :
        ES.InPar [name]=cube[i]
        ES.AllPar[name]=cube[i]
        # Run each programs
        
    for ii in ProgID:
        if Programs[ii].getRunFlag(ES.AllPar):
            Programs[ii].WriteInputFile(ES.AllPar)
            # Programs[ii].RunProgram()
            # yuanfang new parallel method 
            Programs[ii].Parallel_RunProgram(rank)
            # Phy = Programs[ii].ReadOutputFile(ES.AllPar,ES.getFileName())
            Phy=Programs[ii].parallel_ReadOutputFile(ES.AllPar,ES.getFileName(),rank)
            print 'Phy=',Phy
            
        else:
            #set output parameters' value to nan
            Phy = Programs[ii].SetOutput(ES.AllPar)
        # if the point is unphysical, return log(0)
        # print  'ES.AllPar=',ES.AllPar
        # print '**************yuanfang break detect 10****************'
        if not Phy :
            return log_zero
    
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
    # print 'output chisq from rank ',rank 
    #  print 'INFO: mychisq=',mychisq
    
    return - CS.getChisq(ES.AllPar)/2.0


print 'ES.getFileName()=',ES.getFileName()             
Result_dir = ES.getFileName()+'/PolyChordData'

ResultFile=Result_dir+'/test_phys_live.txt'
print 'nlive_points=',ES.getPointNum()
    
PolyChordrun(LogLikelihood=LogLikelihood,
    n_dims=len(ES.InPar),
    n_params=len(ES.AllPar),
    n_live_points=ES.getPointNum(),
    ES=ES,
    precision_criterion=1,
    base_dir=Result_dir,
    write_paramnames=True,
    feedback=1,
    max_ndead=1000,
    do_clustering=True)
# write scan inf
print 'writing to scaninf ...'
if rank==0:
    sf.WriteResultInf(ES.InPar,ES.OutPar,ES.getFileName(),ResultFile,ES.getScanMethod())