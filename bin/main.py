#! /usr/bin/env python2.7
# yuanfang wrote for parallel run
import os,sys,math
sys.path.append(os.path.join(os.path.split(os.path.split(os.path.realpath(__file__))[0])[0], "Tools"))
import manfun as mf
import manfun as mf
import readin
import subfun as sf
print 'easyscan argv=',sys.argv
import my_globals as mgl

# global ES,Programs,CS,Ploter,parallel,ProgID
# Define some global objetc  
ES       = mf.EasyScanInput()
Programs ={}
CS       = mf.constraint()
Ploter   = mf.plot()
parallel_flag=True
ProgID   = readin.ReadIn(sys.argv[1],ES,Programs,CS,Ploter)

mgl.easy_globals['ES']=ES
mgl.easy_globals['Programs']=Programs
mgl.easy_globals['CS']=CS
mgl.easy_globals['Ploter']=Ploter
mgl.easy_globals['parallel_flag']=parallel_flag
mgl.easy_globals['ProgID']=ProgID

print 'ES=',mgl.easy_globals

# from  easyscan import *
if ES.getScanMethod()=='PolyChord'.upper():
    Result_dir = ES.getFileName()+'/PolyChordData'
    ResultFile=Result_dir+'/test_phys_live.txt'
    print 'parallel_flag=',parallel_flag
    a=raw_input('yuanang in parallel flag...')
    if not parallel_flag:
        
        from scanmanner import PolyChordrun
        PolyChordrun(LogLikelihood=LogLikelihood,
        # Prior=Prior,
        n_dims=len(ES.InPar),
        n_params=len(ES.AllPar),
        n_live_points=ES.getPointNum(),
        ES=ES,
        precision_criterion=1,
        base_dir=Result_dir,
        write_paramnames=True,
        feedback=2,
        max_ndead=1000)
    elif parallel_flag:
        args=str(len(ES.InPar))+'  '+\
         str(len(ES.AllPar))+' '+\
         str(ES.getPointNum())+' '+\
         Result_dir+' '+' '.join(ProgID)
        # cmd='mpiexec -n 6 python ../Tools/scanmanner.py  '+args
        cmd='python ../Tools/scanmanner.py  '+args
        a=raw_input('yuanfang before cmd ...')
        print os.system('pwd')
        os.system(cmd)
        a=raw_input('yuanfang after cmd ...')


