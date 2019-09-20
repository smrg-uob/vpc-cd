vpc-cd: Volume Phase Congruency - Crack Detection
=====================================================
What is this?
-------------

A code that uses matlab to find the geometric location of a crack in a sample from full-field displacement
 data found from Digital Image Correlation (DIC) and Digital Volume Correlation (DVC). Developed by Ahmet 
Cinar and Simon Tonge at the Universities of Sheffield and Bristol, UK. This code processess a displacement field
found in DIC or DVC, firstly by deleting inaccurate displacements in the vicinity of the crack and using the inpaint_nans 
method refills them. It is then possible to find the cartesian co-ordinates of the crack mouth and tip in the 
displacement field and to segment the crack. The Mode I Crack Opening Displacement (COD) can then be found for all 
positions along the crack. 

Installation
------------

Simply copy files in the folder title VPC-CD into the MATLAB file path.

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


 