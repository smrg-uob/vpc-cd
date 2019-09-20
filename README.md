vpc-cd: Volumetric Phase Congruency Crack Detection
===============================================


[![DOI](https://zenodo.org/badge/209755036.svg)](https://zenodo.org/badge/latestdoi/209755036)

![vpc-cd](vpccdvisual.png)

What is vpc-cd?
-------------

vpc-cd uses volumetric phase congruency to find the geometric location of a crack 
in a sample from full-field displacement data captured using Digital Image 
Correlation (DIC) or Digital Volume Correlation (DVC). It has been developed by Ahmet 
Cinar and Simon Tonge at the Universities of Sheffield and Bristol, UK. 

Displacement fields are pre-processed by first deleting inaccurate displacements 
in the vicinity of the crack (and using the inpaint_nans to refill them). 
Volumetric phase congruency is then used to segment the crack, which allows the 
cartesian co-ordinates of the crack mouth and crack tip to be extracted. This, 
in turn, allows the mode I crack opening displacement (COD) to be found for all 
positions along the crack. 

More detailed information about the precise implementation can be found in the 
associated journal publication:

Cinar, A. F., Barhli, S. M., Hollis, D., Flansbjer, M., Tomlinson, R. A., Marrow, T. J., & Mostafavi, M. (2017). 
An autonomous surface discontinuity detection and quantification method by digital 
image correlation and phase congruency. Optics and Lasers in Engineering. 
<https://doi.org/10.1016/j.optlaseng.2017.04.010>


Installation
------------

Simply copy files in the folder title vpc-cd into the MATLAB file path.


Dependencies
------------

The following must be on the MATLAB file path.

Peter Kovesi.   MATLAB and Octave Functions for Computer Vision and Image Processing.
Available from:
<http://www.peterkovesi.com/matlabfns/>. 

John D'Errico. inpaint_nans 
version 1.1.0.0 
Available from:
<https://uk.mathworks.com/matlabcentral/fileexchange/4551-inpaint_nans>.


 