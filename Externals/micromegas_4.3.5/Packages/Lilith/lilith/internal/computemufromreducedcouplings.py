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

import sys
import math
from . import brsm as BR_SM
from ..errors import ComputeMuFromReducedCouplingsError

class ComputeMuFromReducedCouplings:
    """Computing the signal strengths from reduced couplings based on
       branching ratios"""

    def __init__(self, mass):
        self.BR = {}
        self.mass = mass

        # read the SM BR grids
        self.func_BR = BR_SM.getBRfunctions()

        # read the BR for an SM-like Higgs at the mass specified in
        # the user input
        for key, val in self.func_BR.items():
            self.BR[key] = val(mass)

    def reset(self, mass):
        # evaluate the SM BR grids at the given mass, if not already done
        if mass != self.mass:
            for key, val in self.func_BR.items():
                self.BR[key] = val(mass)
            self.mass = mass

    def getmu(self, redCp):
        """Computes the likelihood from reduced couplings."""

        try:
            for key, val in redCp.items():
                if key == "extra":
                    continue
                if redCp["extra"]["precision"] == "LO":
                    if key == "tt":
                        # factor of 1/3 from 1104.5613
                        redCp[key] = math.sqrt(val.real**2 + 1./3.*val.imag**2)
                    else:
                        redCp[key] = abs(val)
                else:
                    redCp[key] = val.real
        except KeyError as s:
            raise ComputeMuFromReducedCouplingsError(
                'there are missing elements in couplings: key "' + str(s) +
                '" is not found')

        considered_decay_modes = [
        "gammagamma", "ZZ", "WW", "bb", "cc", "tautau", "Zgamma", "mumu", "gg",
        "invisible"
        ]

        width = {}
        tot_width_SM = 0.
        tot_width = 0.
        for decay in self.BR:
            if decay in considered_decay_modes:
                if decay == "gg":
                    coupling = "gg_decay"
                else:
                    coupling = decay
                tot_width_SM += self.BR[decay]
                try:
                    width[decay] = self.BR[decay] * redCp[coupling]**2
                except KeyError as s:
                    raise ComputeMuFromReducedCouplingsError(
                        'there are missing elements in couplings: key "' + str(s) +
                        '" is not found')
                tot_width += width[decay]
        
        reduced_width = tot_width/tot_width_SM
        try:
            inv_und = (1. - redCp["extra"]["BRinvisible"] -
                       redCp["extra"]["BRundetected"])
        except KeyError as s:
            raise ComputeMuFromReducedCouplingsError(
                'there are missing elements in couplings: key "' + str(s) +
                '" is not found')

        redBR = {}
        for decay in considered_decay_modes:
            if decay == "invisible":
                # one cannot define a "reduced" branching ratio
                redBR[decay] = redCp["extra"]["BRinvisible"]
            else:
                redBR[decay] = (inv_und * width[decay] / reduced_width /
                                self.BR[decay])

        mu = {}
        prod_modes = {"ggH": "gg_prod_lhc8", "VBF": "VBF", "WH": "WH",
                      "ZH": "ZH", "ttH": "tt"}
        for prod,coupling in prod_modes.items():
            for decay in considered_decay_modes:
                mu[(prod,decay)] = redCp[coupling]**2 * redBR[decay]
        if "extra" not in mu:
            if "name" in redCp["extra"]:
                mu["extra"]={"mass": self.mass, "name": redCp["extra"]["name"]}
            else:
                mu["extra"]={"mass": self.mass}
        return mu

