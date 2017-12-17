.. EasyScan_HEP documentation master file, created by
   sphinx-quickstart on Mon Apr 25 21:08:57 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

EasyScan_HEP
========================================

About
------------------------------
EasyScan_HEP is an easy-to-use tool providing a comfortable way connecting programs to scan the parameter space for high energy physics models.

It includes four scan methods(random, grid, MCMC, MultiNest), some popular data analysis algorithm (Bayes analysis, CLs) and a well defined framework to connect to high energy physics programs. With only few necessary input parameters(one page), users can easily get visible results with different scan methods.






Download
------------------------------
Version beta.1.1 (12.07.2016) is available here: `Download <https://www.hepforge.org/downloads/easyscanhep>`_



Install
-------------------------------

EasyScan_HEP requires Python 2.x with modules `scipy, numpy, matplotlib, progressbar` on your system. Most systems already come with a Python installation, which you can easily check by typing


.. code-block:: bash

   $ python -V

and install the modules (on Ubuntu) by typing

.. code-block:: bash

   $ sudo apt-get install python-{scipy,numpy,matplotlib,progressbar}

To use MultiNest methodology, you need to install the PyMultiNest and MultiNest libraries(see `PyMultiNest installation <http://johannesbuchner.github.io/pymultinest-tutorial/install.html#on-your-own-computer>`_ for detailed install instructions) on your system.


Test run
-------------------------------
Now you can try out EasyScan_HEP with command

.. code-block:: bash

   $ .／easyScan.py test.ini

in the folder ’bin’, where test.ini is an example input file to run EasyScan_HEP:

.. code-block:: none
    :caption: test.ini
    :name: test.ini

    [scan]
    Result file name:  test
    Scan method:       MCMC
    Points number:     1000
    #                  ID     Prior  Min    MAX
    Input parametes:   x,     Flat,  -2,    2
                       y,     Flat,  -2,    2.5

    [program0]
    Program name:    zytest
    Execute command: ./test.py
    Command path:    ../Externals/zytest/
    Input file:      1, ../Externals/zytest/inp.dat
    #                varID   fileID  method    other
    Input variable:  x,      1,      Position, 1,  1
                     y,      1,      Position, 1,  2
    Output file:     1, ../Externals/zytest/output.txt
    #                varID   fileID  method    other
    Output variable: z,      1,      Position, 1 , 1

    [constraint]
    #                      mean    sigma
    Gaussian:        z,    1.0,    1.0

    [plot]
    color: x, y, z

It provides all the information of this run:

#. It will scan the parameters `x` and `y` by random scattering in range (0, 3.14) and (-3.14, 3.14) respectively with flat distribution function.
#. By executing './test.py' in the path 'externals/zytest/', it will generate the output parameter `z`.
#. The scan result, including 100 groups of (x,y,z) and a figure, will be saved in 'test_random/RandomData.txt', and the figure named 'fig_x_y_z.png' looks like below.

.. image:: _static/test_run.*

As a simplest input sample, it can be extended to accomplish more functions, such  as using other scan method, adding more than one programs, and generating more figures. You can see the manual documentation for detail explanation of those parameters and more examples.

Manual
----------------------------
.. toctree::
    structure
    input
    output
    scanmethod
    example
    :maxdepth: -1


Getting help
----------------------------

If you meet any problem with EasyScan_HEP, please contact with `Yang Zhang <zhangyang@itp.ac.cn>`_ or `Liang Shang <shlwell1988@gmail.com>`_.


Cite
-------------------------------


Please cite corresponding program according to the algorithm you using in this package.

* `MultiNest <http://ccpforge.cse.rl.ac.uk/gf/project/multinest/>`_ and `PyMultiNest <https://github.com/JohannesBuchner/PyMultiNest>`_

If EasyScan_HEP enables your research, please consider citing our publication: `ITP New Physics Legion, 2016, CAS <http://www.itp.cas.cn>`_ (BibTex) In this paper, we introduce the software package officially, and compare the  parameter space of CMSSM and CNMSSM with different scan and analysis methodologies.




Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

