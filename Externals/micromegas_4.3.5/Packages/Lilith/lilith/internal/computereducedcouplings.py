##########################################################################
#
#  This file is part of Lilith
#  made by J. Bernon and B. Dumont
#
#  Web page: http://lpsc.in2p3.fr/projects-th/lilith/
#
#  In case of questions email bernon@lpsc.in2p3.fr
#
#
#    Lilith is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Lilith is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Lilith.  If not, see <http://www.gnu.org/licenses/>.
#
##########################################################################

from . import reducedcouplingslo as RedCoupLO
from . import reducedcouplingsnnlo as RedCoupNNLO
from ..errors import ReducedCouplingComputationError

class ComputeReducedCouplings:
    """Compute missing reduced couplings."""

    formfactors_NNLOgridfunctions = ["gg_decay", "gg_prod_lhc8",
                                     "gammagamma", "Zgamma", "VBF"]

    def __init__(self, redCp):
        # form factors for the calculation of reduced couplings can either come
        # from analytical formula at LO ("func_formfactors_LO") or from
        # interpolated grids obtained from running HDECAY, HIGLU or VBFNLO
        # ("func_formfactors_interp").
        # in order to speed up things in case of repeted user input at the same
        # Higgs mass, we store the evaluation of the (analyatical or
        # interpolation) function at the Higgs mass given by the user in the
        # dictionaries formfactors_LO and formfactors_interp.

        self.func_formfactors_LO = {} # function of Higgs mass
        self.formfactors_LO = {} # evaluated at the mass given by the user

        self.func_formfactors_interp = {} # function of Higgs mass
        self.formfactors_interp = {} # evaluated at the mass given by the user

        self.precision = redCp["extra"]["precision"]
        self.mass = redCp["extra"]["mass"]

        if self.precision == "LO":
            self.func_formfactors_LO = RedCoupLO.computeformfactors()
            # then, read the LO form factors at the mass specified in
            # the user input
            for key, val in self.func_formfactors_LO.items():
                self.formfactors_LO[key] = val(self.mass)

            # only form factor from an interpolated grid at LO: VBF
            if "VBF" not in redCp:
                self.func_formfactors_interp["VBF"] = RedCoupLO.VBF_ff()
        else:
            for key in ComputeReducedCouplings.formfactors_NNLOgridfunctions:
                # store every needed interpolation function of form factors
                if key not in redCp:
                    self.func_formfactors_interp[key] = getattr(
                        RedCoupNNLO, key + "_ff")()

        for key in self.func_formfactors_interp:
            self.formfactors_interp[key] = {}
            for ff,val in self.func_formfactors_interp[key].items():
                self.formfactors_interp[key][ff] = val(self.mass)

    def reset(self, redCp):
        if redCp["extra"]["precision"] != self.precision:
            # if going from LO to BEST-QCD, or vice-versa,
            # re-initialize everything
            self.__init__(redCp)
            return

        new_func_ff = []

        if self.precision == "LO":
            if "VBF" not in redCp and "VBF" not in self.func_formfactors_interp:
                self.func_formfactors_interp["VBF"] = RedCoupLO.VBF_ff()
                new_func_ff.append("VBF")
        else:
            for key in ComputeReducedCouplings.formfactors_NNLOgridfunctions:
                # store every needed interpolation function of form factors
                # that has not already been stored
                if key not in redCp and key not in self.func_formfactors_interp:
                    self.func_formfactors_interp[key] = getattr(
                        RedCoupNNLO, key + "_ff")()
                    new_func_ff.append(key)

        if self.precision == "LO":
            for key, val in self.func_formfactors_LO.items():
                if redCp["extra"]["mass"] != self.mass or key in new_func_ff: 
                    self.formfactors_LO[key] = val(self.mass)
        for key in self.func_formfactors_interp:
            if redCp["extra"]["mass"] != self.mass or key in new_func_ff:
                self.formfactors_interp[key] = {}
                for ff,val in self.func_formfactors_interp[key].items():
                    self.formfactors_interp[key][ff] = val(self.mass)
        self.mass = redCp["extra"]["mass"]

    def getcouplings(self, redCp):
        redCp_new = {}

        try:
            CZ = redCp["ZZ"].real
            CW = redCp["WW"].real
            Cb = redCp["bb"].real
            Cc = redCp["cc"].real
            Ct = redCp["tt"].real
            Ctau = redCp["tautau"].real

            if self.precision == "LO":
                Ct_im = redCp["tt"].imag
                Cc_im = redCp["cc"].imag
                Cb_im = redCp["bb"].imag
                Ctau_im = redCp["tautau"].imag
        except KeyError as s:
            raise ReducedCouplingComputationError(
                'the "' + str(s) + '" couplings is missing in couplings')

        if "gammagamma" not in redCp:
            if self.precision == "LO":
                redCp_new["gammagamma"] = RedCoupLO.redCgammagamma(
                    Ct, Cb, Cc, Ctau, CW, Ct_im, Cb_im, Ctau_im, Cc_im,
                    self.formfactors_LO)
            else:
                redCp_new["gammagamma"] = RedCoupNNLO.redCgammagamma(
                    Ct, Cb, Cc, Ctau, CW,
                    self.formfactors_interp["gammagamma"])

        if "Zgamma" not in redCp:
            if self.precision == "LO":
                redCp_new["Zgamma"] = RedCoupLO.redCZgamma(
                    Ct, Cb, Cc, Ctau, CW, Ct_im, Cb_im, Cc_im, Ctau_im,
                    self.formfactors_LO)
            else:
                redCp_new["Zgamma"] = RedCoupNNLO.redCZgamma(
                    Ct, Cb, Cc, Ctau, CW,
                    self.formfactors_interp["Zgamma"])

        if "gg_prod_lhc8" not in redCp:
            if self.precision == "LO":
                if "gg_decay" in redCp_new:
                    redCp_new["gg_prod_lhc8"] = redCp_new["gg_decay"]
                else:
                    redCp_new["gg_prod_lhc8"] = RedCoupLO.redCgg(
                        Ct, Cb, Cc, Ct_im, Cb_im, Cc_im, self.formfactors_LO)
            else:
                redCp_new["gg_prod_lhc8"] = RedCoupNNLO.redCggF_LHC8(
                    Ct, Cb, self.formfactors_interp["gg_prod_lhc8"])

        if "gg_decay" not in redCp:
            if self.precision == "LO":
                if "gg_prod_lhc8" in redCp_new:
                    redCp_new["gg_decay"] = redCp_new["gg_prod_lhc8"]
                else:
                    redCp_new["gg_decay"] = RedCoupLO.redCgg(
                        Ct, Cb, Cc, Ct_im, Cb_im, Cc_im, self.formfactors_LO)
            else:
                redCp_new["gg_decay"] = RedCoupNNLO.redCgg(
                    Ct, Cb, Cc, self.formfactors_interp["gg_decay"])

        if "VBF" not in redCp:
            if self.precision == "LO":
                redCp_new["VBF"] = RedCoupLO.redCVBF(
                    CW, CZ, self.formfactors_interp["VBF"])
            else:
                redCp_new["VBF"] = RedCoupNNLO.redCVBF(
                    CW, CZ, self.formfactors_interp["VBF"])

        return redCp_new

