#!/usr/bin/env python

"""
.. module:: smodelsTools
   :synopsis: Command line program for SModelS tools.

.. moduleauthor:: Wolfgang Magerl <wolfgang.magerl@gmail.com>
.. moduleauthor:: Wolfgang Waltenberger <wolfgang.waltenberger@gmail.com>

"""

from __future__ import print_function
import argparse, os, sys
from smodels.installation import installDirectory
sys.path.append(installDirectory()+"/Unum-4.1.3-py2.7.egg/")
from smodels.tools import smodelsLogging

def main():
    parser = argparse.ArgumentParser(description="SModelS-tools command line tool.")

    parser.add_argument('-particles', '--particlePath', help='path to directory where particles.py is located', default=installDirectory()+"/smodels")
    parser.add_argument('-v','--verbose', help='verbosity level. '
                        'accepted values are: debug, info, warning, error.',
                                    default = "info", type = str )

    subparsers = parser.add_subparsers(dest='subparser_name')

    installation = subparsers.add_parser('installation', description="Print installation setup and exit.")
    xseccomputer = subparsers.add_parser('xseccomputer', description="Compute MSSM cross sections for a SLHA file.")
    xseccomputer.add_argument('-s', '--sqrts', nargs='+', action='append',
        help="sqrt(s) TeV. Can supply more than one value. Default is both 8 and 13.",
        type=int, default=[])
    xseccomputer.add_argument('-e', '--nevents', type=int, default=10000,
        help="number of events to be simulated.")
    xseccomputer.add_argument('-v', '--verbosity', type=str, default="info",
        help="Verbosity (debug, info, warning, error)")
    xseccomputer.add_argument('-c', '--ncpus', type=int, default=-1,
        help="number of cores to be used simultaneously. -1 means 'all'. ")
    xseccomputer.add_argument('-p', '--tofile', action='store_true',
        help="write cross sections to file")
    xseccomputer.add_argument('-q', '--query', action='store_true',
        help="only query if there are cross sections in the file")
    xseccomputer.add_argument('-k', '--keep', action='store_true',
        help="do not unlink temporary directory")
    xseccomputer.add_argument('-n', '--NLO', action='store_true',
        help="compute at the NLO level (default is LO)")
    xseccomputer.add_argument('-N', '--NLL', help="compute at the NLO+NLL level (takes precedence over NLO, default is LO)", action='store_true')
    xseccomputer.add_argument('-O', '--LOfromSLHA', help="use LO cross sections from file to compute the NLO or NLL cross sections", action='store_true')
    xseccomputer.add_argument('-f', '--filename', required=True,
            help="SLHA file to compute cross sections for. "
            "If a directory is given, compute cross sections for all files in directory." )

    slhachecker = subparsers.add_parser('slhachecker', description="Perform several checks on a SLHA file.")
    slhachecker.add_argument('-xS', '--xsec', help='turn off the check for xsection blocks', action='store_false')
    slhachecker.add_argument('-lsp', '--lsp', help='turn off the check for charged lsp', action='store_false')
    slhachecker.add_argument('-longlived', '--longlived', help='turn off the check for stable charged particles and visible displaced vertices', action='store_false')
    slhachecker.add_argument('-m', '--displacement', help='give maximum displacement of secondary vertex in m', default=.001, type=float)
    slhachecker.add_argument('-s', '--sigmacut', help='give sigmacut in fb', default=.03, type=float)
    slhachecker.add_argument('-illegal', '--illegal', help='turn on check for kinematically forbidden decays', action='store_true')
    slhachecker.add_argument('-dB', '--decayBlocks', help='turn off the check for missing decay blocks', action='store_false')
    slhachecker.add_argument('-f', '--filename', help='name of input SLHA file', required=True)

    lhechecker = subparsers.add_parser('lhechecker', description="Check if the input file has LHE format.")
    lhechecker.add_argument('-f', '--filename', help='name of input LHE file', required=True)

    dbBrowser = subparsers.add_parser('database-browser', description="Interface for browsing the Database.")
    dbBrowser.add_argument('-p', '--path_to_database', help='path to SModelS database', required=True)
    dbBrowser.add_argument('-t', '--text', help='load text database, dont even search for binary database file', action='store_true')

    args = parser.parse_args()


    """
    check if particles.py exists in specified path, and add to sys.path
    """
    if not os.path.isfile(os.path.join(args.particlePath,"particles.py")):
        log.error("particle.py not found in %s" %args.particlePath )
        return
    else:
        sys.path.insert(1, args.particlePath)
        from smodels.tools import xsecComputer
        from smodels.tools import slhaChecks, lheChecks


    smodelsLogging.setLogLevel ( args.verbose )

    if args.subparser_name == 'installation':
        from smodels import installation
        print ( installation.banner() )
        print ( "SModelS version:", installation.version() )
        print ( "Installation directory:",installation.installDirectory() )
        path = os.path.abspath(os.path.realpath(__file__))
        print ( "This binary:",path )
        sys.exit()

    if args.subparser_name == 'xseccomputer':
        xsecComputer.main(args)
    if args.subparser_name == 'slhachecker':
        slhaChecks.main(args)
    if args.subparser_name == 'lhechecker':
        lheChecks.main(args)
    if args.subparser_name == 'database-browser':
        databaseBrowser.main(args)

if __name__ == '__main__':
    main()

