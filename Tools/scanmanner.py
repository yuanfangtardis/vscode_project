#########################################################################
#                                                                       #
#    Statistical funtions                                               #
#                                                                       #
#########################################################################

## External modules.
import os,sys
from random import random,gauss
from math import exp
## Internal modules.
import subfun as sf
import json

def readrun(LogLikelihood,Prior,n_dims,n_params,inpar,bin_num,n_print,outputfiles_basename,outputfiles_filename):
    #print "readrun() in scanmanner.py 01llllllll"
    #print outputfiles_basename,outputfiles_filename
    f_out = open(os.path.join(outputfiles_basename,outputfiles_filename),'w')
    import manfun as mf 
    Ploter = mf.plot() 
    Ploter.setPlotPar(outputfiles_basename)

    for i,name in enumerate(inpar):
      try:
        Ploter._data[name]
      except:
        sf.ErrorStop('Input parameter "%s" could not found in ScanInf.txt.'%name)
 
    for i,name in enumerate(inpar):
      ntotal = len(Ploter._data[name])
      break

    cube = []
    for i in range(n_params): cube.append(0)

    sf.Info('Begin read scan ...')
    
    Naccept = 0

    for Nrun in range(ntotal):
        iner = Nrun
        for i,name in enumerate(inpar):
            cube[i] = Ploter._data[name][iner]
        
        loglike = LogLikelihood(cube, n_dims, n_params)
        #if loglike > sf.log_zero:
        if True:
            Naccept += 1
            f_out.write('\t'.join([str(x) for x in cube])+'\t'+str(loglike)+'\n')
            f_out.flush()

        if (Nrun+1)%n_print == 0:
            print '------------ Num: %i ------------'%(Nrun+1)
            print 'Input    par   = '+str(cube[0:n_dims])
            print 'Output   par   = '+str(cube[n_dims:n_params])
            print '     loglike   = '+str(loglike)
            print 'Accepted Num   = '+str(Naccept)
            print 'Total    Num   = '+str(Nrun+1)

def gridrun(LogLikelihood,Prior,n_dims,n_params,inpar,bin_num,n_print,outputfiles_basename,outputfiles_filename):
    f_out = open(os.path.join(outputfiles_basename,outputfiles_filename),'w')

    print "llllllllllllllllllllllllllllllllllllllllllllllllllllllllll"
    print outputfiles_basename
    print outputfiles_filename
    print "n_dims", n_dims
    print "n_params", n_params
    
    ntotal = 1
    cube = []
    interval = {}
    for i,name in enumerate(inpar):
        print "01lllllllllllllllllllllllllllllllllllllllllllllllllll"
        print i, name
        interval[name] = 1.0 / bin_num[name]
        bin_num[name] += 1
        ntotal     *= bin_num[name]
    for i in range(n_params): cube.append(0)

    sf.Info('Begin grid scan ...')
    
    Naccept = 0

    for Nrun in range(ntotal):
        iner = 1
        for i,name in enumerate(inpar):
            print "01lllllllllllllllllllllllllllllllllllllllllllllllllll"
            print i,name
            cube[i] = ( int(Nrun/iner) )%bin_num[name] * interval[name]
            print "Nrun", Nrun
            print "iner", iner
            print int(Nrun/iner) 
            print "bin_num", bin_num[name]
            print ( int(Nrun/iner) )%bin_num[name] 
            print "interval", interval[name]
            print ( int(Nrun/iner) )%bin_num[name] * interval[name]
            print cube[i] 
            iner   *= bin_num[name]
       
        Prior(cube, n_dims, n_params)
        #raw_input()
        #continue 
        loglike = LogLikelihood(cube, n_dims, n_params)
        if loglike > sf.log_zero:
            Naccept += 1
            f_out.write('\t'.join([str(x) for x in cube])+'\t'+str(loglike)+'\n')
            f_out.flush()

        if (Nrun+1)%n_print == 0:
            print '------------ Num: %i ------------'%(Nrun+1)
            print 'Input    par   = '+str(cube[0:n_dims])
            print 'Output   par   = '+str(cube[n_dims:n_params])
            print '     loglike   = '+str(loglike)
            print 'Accepted Num   = '+str(Naccept)
            print 'Total    Num   = '+str(Nrun+1)



def randomrun(LogLikelihood,Prior,n_dims,n_params,n_live_points,n_print,outputfiles_basename,outputfiles_filename):
    f_out = open(os.path.join(outputfiles_basename,outputfiles_filename),'w')
    
    cube = []
    for i in range(n_params): cube.append(0.0)
    # Initialise the cube

    sf.Info('Begin random scan ...')
    Naccept = 0
    for Nrun in range(n_live_points) :
        for j in range(n_dims):
            cube[j] = random()
        
        Prior(cube, n_dims, n_params)
        loglike = LogLikelihood(cube, n_dims, n_params)
        if loglike > sf.log_zero:
            Naccept += 1
            f_out.write('\t'.join([str(x) for x in cube])+'\t'+str(loglike)+'\n')
            f_out.flush()
        if (Nrun+1)%n_print == 0:
            print '------------ Num: %i ------------'%(Nrun+1)
            print 'Input    par   = '+str(cube[0:n_dims])
            print 'Output   par   = '+str(cube[n_dims:n_params])
            print '     loglike   = '+str(loglike)
            print 'Accepted Num   = '+str(Naccept)
            print 'Total    Num   = '+str(Nrun+1)


def mcmcrun(LogLikelihood,Prior,n_dims,n_params,n_live_points,inpar,outpar,StepSize,AccepRate,FalgTune,InitVal,n_print,outputfiles_basename,outputfiles_filename):
    f_out = open(os.path.join(outputfiles_basename,outputfiles_filename),'w')
    f_out2 = open(os.path.join(outputfiles_basename,'All_'+outputfiles_filename),'w')

    # Initialise the cube
    cube = []
    for i in range(n_params):
        cube.append(0)

    covar = [] # the sigma of gauss distribution, normalized to 1
    par  = []  # test par, normalized to 1
    CurPar=[]  # current par, normalized to 1 
    for i,name in enumerate(inpar):
        covar.append(StepSize[name])
        cube[i] = InitVal[name]
        
        par.append(cube[i])
        CurPar.append( cube[i] )
    n_init = 0
    print 'mcmc: InitVal=',InitVal
    a=raw_input('yuanfng in mcmc InitVal')
    
    while True:
        Prior(cube, n_dims, n_params) # normalized to cube to real value
        loglike = LogLikelihood(cube, n_dims, n_params)
        if loglike > sf.log_zero / 2.0 : break
        if n_init == 0 : 
            sf.WarningNoWait('The initial point is unphysical, it will find the physical initial points randmly.')
            n_init = n_init +1
        if n_init>100:
            sf.ErrorStop('Can not find physical initial points with 100 tries.')
        for i in range(n_dims):
            cube[i] = random()
            CurPar[i] = cube[i]

    CurObs=[]
    CurChisq = - 2.0 * loglike
    for i in range(n_params): CurObs.append( cube[i] )
    print '------------ Start Point ------------'
    for i,name in enumerate(inpar):
       print 'Input  - %s = %s '%(name,cube[i])
    for i,name in enumerate(outpar):
       print 'Output - %s = %s '%(name,cube[i+n_dims])
    print '.................................'
    print 'Current  Chi^2 = '+str(CurChisq)

    # Initialize the MCMC parameters
    MinChisq = CurChisq
    Chisq = CurChisq
    Nrun= 0
    Naccept = 0
    Nout=0
    mult = 1
    kcovar = 0 
    while Naccept < n_live_points:

        Nrun += 1
        RangeFlag = True
        for j in range(n_dims):
            rd = random()
            par[j] = gauss(CurPar[j],exp(kcovar)*covar[j]) # normalized to 1 
            #par[j] = CurPar[j] + covar[j] * (0.5-rd)*2
        if max(par)>1 or min(par)<0 :
            RangeFlag = False
            Nout = Nout +1
            if Nout%100 == 0: 
                sf.WarningNoWait("Too many points out of range!")
        else:
            Nout=0
            for i in range(n_dims): cube[i] = par[i]
            Prior(cube, n_dims, n_params)
            loglike = LogLikelihood(cube, n_dims, n_params)
            Chisq = - 2.0 * loglike

        Flag_accept = RangeFlag and (Chisq < CurChisq + 20) 
        if Flag_accept: 
            if CurChisq > Chisq: 
                Flag_accept = True
            else:
                Flag_accept = random() < exp(CurChisq-Chisq) 

        if Flag_accept :
            f_out.write('\t'.join([str(x) for x in CurObs])+'\t'+str(-2*CurChisq)+'\t'+str(mult)+'\n')
            f_out.flush()
            CurChisq = Chisq
            for i in range(n_params): CurObs[i]   = cube[i]
            for i in range(n_dims):   CurPar[i]   = par[i]
            
            if Chisq < MinChisq : MinChisq = Chisq
            Naccept += 1
            mult = 1
        else:
            mult +=1

        AccRat = float(Naccept)/float(Nrun)

        if FalgTune and Nrun < 1000: kcovar = kcovar + 1.0/(float(Nrun)**0.7)*(AccRat - AccepRate)
        else: kcovar =1

        if Nrun%n_print == 0:
            print '------------ Num: %i ------------'%Nrun
            for i,name in enumerate(inpar):
                print 'Input  - %s = %s '%(name,cube[i])
            if (Chisq < - 2.0 * sf.log_zero) and RangeFlag:
                print '.................................'
                for i,name in enumerate(outpar):
                    print 'Output - %s = %s '%(name,cube[i+n_dims])
                print '.................................'
                print 'Test     Chi^2 = '+str(Chisq)
            print 'Current  Chi^2 = '+str(CurChisq)
            print 'Mimimum  Chi^2 = '+str(MinChisq)
            print 'Accepted Num  = '+str(Naccept)
            print 'Total    Num   = '+str(Nrun)
            print 'Accepted Ratio = '+str(AccRat)
            if FalgTune :
                print 'StepZize factor= '+str(exp(kcovar))

        if RangeFlag and (Chisq < - 2.0 * sf.log_zero) :
            f_out2.write('\t'.join([str(x) for x in CurObs])+'\t'+str(-2*CurChisq)+'\t'+str(mult)+'\n')
            f_out2.flush()

# yuanfang added in 11.7 
def multinestrun(LogLikelihood,my_prior,n_dims,ES,n_params,**kwargs):


    '''
    Author: yuanfang
    Data: 2017.11.17 
    Run multinest
    ''' 
    yy=raw_input('running in yuanfang multinest function...')
#initialize the cube
    cube=[0.0]*n_params
            
    # def my_prior(cube,ndim,n_params):
    #     ''' 
    #     generate prior for multinest algorithm
    #     return cube whose 1~n_dim is the input parameter
    #     2017.11.19 
    #     '''

    #     for i,name in enumerate(ES.InPar):
    #         if ES.InputPar[name][1].lower() == 'flat':
    #             min = float(ES.InputPar[name][2])
    #             max = float(ES.InputPar[name][3])
    #             cube[i] = random() * (max - min) + min 
    #         elif ES.InputPar[name][1].lower() == 'log':
    #             import math
    #             min = math.log10(float(ES.InputPar[name][2]))
    #             max = math.log10(float(ES.InputPar[name][3]))
    #             cube[i] = 10.0**(random()*(max - min) + min )
    #         else:
    #             sf.ErrorStop( 'Not ready. Only "flat" and "log" prior can be used.' )
            
                    
    import pymultinest
    pymultinest.run(
        LogLikelihood        = LogLikelihood,  
        Prior                = my_prior,
        n_dims               = len(ES.InPar),
        n_params             = n_params,
        seed                 = ES.getRandomSeed(),
        outputfiles_basename = ES.MNOutputFile,
        n_live_points        = kwargs.pop('n_live_points',2*n_dims),
        n_clustering_params  = kwargs.pop('n_clustering_params',2),
        multimodal           = kwargs.pop('multimodal',True),
        const_efficiency_mode= kwargs.pop('const_efficiency_mode', False), # set to false by default 
        evidence_tolerance   = kwargs.pop('evidence_tolerance',1), 
        sampling_efficiency  = kwargs.pop('sampling_efficiency',1),
        n_iter_before_update = kwargs.pop('n_iter_before_update',ES.getPointNum()),
        null_log_evidence    = kwargs.pop('null_log_evidence',-1e+100),
        max_modes            = kwargs.pop('max_modes',5),
        verbose              = kwargs.pop('verbose',True),
        resume               = kwargs.pop('resume',False),  # !!!!!!!!
        context              = kwargs.pop('context',0),
        importance_nested_sampling = kwargs.pop('importance_nested_sampling',True)
    )
                
    json.dump(ES.InPar, open(ES.MNOutputFile+'input.json', 'w')) # save parameter names


def PolyChordrun(LogLikelihood,n_dims,n_params,**kwargs):
    """
    Function author: yuanfang
      PolyChord settings

      For full details of nested sampling and PolyChord, please refer to:
      arxiv:1506.00171[astro-ph.IM], 0809.34371[astro-ph]
           

    Parameters
    ----------
    nDims: int
        Dimensionality of the model, i.e. the number of physical parameters.

    nDerived: int
        The number of derived parameters (can be 0).


    Keyword arguments
    -----------------
    nlive: int
        (Default: nDims*25)
        The number of live points.
        Increasing nlive increases the accuracy of posteriors and evidences,
        and proportionally increases runtime ~ O(nlive).

    num_repeats : int
        (Default: nDims*5)
        The number of slice slice-sampling steps to generate a new point.
        Increasing num_repeats increases the reliability of the algorithm.
        Typically
        * for reliable evidences need num_repeats ~ O(5*nDims).
        * for reliable posteriors need num_repeats ~ O(nDims)

    nprior : int
        (Default: nlive)
        The number of prior samples to draw before starting compression.

    do_clustering : boolean
        (Default: True)
        Whether or not to use clustering at run time.

    feedback : {0,1,2,3}
        (Default: 1)
        How much command line feedback to give
        # Degree of feedback to provide
        #-1 | nothing
        # 0 | just header and tail
        # 1 | run time evidences and clustering information
        # 2 | fancy output
        # 3 | verbose

    precision_criterion : float
        (Default: 0.001)
        Termination criterion. Nested sampling terminates when the evidence
        contained in the live points is precision_criterion fraction of the
        total evidence.

    max_ndead : int
        (Default: -1)
        Alternative termination criterion. Stop after max_ndead iterations.
        Set negative to ignore (default).

    boost_posterior : float
        (Default: 0.0)
        Increase the number of posterior samples produced.  This can be set
        arbitrarily high, but you won't be able to boost by more than
        num_repeats
        Warning: in high dimensions PolyChord produces _a lot_ of posterior
        samples. You probably don't need to change this

    posteriors : boolean
        (Default: True)
        Produce (weighted) posterior samples. Stored in <root>.txt.

    equals : boolean
        (Default: True)
        Produce (equally weighted) posterior samples. Stored in
        <root>_equal_weights.txt

    cluster_posteriors : boolean
        (Default: True)
        Produce posterior files for each cluster?
        Does nothing if do_clustering=False.

    write_resume : boolean
        (Default: True)
        Create a resume file.

    read_resume : boolean
        (Default: True)
        Read from resume file.

    write_stats : boolean
        (Default: True)
        Write an evidence statistics file.

    write_live : boolean
        (Default: True)
        Write a live points file.

    write_dead : boolean
        (Default: True)
        Write a dead points file.

    write_dead : boolean
        (Default: True)
        Write a prior points file.

    update_files : int
        (Default: nlive)
        How often to update the files in <base_dir>.

    base_dir : string
        (Default: 'chains')
        Where to store output files.

    file_root : string
        (Default: 'test')
        Root name of the files produced.

    grade_frac : List[float]
        (Default: 1)
        The amount of time to spend in each speed.

    grade_dims : List[int]
        (Default: 1)
        The number of parameters within each speed.
    """    

    try:
        import math
        from numpy import pi, log, sqrt
        import PyPolyChord
        from PyPolyChord.settings import PolyChordSettings
        from PyPolyChord.priors import UniformPrior
    except ImportError:
        print("INFO(Scanner):PyPolyChord module import error.exit...")
        sys.exit() 
    

    # pass settings to  polychord
    nDerived=n_params-n_dims
    settings = PolyChordSettings(n_dims, nDerived)
    # settings.nlive = kwargs.pop('nlive', n_dims*25)
    settings.nlive = kwargs.pop('n_live_points', n_dims*25)
    # settings.num_repeats = kwargs.pop('num_repeats', n_dims*5)
    settings.num_repeats = kwargs.pop('num_repeats', n_dims*2) # proposed by polychord eggbox
    settings.nprior = kwargs.pop('nprior', -1)
    settings.do_clustering = kwargs.pop('do_clustering', True)
    settings.feedback = kwargs.pop('feedback', 1)
    settings.precision_criterion = kwargs.pop('precision_criterion', 0.001)
    settings.max_ndead = kwargs.pop('max_ndead', -1)
    settings.boost_posterior = kwargs.pop('boost_posterior', 0.0)
    settings.posteriors = kwargs.pop('posteriors', True)
    settings.equals = kwargs.pop('equals', True)
    settings.cluster_posteriors = kwargs.pop('cluster_posteriors', True)
    settings.write_resume = kwargs.pop('write_resume', True)
    settings.write_paramnames = kwargs.pop('write_paramnames', False)
    settings.read_resume = kwargs.pop('read_resume', True)
    settings.write_stats = kwargs.pop('write_stats', True)
    settings.write_live = kwargs.pop('write_live', True)
    settings.write_dead = kwargs.pop('write_dead', True)
    settings.write_prior = kwargs.pop('write_prior', True)
    settings.update_files = kwargs.pop('update_files', settings.nlive)
    settings.base_dir = kwargs.pop('base_dir', 'chains')
    settings.file_root = kwargs.pop('file_root', 'test')
    settings.grade_dims = kwargs.pop('grade_dims', [n_dims])
    settings.max_ndead=kwargs.pop('max_ndead ',-1)
    ES=kwargs.pop('ES')
    # settings.grade_frac = kwargs.pop('grade_frac', [1.0]*len(self.grade_dims))

    if kwargs:
        raise TypeError('Unexpected **kwargs in Contours constructor: %r' % kwargs)
    
    # to speed up, set do_clustring = false
    # settings.do_clustering=False 

    def my_prior(hypercube):
        ''' 
        theta: the hypercube for input parameters
        len(theta)=n_dims    
        Get the phiscal parameters from hypercube
        '''
        
        theta=[0.0]*n_dims
        for i,name in enumerate(ES.InPar):
            if ES.InputPar[name][1].lower() == 'flat':
                min = float(ES.InputPar[name][2])
                max = float(ES.InputPar[name][3])
                theta[i] = hypercube[i] * (max - min) + min 
            elif ES.InputPar[name][1].lower() == 'log':
                min = math.log10(float(ES.InputPar[name][2]))
                max = math.log10(float(ES.InputPar[name][3]))
                theta[i] = 10.0**(hypercube[i]*(max - min) + min )
            else:
                sf.ErrorStop( 'Not ready. Only "flat" and "log" prior can be used.' )
#        print 'my_prior: theta=',theta
        return theta
    
    def my_Loglikelihood(theta):
        phi=[0.0]*nDerived
        derived=[0.0]*nDerived
        theta.extend(derived)
        cube=theta
        logL=LogLikelihood(cube,n_dims,n_params)
        # print 'my_Loglikelihood after log',cube
        phi=cube[n_dims:]
#        print 'my loglikelihood: phi=',phi
#        print 'my log likelihood: LogL=',logL
        return logL,phi

        
    output = PyPolyChord.run_polychord(my_Loglikelihood, n_dims, nDerived, settings, my_prior)
#    print 'output type:',type(output)
    
    
        



            
        
        










