#########################################################################
#                                                                       #
#    Read in the input configure file                                   #
#                                                                       #
#########################################################################
import manfun as mf
import subfun as sf
import ConfigParser


def ReadIn(Configfile,ES,Programs,CS,Ploter):
    cf=ConfigParser.ConfigParser()
    cf.read(Configfile)

    ## Read the basic scan parameters
    try:
        ES.setScanMethod(cf.get(       'scan', 'Scan method'))
    except ConfigParser.NoOptionError:
        sf.WarningWait('Can not find "Scan method" in the input configure file, it will take the default value, "Random".')

    try:
        if ES.getScanMethod()=='PolyChord'.upper():   # yuanfang  modified for parallel polychord
            # from random import random
            ES.setFileName  (cf.get(       'scan', 'Result file name'))
        else:
            ES.setFileName  (cf.get(       'scan', 'Result file name'))
    except ConfigParser.NoOptionError:
        sf.ErrorStop('Please provide "Result file name" in the input configure file.')

    ## If the scan method is 'plot', go directly to the 'plot' section
    ## Read the plot information
    plot_items  = cf.options("plot")
    if 'histogram' in plot_items:
        Ploter.setHistogram(cf.get('plot', 'Histogram'))
    if 'scatter' in plot_items:
        Ploter.setScatter(cf.get('plot', 'Scatter'))
    if 'color' in plot_items:
        Ploter.setColor(cf.get('plot', 'Color'))
    if 'contour' in plot_items:
        Ploter.setContour(cf.get('plot', 'Contour'))
    if ES.getScanMethod() == 'PLOT': return float('nan')

    ## Back to Read the basic scan parameters
    try:
        ES.setPointNum  (cf.getint(    'scan', 'Points number'))
    except ConfigParser.NoOptionError:
        sf.WarningWait('Can not find "Points number" in the input configure file, it will take the default value, 100.')
    except ValueError:
        sf.ErrorStop('The "Points number" in the input configure file must be an integer.')

    try:
        ES.setRandomSeed(cf.getint(    'scan', 'Random seed'))
    except ConfigParser.NoOptionError:
        sf.WarningWait('Can not find "Random seed" in the input configure file, it will take current system time as ramdom seed.')
    except ValueError:
        sf.ErrorStop('The "Random seed" in the input configure file must be an integer.')


    try:
        ES.setPrintNum  (cf.getint(    'scan', 'Interval of print'))
    except ConfigParser.NoOptionError:
        sf.WarningNoWait('Can not find "Interval of print" in the input configure file, it will take the default value, 1.')
    except ValueError:
        sf.WarningNoWait('The "Interval of print" in the input configure file must be an integer, it will take the default value, 1.')

    try:
        ES.setInputPar  (cf.get(       'scan', 'Input parametes'))
    except ConfigParser.NoOptionError:
        sf.ErrorStop('Can not find "Input parametes" in the input configure file.')

    try:
        ES.setAccepRate (cf.get(       'scan', 'Acceptance rate'))
    except ConfigParser.NoOptionError:
        pass

    ## Read the program(s) setting
    ProgID=filter(lambda x: x.startswith('program'), cf.sections())
    ProgID.sort(key=lambda x: int(filter(str.isdigit, x)) )
    for ii in ProgID:
        items  = cf.options(ii)
        fullitems = ['program name', 'execute command', 'command path', 'input file', 'input variable', 'output file', 'output variable']
        for jj in fullitems:
            if not jj in items:
                sf.ErrorStop('For "%s", item "%s" missed.'%(ii,jj))
        Programs[ii] = mf.program()
        Programs[ii].setProgName  (cf.get(ii, 'Program name'))
        Programs[ii].setCommand   (cf.get(ii, 'Execute command'))
        Programs[ii].setComPath   (cf.get(ii, 'Command path'))
        Programs[ii].setInputFile (cf.get(ii, 'Input file'))
        Programs[ii].setInputVar  (cf.get(ii, 'Input variable'))
        Programs[ii].setOutputFile(cf.get(ii, 'Output file'))
        Programs[ii].setOutputVar (cf.get(ii, 'Output variable'))
        try:
            Programs[ii].setRunFlag(cf.get(ii, 'Run flag'))
        except:
           sf.Info('No Run flag.')

    ## manage the vars
#    ES.setProgID(ProgID)
    ES.setProgram(Programs)

    ## Read the constraints
    constraint_items  = cf.options("constraint")
    sf.Info('...............................................')
    sf.Info('...............................................')
    sf.Debug('constraint_items',constraint_items)
    if 'gaussian' in constraint_items:
        CS.setGaussian(cf.get('constraint', 'Gaussian'))

    if 'limit' in constraint_items:
        CS.setLimit(cf.get('constraint', 'Limit'))
    if 'chi^2' in constraint_items:
        CS.setLoglike(cf.get('constraint', 'chi^2'))






    return ProgID
























