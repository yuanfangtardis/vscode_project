#!/usr/bin/env python



"""
.. module:: Example
   :synopsis: Basic main file example for using SModelS.
   
   This file must be run under the installation folder.

"""

""" Import basic functions (this file must be executed in the installation folder) """

from smodels.theory import slhaDecomposer
from smodels.theory import lheDecomposer
from smodels.tools.physicsUnits import fb, GeV
from smodels.theory.theoryPrediction import theoryPredictionsFor
from smodels.experiment.databaseObj import Database

# Set the path to the database folder
database = Database("./smodels-database/")

def main():
    """
    Main program. Displays basic use case.

    """
    
    # Path to input file (either a SLHA or LHE file)
    slhafile = 'inputFiles/slha/lightEWinos.slha'
    # lhefile = 'inputFiles/lhe/gluino_squarks.lhe'

    # Set main options for decomposition
    sigmacut = 0.3 * fb
    mingap = 5. * GeV

    # Decompose model (use slhaDecomposer for SLHA input or lheDecomposer for LHE input)
    toplist = slhaDecomposer.decompose(slhafile, sigmacut, doCompress=True, doInvisible=True, minmassgap=mingap)
    # toplist = lheDecomposer.decompose(lhefile, doCompress=True,doInvisible=True, minmassgap=mingap)
    
    # Access basic information from decomposition, using the topology list and topology objects:
    print "\n Decomposition Results: "
    print "\t  Total number of topologies: %i " %len(toplist)
    nel = sum([len(top.elementList) for top in toplist])
    print "\t  Total number of elements = %i " %nel    
    #Print information about the m-th topology:
    m = 3
    top = toplist[m]
    print "\t\t %i-th topology  = " %m,top,"with total cross section =",top.getTotalWeight()
    #Print information about the n-th element in the m-th topology:
    n = 0
    el = top.elementList[n]
    print "\t\t %i-th element from %i-th topology  = " %(n,m),el,
    print "\n\t\t\twith cross section =",el.weight,"\n\t\t\tand masses = ",el.getMasses() 
            
    # Load the experimental results to be used.
    # In this case, all results are employed.
    listOfExpRes = database.getExpResults()

    # Print basic information about the results loaded.
    # Count the number of loaded UL and EM experimental results:
    nUL, nEM = 0, 0
    for exp in listOfExpRes:
        expType = exp.getValuesFor('dataType')[0]
        if expType == 'upperLimit':
            nUL += 1
        elif  expType == 'efficiencyMap':
            nEM += 1
    print "\n Loaded Database with %i UL results and %i EM results " %(nUL,nEM)


    # Compute the theory predictions for each experimental result and print them:
    print("\n Theory Predictions and Constraints:")
    rmax = 0.
    bestResult = None
    for expResult in listOfExpRes:
        predictions = theoryPredictionsFor(expResult, toplist)
        if not predictions: continue # Skip if there are no constraints from this result
        print('\n %s ' %expResult.globalInfo.id)
        for theoryPrediction in predictions:
            dataset = theoryPrediction.dataset
            datasetID = dataset.dataInfo.dataId            
            mass = theoryPrediction.mass
            txnames = [str(txname) for txname in theoryPrediction.txnames]
            PIDs =  theoryPrediction.PIDs         
            print "------------------------"
            print "Dataset = ",datasetID   #Analysis name
            print "TxNames = ",txnames   
            print "Prediction Mass = ",mass    #Value for average cluster mass (average mass of the elements in cluster)
            print "Prediction PIDs = ",PIDs    #Value for average cluster mass (average mass of the elements in cluster)
            print "Theory Prediction = ",theoryPrediction.xsection   #Signal cross section
            print "Condition Violation = ",theoryPrediction.conditions  #Condition violation values
              
            # Get the corresponding upper limit:
            ul = expResult.getUpperLimitFor(txname=txnames[0],mass=mass,dataID=datasetID)                     
            print "UL for theory prediction = ",ul

            # Compute the r-value
            r = theoryPrediction.xsection.value/ul
            print "r = ",r
            if r > rmax:
                rmax = r
                bestResult = expResult.globalInfo.id
            
    # Print the most constraining experimental result
    print "\nThe largest r-value (theory/upper limit ratio) is ",rmax
    if rmax > 1.:
        print "(The input model is likely excluded by %s)" %bestResult
    else:
        print "(The input model is not excluded by the simplified model results)"
      
    


if __name__ == '__main__':
    main()
