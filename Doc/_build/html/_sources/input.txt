An introduction to the input File
=================================================

.. contents::

The input file contain 4 sections, `scan`, `program`, `constraint` and `plot`. In this section we will show the meaning of items in each section and present all possible chooses you can adopt in EasyScan_HEP. To explain more clearly, we use following input file as a sample, which is a litter more complex than the one in ’<Test run>’

.. code-block:: none
    :caption: Input file sample
    :name: input_sample

    [scan]
    Result file name:  CMSSM_test
    Points number:     200
    Scan method:       random
    #                  ID     Prior  Min    MAX
    Input parametes:   tanb,  Flat,  40,     41
                       m0,    Flat,  200,   1000
                       m12,   FLAT,  500,   1000
                       A0,    flat,  1000,  1010
    Random seed:       100
    Interval of print: 1

    [program1]
    Program name:    softsusy-3.7.3
    Execute command: ./softsusy-3.7.3/softpoint.x leshouches < softsusy-3.7.3/inOutFiles/lesHouchesInput > lesHouchesOutput
    Command path:    ../Externals/
    Input file:      1, ../Externals/softsusy-3.7.3/inOutFiles/lesHouchesInput
    #                varID    fileID  way          note
    Input variable:  m0,      1,      Position,    14,      2
                     m12,     1,      Lable,       m12,     2
                     tanb,    1,      Replace,     ES_tanb
                     A0,      1,      SLHA,        BLOCK,   MINPAR,  5
    Output file:     1, ../Externals/lesHouchesOutput
    #                varID    fileID  way          note
    Output variable: mh,      1,      SLHA,        BLOCK,   MASS,    25
    #                 spec,    1,      File

    [program2]
    Program name:    micromegas_4.3.1
    Execute command: ./micromegas_4.3.1/MSSM/main lesHouchesOutput >micromrgas.out
    Command path:    ../Externals/
    Input file:
    Input variable:
    Output file:     1, ../Externals/micromrgas.out
    #                varID    fileID  way          note
    Output variable: omega,      1,   lable,       Omega=,   3

    [constraint]
    Gaussian:        mh,    125.0,    2.0
                     omega, 0.1199,  0.012

    [plot]
    Histogram: mh
    Scatter:  omega,mh
    color: m0, m12, mh
           m0, m12, omega

1. [scan]
---------------------------------

.. code-block:: none
    :caption: scan
    :name: input_scan

    [scan]
    Result file name:  CMSSM_test
    Scan method:       random
    Points number:     200
    #                  ID     Prior  Min    MAX
    Input parametes:   tanb,  Flat,  40,     41
                       m0,    Flat,  200,   1000
                       m12,   FLAT,  500,   1000
                       A0,    flat,  1000,  1010
    Random seed:       100
    Interval of print: 10
    MCMC Step tuning:  no


* `Result folder name` : The name of folder you want to save the result data and figures. It will be created at the path that you run the command. If the folder already exists, the program will ask you

 .. code-block:: none

      $ * The Result folder [test] already exists.
      $ Choose: (r)replace, (b)backup, (s)stop

 Typing 'r' and ‘enter’ key will delete the old folder and create a new one, while 'b' means mv the old one in to folder 'Backup' and create a new one, and 's' will stop the program.

* `Scan method` : For now, there are 6 scan methods you can choose,

 #. Random    : XXX
 #. Grid      : For each input parameter, the points are arranged at a given intervals.
 #. MCMC      : XXX
 #. MultiNest : XXX
 #. Read      : (not ready) Read the output folder of previous run, and recalculate the variables though the program and reanalysis the result data.  Useful if you miss calculate some variables at the previous run.
 #. Plot      : (not ready) Similar to ‘Read’, but without recalculate the output variables, just analyses the previous data according to the [plot] section.


* `Input parameters` : For '`Scan method`' in ['Random', 'Grid', 'MCMC', 'MultiNest'], the input parameters for scanning have at least 4 elements, 'name ID',  'distribution function', 'minimum value' and 'maximum value' in order,

 .. code-block:: python
    :caption: Scan method:Random \/ Grid \/ MCMC \/ MultiNest

    #                  Name ID,  Distribution function, Minimum value, Maximum value
    Input parameters:  tanb,     Flat,                  2.0,           60.0
                       m0,       Log,                   100.0,         4000.0
                       m1,       Log,                   100.0,         4000.0
                       A0,       Flat,                  -2000.0,       2000.0

 where 'name ID' must be the unique though the whole program, since it will be used latter, the 'distribution function' can be chosen as 'Flat' and 'Log10' (not ready) for '`Scan method`' in ['MCMC', 'MultiNest'] while only 'Flat' for the other two (See XXX for the meaning of distribution function).

 For 'Grid' scan, one more element, 'bin number' (interval = (Max-Min)/BinNum), need be provided (the default value is 30), such as

 .. code-block:: python
    :caption: Scan method:       Grid

    #                  Name ID,  Distribution function, Minimum value, Maximum value, Bin number
    Input parameters:  tanb,     Flat,                  2.0,           60.0,          10
                       m0,       Flat,                  100.0,         4000.0,        20     
                       m1,       Flat,                  100.0,         4000.0,        20
                       A0,       Flat,                  -2000.0,       2000.0,        10

 For 'MCMC' scan, 'step width' and 'initial value' (See XXX for detail explanation) can be change from the default value (Max-Min)/5 and (Max-Min)/2 in the way like following,

 .. code-block:: python
    :caption: Scan method:       MCMC

    #                  Name ID,  Distribution function, Minimum value, Maximum value, Step width, Initial value
    Input parameters:  tanb,     Flat,                  2.0,           60.0,          2,          25
                       m0,       log,                   100.0,         4000.0,        100,        2000.0
                       m1,       log,                   100.0,         4000.0,        100,        2000.0
                       A0,       Flat,                  -2000.0,       2000.0,        100,        1500.0

 For 'Read', just put the '`Result folder name`' of prior run here, the program will automatically load the parameter name ID of prior run, which you can find from the 'inf.txt' (if you want to use input folder not generated by EasyScan_HEP, please imitate the output format <XXX> to create an 'inf.txt').

 .. code-block:: python
    :caption: Scan method:Read

    Scan method:       Read
    Input parameters:  test_old

* `Points number`: The total number of points you want to scan. It will be ignore if `Scan method`' is 'Grid' or 'Read’.
* `Interval of print`: There is no need to print the information of evey points on the screen, especially for larger `Points number`. This parameter determine how many point intervals between each information print of point.
* `Random seed`: The seed is used to initialize the random function, which is an int. number in range (). If one set the seed ‘-1’, the seed will generate according time.


2. [program]
---------------------------------

.. code-block:: none
    :caption: program
    :name: input_program
 
    [program1]
    Program name:    softsusy-3.7.3
    Execute command: ./softsusy-3.7.3/softpoint.x leshouches < softsusy-3.7.3/inOutFiles/lesHouchesInput > lesHouchesOutput
    Command path:    ../Externals/
    Input file:      1, ../Externals/softsusy-3.7.3/inOutFiles/lesHouchesInput
    #                varID    fileID  way          note
    Input variable:  m0,      1,      Position,    14,      2
                     m12,     1,      Lable,       m12,     2
                     tanb,    1,      Replace,     ES_tanb
                     A0,      1,      SLHA,        BLOCK,   MINPAR,  5
    Output file:     1, ../Externals/lesHouchesOutput
    #                varID    fileID  way          note
    Output variable: mh,      1,      SLHA,        BLOCK,   MASS,    25
    #                spec,    1,      File

    [program2]
    Program name:    micromegas_4.3.1
    Execute command: ./micromegas_4.3.1/MSSM/main lesHouchesOutput >micromrgas.out
    Command path:    ../Externals/
    Input file:
    Input variable:
    Output file:     1, ../Externals/micromrgas.out
    #                varID    fileID  way          note
    Output variable: omega,      1,   lable,       Omega=,   3

You can have more than one programs to run in a row with section named by [program?] where ‘?’ is an unique integer for each program. EasyScan_HEP will run the programs according to the numbers. 

* `Program name`: It is only used to label your program, so any string is ok.

* `Execute command`: The command to run your program. 

* `Command path`: The path where you run the ‘`Execute command`’, either absolute path or relative path.


* `Input file`: The input file(s) of your programs. It can include more than one files, label by the first term.

* `Input variable`: For each input variable used in this program, at least 4 items (name ID, input file ID, method, parameter of method) are needed, 

 .. code-block:: python
    :caption: Input variable

    #                Input file ID,  Path
    Input file:      1,              Externals/test/mass.txt

    #                Name ID,  Input file ID,  Method,     Parameters of method
    Input variable:  m0,       1,              Position,   1,  1

 The input variables are chosen from the input parameters of the [scan] section and all output variables of the  programs which have less integer ‘?’ in the section name than the current one, and this is why the ‘Name ID’ should be unique though the whole program. The ‘Input file ID’ stands which file you want to put the input variable in, and ‘Method’ indicated how to put the input variables in it. In current vision, five methods to put in the input variables are provided, ‘Position’, ‘Replace’, ‘Label’, ’SLHA’ and ‘File’(not ready). Suppose that the input file of [program1] is 

 .. code-block:: python
    :caption: Example input file for the external program

    Block MINPAR             # Input parameters
    1   1.250000000e+02	     # m0
    2   9.000000000e+02	     # m12
    3   1.000000000e+01	     # tan beta at MZ, in DRbar scheme, Feynman gauge
    4   1.000000000e+00	     # sign(mu)
    5   0.000000000e+00	     # A0  

 and the input file of [program2] is the output file of [program1]. The following explain the meaning of different input methods.

 - For the ‘Position’ method, two parameters are needed to indicate the line number and column number of the input variable in corresponding input file, e.g.

  .. code-block:: python
     :caption: Position

     #                          Method,     Line number,  Column number
     Input variable:  m0, 1,    Position,   2,            2

 - The ‘Label’ method contains three parameters, the name and column number of label and the column number of input variable. For the example input file, it can be either 

  .. code-block:: python
     :caption: Label 1

     #                          Method,     Label name, Input variable column number
     Input variable:  m12, 1,   Label,      m12,        2

  or 

  .. code-block:: python
     :caption: Label 2

     #                          Method,     Label name, Input variable column number
     Input variable:  m12, 1,   Label,      2,          2

  The point is you need make sure only one parameter will be identified in your file.


 - For the ‘Replace’ method, the input file should exist before running EasyScan_HEP, and you should manually modify file, such as 

  .. code-block:: python
    :caption: Modified example input file for ‘Replace’ method

    Block MINPAR             # Input parameters
    1   1.250000000e+02	     # m0
    2   9.000000000e+02	     # m12
    3   ES_tanb	             # tan beta at MZ, in DRbar scheme, Feynman gauge
    4   1.000000000e+00	     # sign(mu)
    5   0.000000000e+00	     # A0   

  and corresponding ‘Input variable’ setting is

  .. code-block:: python
     :caption: Replace

     #                          Method,     Name of replaced parameter
     Input variable:  tanb, 1,  Replace,    ES_tanb


 - For the ‘SLHA’ method, firstly you must choose the type, i.e. ‘BLOCK’, ’DECAY’ or something you defined by yourself, and then provide the name of block or the PDG code of the decay particle and corresponding keys. For example, following is part of a SLHA format file,

  .. code-block:: python
    :caption: Example input file for SLHA method

    BLOCK MINPAR  # Input parameters - minimal models
         1     6.70000000E+02   # m0                  
         2     1.04000000E+03   # m_1                 
         3     2.10000000E+01   # tanbeta(mZ)         
         4     1.00000000E+00   # sign(mu)            
         5     2.44000000E+03   # A0 

    BLOCK UMIX  # Chargino Mixing Matrix U
         1  1    -9.69283723E-01   # U_11
         1  2     2.45945247E-01   # U_12
         2  1     2.45945247E-01   # U_21
         2  2     9.69283723E-01   # U_22


    BLOCK GAUGE Q=  1.00000000E+03 # (SUSY SCALE)
         1     3.62845531E-01   # g1
         2     6.42066527E-01   # g2
         3     1.04083353E+00   # g3

    DECAY   1000023     1.22776237E-04   # neutralino2
         8.88469593E-04    2     1000022        22   # BR(~chi_20 -> ~chi_10 gam)
         1.15050111E-01    3     1000022        -2         2   # BR(~chi_20 -> ~chi_10 ub      u)

  to fill-in ‘A0’ of ‘BLOCK MINPAR’, ‘U_11’ of ‘BLOCK UMIX’, ‘g3’ in ‘BLOCK GAUGE Q=  1.00000000E+03’, ’neutralino2’ decay width, ’BR(~chi_20 -> ~chi_10 gam)’ and ‘BR(~chi_20 -> ~chi_10 ub      u)’ of ‘DECAY   1000023’, those input variables are written as 

  .. code-block:: python
     :caption: SLHA

     #                                    Method,  BLOCK/DECAY, Block name/PDG,              Keys
     Input variable:  A0,            1,    SLHA,    BLOCK,       MINPAR,                     5
                      U_11,          1,    SLHA,    BLOCK,       UMIX,                       1  1
                      g3,            1,    SLHA,    BLOCK,       GAUGE Q=  1.00000000E+03,   3
                      Wd_n2,         1,    SLHA,    DECAY,       1000023,                    0
                      Br_n2_n1_gam,  1,    SLHA,    DECAY,       1000023,                    2     1000022        22
                      Br_n2_n1_ub_u, 1,    SLHA,    DECAY,       1000023,                    3     1000022        -2         2
  
  **NOTE**:
    
  #. If the block name contains white space(s), all the space(s) should retain, such as the ‘g3’ above.
  #. The block other than the ones in standard SLHA format can also be identified by this method, but it should have same pattern, i.e. for the line your input variable in, the first several items are keys, and the following item is your input variable.

 - The ‘File’ method is used to the situation that the input file is the out file of previous program (which has less integer ‘X’ in the section name than the current one), such as

  .. code-block:: python
     :caption: File

     #               Defined at previous program setting,  Input file ID   Method
     Input variable:  f1,                                   1,              File


* `Output file`: The output file(s) of your programs, similar to `Input file`.

* `Output variable`: The output variable you want to read from the `Output file`, similar to `Input variable`, having same format and options of method except the ’Replace’ method. For example, you can read variables in 

  .. code-block:: python
    :caption: Example output file (Externals/test/output.txt)

    BLOCK MASS   # Mass spectrum 
    #  PDG Code     mass             particle 
            25     8.69083347E+01   # lightest neutral scalar
            35     1.25954831E+02   # second neutral scalar
            45     1.63193932E+03   # third neutral scalar
            36     1.61209440E+02   # lightest pseudoscalar

 by 

 .. code-block:: python
    :caption: Output variable

    #                Output file ID,  Path
    Output file:     1,               Externals/test/output.txt

    #                Name ID,  Output file ID,  Method,     Parameters of method
    Output variable: mh1,      1,               Position,   2,        2
                     mh2,      1,               Label,      35,                    1,    2
                     mh3,      1,               Label,      third neutral scalar,  4,    2
                     mA1,      1,               SLHA,       BLOCK,    MASS
                     f1,       1,               File
                     chisq_mh, any,             Calculate,  (var[mh1]-125.0)/2.0

3. [constraint]
---------------------------------

This section is used to calculate the logarithm of likelihood function during the scan. It is essential for scan methods ‘MCMC’ and ‘MultiNest’, but not necessary for the other scan methods. Three ways to calculate the logarithm of likelihood function are provided, seeing the following sample.

.. code-block:: none
    :caption: Example of constraint

    [constraint]
    Gaussian:        mh,    125.0,    2.0
                     omg,   0.1199,   0.00012,           upper
    Limit:           mn1,   sigma,    externals/LUX.txt, lower

    Log(likelihood): chisq_mh

* `Gaussian`: the logarithm of likelihood function $log(L) += - 2* \frac{(\mu-\hat{\mu})^2}{\sigma^2}, and the corresponding items in the input file is

  .. code-block:: python
    :caption: Gaussian

    #                var ID,  Mean,     Deviation,        Upper/Lower
    Gaussian:        mh,      125.0,    2.0
                     omg,     0.1199,   0.00012,          upper

 where the last item ‘Upper’(Lower) is used in the situation that if the theoretical value $\mu$ is larger(less) than the Mean value, the $log(L)$ is calculated by above equation, otherwise $log(L) += 0$.

* `Limit`: the items included two ‘var ID’s, a file name, and “Upper”/“Lower”, like like 

  .. code-block:: python
    :caption: Limit

    #                var1 ID,  var2 ID,     File,              Upper/Lower
    Gaussian:        mn1,      sigma,       externals/LUX.txt, lower

 where the file include n lines (n>1) and 2 columns, stand a line in plane (var1, var2), and if the last item is ‘Upper’(‘Lower’) the points under(above) the line will set $log(L)$ to log(0), otherwise $log(L) += 0$.

* `Log(likelihood)`: the item is a variable defined in above program(s) setting, it will be added directly to the $log(L)$.

4. [plot]
---------------------------------

To get an overall description of the scan result, the section [plot] provided some base options to visualize the data.

.. code-block:: none
    :caption: Example of plot

    [plot]
    Histogram: mh,                 fig_1.png
               m1
    Scatter:   mn1,      sigma,    fig_LUX.png
               externals/LUX.txt
               m0,       m1
    Color:     m0,   m12,    mh
    Contour:   m0,   m12,    loglike


* `Histogram`: For each variable, two histograms will be created, one the all the points in the scan results, and the another one is the points consistence with the each constraint in above section(for `Gaussian` requiring $\chi^2<4$). The second item is the name of the figure, which has default value ‘fig’+varID+’.png’.

* `Scatter`: You can draw scatter plot with syntaxes,

  .. code-block:: python
    :caption: Scatter

    #          var1 ID,  var2 ID,  Figure name
    Scatter:   mn1,      sigma,    fig_LUX.png
               externals/LUX.txt
               m0,       m1

 which generate scatter plot on plane (var1, var2) with two colors representing the same meaning to `Histogram` plot. If there is a line just have one item and this item indicates a file containing two columns, it will plot a corresponding line in the figure obtained from the above line. <see the plots for example XXX>.

* `Color`: It is similar to the `Scatter`, but the color of points are labeled by the third item, such as 

  .. code-block:: python
    :caption: Color

    #         (x)var1 ID,   (y)var2 ID,   (color)var3 ID
    Scatter:   m0,           m12,          mh          

* `Contour`: Generate contour map with also three variable.

  .. code-block:: python
    :caption: Contour

    #         (x)var1 ID,   (y)var2 ID,   (high)var3 ID
    Scatter:   m0,           m12,          mh      



