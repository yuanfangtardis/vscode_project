#!/usr/bin/env python

"""
.. module:: txnameObj
   :synopsis: Holds the classes and methods used to read and store the
              information in the txname.txt files.
              Also contains the interpolation methods.

.. moduleauthor:: Veronika Magerl <v.magerl@gmx.at>
.. moduleauthor:: Andre Lessa <lessa.a.p@gmail.com>
.. moduleauthor:: Wolfgang Waltenberger <wolfgang.waltenberger@gmail.com>

"""

import os,sys
from smodels.tools.physicsUnits import GeV, fb, TeV, pb
from smodels.theory.particleNames import elementsInStr
from smodels.tools.stringTools import concatenateLines
from smodels.theory.element import Element
from smodels.theory.topology import TopologyList
from smodels.tools.smodelsLogging import logger
from smodels.experiment.exceptions import SModelSExperimentError as SModelSError
from smodels.tools.caching import _memoize
from scipy.linalg import svd
import scipy.spatial.qhull as qhull
import numpy as np
import unum
import copy
import math
from math import floor, log10


class TxName(object):
    """
    Holds the information related to one txname in the Txname.txt
    file (constraint, condition,...) as well as the data.
    """

    def __init__(self, path, globalObj, infoObj):
        self.path = path
        self.globalInfo = globalObj
        self._infoObj = infoObj
        self.txnameData = None
        self.txnameDataExp = None ## expected Data
        self._topologyList = TopologyList()

        logger.debug('Creating object based on txname file: %s' %self.path)
        #Open the info file and get the information:
        if not os.path.isfile(path):
            logger.error("Txname file %s not found" % path)
            raise SModelSError()
        txtFile = open(path,'r')
        txdata = txtFile.read()
        txtFile.close()
        if not "txName" in txdata: raise TypeError
        if not 'upperLimits' in txdata and not 'efficiencyMap' in txdata:
            raise TypeError
        txfile = open(self.path)
        content = concatenateLines (  txfile.readlines() )
        txfile.close()

        #Get tags in info file:
        tags = [line.split(':', 1)[0].strip() for line in content]
        data = None
        expectedData = None
        dataType = None
        for i,tag in enumerate(tags):
            if not tag: continue
            line = content[i]
            value = line.split(':',1)[1].strip()
            if tags.count(tag) == 1:
                if ';' in value: value = value.split(';')
                if tag == 'upperLimits' or tag == 'efficiencyMap':
                    data = value
                    dataType = tag
                elif tag == 'expectedUpperLimits':
                    expectedData = value
                    dataType = 'upperLimits'
                else: self.addInfo(tag,value)
            else:
                logger.info("Ignoring unknown field %s found in file %s" \
                             % (tag, self.path))
                continue
        ident = self.globalInfo.id+":"+dataType[0]+":"+ str(self._infoObj.dataId)
        ident += ":" + self.txName
        self.txnameData = TxNameData( data, dataType, ident )
        if expectedData:
            self.txnameDataExp = TxNameData( expectedData, dataType, ident )

        #Builds up a list of elements appearing in constraints:
        elements = []
        if hasattr(self,'constraint'):
            elements += [Element(el) for el in elementsInStr(self.constraint)]
        if hasattr(self,'condition') and self.condition:
            conds = self.condition
            if not isinstance(conds,list): conds = [conds]
            for cond in conds:
                for el in elementsInStr(cond):
                    newEl = Element(el)
                    if not newEl in elements: elements.append(newEl)

        # Builds up TopologyList with all the elements appearing in constraints
        # and conditions:
        for el in elements:
            el.sortBranches()
            self._topologyList.addElement(el)

    def __str__(self):
        return self.txName

    def __lt__ ( self, other ):
        """ sort by txName """
        return self.txName < other.txName

    def getValueFor(self,massarray,expected=False ):
        """ 
        Access txnameData and txnameDataExp to get value for 
        massarray.

        :param massarray: mass array values (with units), i.e.
                          [[100*GeV,10*GeV],[100*GeV,10*GeV]]
        :param expected: query self.txnameDataExp
        """
        if not expected:
            return self.txnameData.getValueFor( massarray )
        else:
            if not self.txnameDataExp:
                return None
            else:
                return self.txnameDataExp.getValueFor( massarray )


    def addInfo(self,tag,value):
        """
        Adds the info field labeled by tag with value value to the object.
        
        :param tag: information label (string)
        :param value: value for the field in string format
        """

        if tag == 'constraint' or tag == 'condition':
            if isinstance(value,list):
                value = [val.replace("'","") for val in value]
            else: value = value.replace("'","")

        try:
            setattr(self,tag,eval(value, {'fb' : fb, 'pb' : pb, 'GeV' : GeV, 'TeV' : TeV}))
        except SyntaxError:
            setattr(self,tag,value)
        except NameError:
            setattr(self,tag,value)
        except TypeError:
            setattr(self,tag,value)

    def getInfo(self, infoLabel):
        """
        Returns the value of info field.
        
        :param infoLabel: label of the info field (string). It must be an attribute of
                          the TxNameInfo object
        """

        if hasattr(self,infoLabel): return getattr(self,infoLabel)
        else: return False

    def hasElementAs(self,element):
        """
        Verify if the conditions or constraint in Txname contains the element.
        Check both branch orderings.
        
        :param element: Element object
        :return: A copy of the element on the correct branch ordering appearing
                in the Txname constraint or condition.
        """

        for el in self._topologyList.getElements():
            if element.particlesMatch(el,branchOrder=True):
                return element.copy()
            else:
                elementB = element.switchBranches()
                if elementB.particlesMatch(el,branchOrder=True):
                    return elementB
        return False


    def getEfficiencyFor(self,mass):
        """
        For upper limit results, checks if the input mass falls inside the
        upper limit grid.  If it does, returns efficiency = 1, else returns
        efficiency = 0.  For efficiency map results, checks if the mass falls
        inside the efficiency map grid.  If it does, returns the corresponding
        efficiency value, else returns efficiency = 0.

        :param element: Element object
        :return: efficiency (float)
        """

        #Check if the element appears in Txname:
        val = self.txnameData.getValueFor(mass)
        if type(val) == type(fb):
            return 1.  #The element has an UL, return 1
        elif val is None or math.isnan(val):
            return 0.  #The element mass is outside the data grid
        elif type(val) == type(1.):
            return val  #The element has an eff
        else:
            logger.error("Unknown txnameData value: %s" % (str(type(val))))
            raise SModelSError()

class TxNameData(object):
    """
    Holds the data for the Txname object.  It holds Upper limit values or efficiencies.
    """

    def __init__(self,value,datatag,Id,accept_errors_upto=.05):
        """
        :param value: values in string format
        :param datatag: the dataTag (upperLimits or efficiencyMap)
        :param Id: an identifier, must be unique for each TxNameData!
        :param _accept_errors_upto: If None, do not allow extrapolations outside of
                convex hull.  If float value given, allow that much relative
                uncertainty on the upper limit / efficiency
                when extrapolating outside convex hull.
                This method can be used to loosen the equal branches assumption.
        """
        self.dataTag = datatag
        self._id = Id
        self._accept_errors_upto=accept_errors_upto
        self._V = None
        self.loadData( value )

    def __str__ ( self ):
        """ a simple unique string identifier, mostly for _memoize """
        return str ( self._id )

    def round_to_n ( self, x, n ):
        if x==0.0:
            return x
        return round(x, int( -np.sign(x)* int(floor(log10(abs(x)))) + (n - 1)))


    def __ne__ ( self, other ):
        return not self.__eq__ ( other )

    def __eq__ ( self, other ):
        return self._id == other._id

    def loadData(self,value):
        """
        Uses the information in value to generate the data grid used for
        interpolation.
        """

        if self._V:
            return

        if type(value)==str:
            value = eval(value, {'fb':fb, 'pb':pb, 'GeV':GeV, 'TeV':TeV})
        self.unit = 1.0 ## store the unit so that we can take arbitrary units for
                        ## the "z" values.  default is unitless,
                        ## which we use for efficiency maps
        if len(value) < 1 or len(value[0]) < 2:
                logger.error ( "input value not in correct format. expecting sth " \
                               "like [ [ [[ 300.*GeV,100.*GeV], "\
                               "[ 300.*GeV,100.*GeV] ], 10.*fb ], ... ] "\
                               "for upper limits or [ [ [[ 300.*GeV,100.*GeV],"\
                               " [ 300.*GeV,100.*GeV] ], .1 ], ... ] for "\
                               "efficiency maps" )
        if type(value[0][1])==unum.Unum:
            ## if its a unum, we store 1.0 * unit
            self.unit=value[0][1] / ( value[0][1].asNumber() )

        self.computeV( value )

    @_memoize
    def getValueFor(self,massarray):
        """
        Interpolates the value and returns the UL or efficiency for the
        respective massarray
        
        :param massarray: mass array values (with units), i.e.
                          [[100*GeV,10*GeV],[100*GeV,10*GeV]]
        """
        porig=self.flattenMassArray ( massarray ) ## flatten
        self.massarray = massarray
        if len(porig)!=self.full_dimensionality:
            logger.error ( "dimensional error. I have been asked to compare a "\
                    "%d-dimensional mass vector with %d-dimensional data!" % \
                    ( len(porig), self.full_dimensionality ) )
            return None
        p= ( (np.matrix(porig)[0] - self.delta_x ) ).tolist()[0]
        P=np.dot(p,self._V)  ## rotate
        dp=self.countNonZeros(P)
        self.projected_value = self.interpolate([ P[:self.dimensionality] ])

        # self.projected_value = griddata( self.Mp, self.xsec, [ P[:self.dimensionality] ], method="linear")[0]
        # self.projected_value = float(self.projected_value)
        if dp > self.dimensionality: ## we have data in different dimensions
            if self._accept_errors_upto == None:
                return None
            logger.debug( "attempting to interpolate outside of convex hull "\
                    "(d=%d,dp=%d,masses=%s)" %
                     ( self.dimensionality, dp, str(massarray) ) )            
            return self._interpolateOutsideConvexHull( massarray )

        return self._returnProjectedValue()

    def flattenMassArray ( self, data ):
        """ flatten mass array and remove units """
        ret=[]
        for i in data:
            for j in i:
                ret.append ( j.asNumber(GeV) )
        return ret

    def interpolate(self, uvw, fill_value=np.nan):
        tol = 1e-6
        # tol = sys.float_info.epsilon * 1e10
        simplex = self.tri.find_simplex(uvw, tol=tol)
        if simplex[0]==-1: ## not inside any simplex?
            return fill_value
        vertices = np.take(self.tri.simplices, simplex, axis=0)
        temp = np.take(self.tri.transform, simplex, axis=0)
        d=temp.shape[2]
        delta = uvw - temp[:, d]
        bary = np.einsum('njk,nk->nj', temp[:, :d, :], delta)
        vtx = vertices
        wts = np.hstack((bary, 1 - bary.sum(axis=1, keepdims=True)))
        v=self.xsec
        if type (self.xsec[0]) == float:
            values = np.array ( [ float(x) for x in self.xsec ] )
        else:
            values = np.array ( [ x.asNumber() for x in self.xsec ] )
        ret = np.einsum('nj,nj->n', np.take(values, vtx), wts)
        # the following was just a test to see if the point is outside the
        # convex hull, but we check this via simplex[0]==-1, anyways.
        #with np.errstate(invalid='ignore'):
        #    ret[np.any(self.wts < -1e-10, axis=1)] = fill_value
        return float(ret[0])


    def _estimateExtrapolationError ( self, massarray ):
        """ when projecting a point p from n to the point P in m dimensions, we
            estimate the expected extrapolation error with the following
            strategy: we compute the gradient at point P, and let alpha be the
            distance between p and P. We then walk one step of length alpha in
            the direction of the greatest ascent, and the opposite direction.
            Whichever relative change is greater is reported as the expected
            extrapolation error.
        """
        #p=self.flattenMassArray ( massarray ) ## point p in n dimensions
        porig=self.flattenMassArray ( massarray ) ## flatten
        p= ( (np.matrix(porig)[0] - self.delta_x ) ).tolist()[0]
        P=np.dot(p,self._V)                    ## projected point p in n dimensions
        ## P[self.dimensionality:] is project point p in m dimensions
        # m=self.countNonZeros ( P ) ## dimensionality of input
        ## how far are we away from the "plane": distance alpha
        alpha = float ( np.sqrt ( np.dot ( P[self.dimensionality:],
                        P[self.dimensionality:] ) ) )
        if alpha == 0.:
            ## no distance to the plane, so no extrapolation error
            return 0.
        ## the value of the grid at the point projected to the "plane"

        ## compute gradient
        gradient=[]
        for i in range ( self.dimensionality ):
            P2=copy.deepcopy(P)
            P2[i]+=alpha
            pv = self.interpolate ( [ P2[:self.dimensionality] ] )
            g=float ( ( pv - self.projected_value ) / alpha )
            #g=float ( ( griddata( self.Mp, self.xsec, [ P2[:self.dimensionality]],
            #            method="linear")[0] - self.projected_value ) / alpha )
            if math.isnan ( g ):
                ## if we cannot compute a gradient, we return nan
                return float("nan")
            gradient.append ( g )
        ## normalize gradient
        # print "gradient=",gradient
        C= float ( np.sqrt ( np.dot ( gradient, gradient ) ) )
        if C == 0.:
            ## zero gradient? we return 0.
            return 0.
        for i,j in enumerate(gradient):
            gradient[i]=gradient[i]/C*alpha
            #print "gradient after=",gradient[i]
        #print "^^^^^^"
        ## walk one alpha along gradient
        P3=copy.deepcopy(P)
        P4=copy.deepcopy(P)
        for i,j in enumerate(gradient):
            P3[i]+=gradient[i]
            P4[i]-=gradient[i]
        # print "projected value", projected_value
        agp=self.interpolate ( [ P3[:self.dimensionality] ] )
        #agp=griddata( self.Mp, self.xsec, [ P3[:self.dimensionality] ],
        #              method="linear")[0]
        #print "along gradient", ag
        agm=self.interpolate ( [ P4[:self.dimensionality] ] )
        #agm=griddata( self.Mp, self.xsec, [ P4[:self.dimensionality] ],
        #              method="linear")[0]
        #print "along negative gradient",agm
        dep,dem=0.,0.
        if self.projected_value == 0.:
            if agp!=0.:
                dep =1.0
            if agm!=0.:
                dem =1.0
        else:
            dep=abs ( agp - self.projected_value) / self.projected_value
            dem=abs ( agm - self.projected_value ) / self.projected_value
        de=dep
        if dem > de: de=dem
        return de

    def _interpolateOutsideConvexHull ( self, massarray ):
        """ experimental routine, meant to check if we can interpolate outside
            convex hull """
        porig=self.flattenMassArray ( massarray ) ## flatten
        p= ( (np.matrix(porig)[0] - self.delta_x ) ).tolist()[0]
        P=np.dot(p,self._V)
        de = self._estimateExtrapolationError ( massarray )
        if de < self._accept_errors_upto:
            return self._returnProjectedValue()
        if not math.isnan(de):
            logger.debug ( "Expected propagation error of %f too large to " \
                           "propagate." % de )
        return None

    def _returnProjectedValue ( self ):
        ## None is returned without units'
        if self.projected_value is None or math.isnan(self.projected_value):
            logger.debug ( "projected value is None. Projected point not in " \
                    "convex hull? original point=%s" % self.massarray )
            return None
        #Set value to zero if it is lower than machine precision (avoids fake negative values)
        if abs(self.projected_value) < 100.*sys.float_info.epsilon:
            self.projected_value = 0.
        return self.projected_value * self.unit

    def countNonZeros ( self, mp ):
        """ count the nonzeros in a vector """
        nz=0
        for i in mp:
            if abs(i)>10**-4:
                nz+=1
        return nz

    def computeV ( self, values ):
        """ compute rotation matrix _V, and triangulation self.tri """
        if self._V!=None:
             return
        Morig=[]
        self.xsec=[]

        for x,y in values:
            self.xsec.append ( y / self.unit )
            xp = self.flattenMassArray ( x )
            Morig.append ( xp )
        aM=np.matrix ( Morig )
        MT=aM.T.tolist()
        self.delta_x = np.matrix ( [ sum (x)/len(Morig) for x in MT ] )[0]
        M = []

        # print "here"
        for Mx in Morig:
            m=( np.matrix ( Mx ) - self.delta_x ).tolist()[0]
            M.append ( m )
            # M.append ( [ self.round_to_n ( x, 7 ) for x in m ] )

        U,s,Vt=svd(M)
        V=Vt.T
        self._V= V ## self.round ( V )
        Mp=[]

        ## the dimensionality of the whole mass space, disrespecting equal branches
        ## assumption
        self.full_dimensionality = len(xp)
        self.dimensionality=0
        for m in M:
            mp=np.dot(m,V)
            Mp.append ( mp )
            nz=self.countNonZeros ( mp )
            if nz>self.dimensionality:
                self.dimensionality=nz
        ## print "dim=",self.dimensionality
        # self.MpCut=[]
        MpCut=[]
        for i in Mp:
            if self.dimensionality > 1:
                MpCut.append(i[:self.dimensionality].tolist() )
            else:
                MpCut.append([i[0].tolist(),0.])
        if self.dimensionality == 1:
            logger.debug("1-D data found. Extending to a small 2-D band around the line.")
            MpCut += [[pt[0],pt[1]+0.0001] for pt in MpCut] + [[pt[0],pt[1]-0.0001] for pt in MpCut]
            self._1dim = True
            self.xsec += self.xsec + self.xsec
            self.dimensionality = 2
        else:
            self._1dim = False
             
        # self.Mp=MpCut ## also keep the rotated points, with truncated zeros
        self.tri = qhull.Delaunay( MpCut )

if __name__ == "__main__":
    import time
    data = [ [ [[ 150.*GeV, 50.*GeV], [ 150.*GeV, 50.*GeV] ],  3.*fb ],
         [ [[ 200.*GeV,100.*GeV], [ 200.*GeV,100.*GeV] ],  5.*fb ],
         [ [[ 300.*GeV,100.*GeV], [ 300.*GeV,100.*GeV] ], 10.*fb ],
         [ [[ 300.*GeV,150.*GeV], [ 300.*GeV,150.*GeV] ], 13.*fb ],
         [ [[ 300.*GeV,200.*GeV], [ 300.*GeV,200.*GeV] ], 15.*fb ],
         [ [[ 300.*GeV,250.*GeV], [ 300.*GeV,250.*GeV] ], 20.*fb ],
         [ [[ 400.*GeV,100.*GeV], [ 400.*GeV,100.*GeV] ],  8.*fb ],
         [ [[ 400.*GeV,150.*GeV], [ 400.*GeV,150.*GeV] ], 10.*fb ],
         [ [[ 400.*GeV,200.*GeV], [ 400.*GeV,200.*GeV] ], 12.*fb ],
         [ [[ 400.*GeV,250.*GeV], [ 400.*GeV,250.*GeV] ], 15.*fb ],
         [ [[ 400.*GeV,300.*GeV], [ 400.*GeV,300.*GeV] ], 17.*fb ],
         [ [[ 400.*GeV,350.*GeV], [ 400.*GeV,350.*GeV] ], 19.*fb ], ]
    txnameData=TxNameData ( data, "upperLimits",  sys._getframe().f_code.co_name )
    t0=time.time()
    for masses in [ [[ 302.*GeV,123.*GeV], [ 302.*GeV,123.*GeV]],
                    [[ 254.*GeV,171.*GeV], [ 254.*GeV,170.*GeV]],
    ]:
        result=txnameData.getValueFor( masses )
        sm = "%.1f %.1f" % ( masses[0][0].asNumber(GeV), masses[0][1].asNumber(GeV) )
        print ( "%s %.3f fb" % ( sm, result.asNumber(fb) ) )
    print ( "%.2f ms" % ( (time.time()-t0)*1000. ) )
