#!/usr/bin/env python
#########################################################################
"""
       ____ ____ ____ _   _ ____ ____ ____ _  _ _  _ ____ ___
       |___ |__| [__   \_/  [__  |    |__| |\ | |__| |___ |__]
       |___ |  | ___]   |   ___] |___ |  | | \| |  | |___ |

    An Easy-to-use tool providing a comfortable way connecting programs 
    to Scan the parameter space for high energy physics(HEP) models.
        
    Author: Junjie Cao, Liangliang Shang, Jin Min Yang and Yang Zhang
    Version: Beta_1.0.1
    Date:    2016.07.28
                                                                     """
##########################################################################
global ES,Programs,CS,Ploter,parallel,ProgID

""" Scan the parameter space """
if ES.getScanMethod() == 'RANDOM':
    from scanmanner import randomrun
    ResultFile = 'RandomData.txt'
    randomrun(
        LogLikelihood        = LogLikelihood,
        Prior                = Prior,
        n_dims               = len(ES.InPar),
        n_params             = len(ES.AllPar),
        n_live_points        = ES.getPointNum(),
        n_print              = ES.getPrintNum(),
        outputfiles_basename = ES.getFileName(),
        outputfiles_filename = ResultFile )

elif ES.getScanMethod() == 'MCMC':
    from scanmanner import mcmcrun
    ResultFile = 'MCMCData.txt'
    mcmcrun(
        LogLikelihood        = LogLikelihood,
        Prior                = Prior,
        n_dims               = len(ES.InPar),
        n_params             = len(ES.AllPar),
        n_live_points        = ES.getPointNum(),
        inpar                = ES.InPar,
        outpar               = ES.OutPar,
        StepSize             = ES.getStepSize(),
        AccepRate            = ES.getAccepRate(),
        FalgTune             = ES.getFalgTuneR(),
        InitVal              = ES.getInitialValue(),
        n_print              = ES.getPrintNum(),
        outputfiles_basename = ES.getFileName(),
        outputfiles_filename = ResultFile)

elif ES.getScanMethod() == 'MULTINEST':
    import pymultinest
    from scanmanner import multinestrun
    ResultFile = 'MultiNestData/ev.dat'
    multinestrun(
        LogLikelihood        = LogLikelihood,  
        my_prior             = Prior,
        n_dims               = len(ES.InPar),
        ES                   = ES,
        n_params             = len(ES.AllPar),
        seed                 = ES.getRandomSeed(),
        outputfiles_basename = ES.MNOutputFile,
        n_live_points        = ES.getPointNum(),
        n_clustering_params        = 2,
        multimodal                 = True,
        const_efficiency_mode      = False,
        evidence_tolerance         = 1.0,
        sampling_efficiency        = 'parameter',
        n_iter_before_update       = 1,
        null_log_evidence          = -1e+90,
        max_modes                  = 5,
        verbose                    = True,
        resume                     = False, #!!!!!!!!!
        context                    = 0,
        importance_nested_sampling = True)

elif ES.getScanMethod() == 'GRID':
    from scanmanner import gridrun
    ResultFile = 'GridData.txt'
    gridrun(
        LogLikelihood        = LogLikelihood,
        Prior                = Prior,
        n_dims               = len(ES.InPar),
        n_params             = len(ES.AllPar),
        inpar                = ES.InPar,
        bin_num              = ES.GridBin,
        n_print              = ES.getPrintNum(),
        outputfiles_basename = ES.getFileName(),
        outputfiles_filename = ResultFile )

elif ES.getScanMethod() == 'READ':
    from scanmanner import readrun
    ResultFile = 'READData.txt'
    readrun(
        LogLikelihood        = LogLikelihood,
        Prior                = Prior,
        n_dims               = len(ES.InPar),
        n_params             = len(ES.AllPar),
        inpar                = ES.InPar,
        bin_num              = ES.GridBin,
        n_print              = ES.getPrintNum(),
        outputfiles_basename = ES.getFileName(),
        outputfiles_filename = ResultFile )


elif ES.getScanMethod()=='PolyChord'.upper():
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




# """ After programs run """
# print 'ResultFile=',ResultFile
# if ES.getScanMethod() != 'PLOT':
#     for ii in Programs: Programs[ii].Recover()
# sf.WriteResultInf(ES.InPar,ES.OutPar,ES.getFileName(),ResultFile,ES.getScanMethod())


# """ Plot """
# Ploter.setPlotPar(ES.getFileName())
# Ploter.getPlot()

# 

