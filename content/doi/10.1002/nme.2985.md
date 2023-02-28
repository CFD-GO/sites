---
doi: 10.1002/nme.2985
title: An efficient framework for fluid-structure interaction using the lattice Boltzmann
  method and immersed moving boundaries
authors:
- D Owen
- C Leonardi
- Y Feng
keywords:
- discrete element method
- fluid structure interaction
- immersed moving boundary
- lattice boltzmann method
- multibody coupling
date: '2011-07-08'
journal: International Journal for Numerical Methods in Engineering
publisher: ~
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
redirect: https://doi.org/10.1002/nme.2985         # DELETE THIS TO NOT REDIRECT
realauthors:
  D Owen: D.R.J. Owen
  C Leonardi: C.R. Leonardi
  Y Feng: Y.T. Feng
---
{{< author "D Owen" "D.R.J. Owen" >}}, {{< author "C Leonardi" "C.R. Leonardi" >}}, {{< author "Y Feng" "Y.T. Feng" >}}

## Abstract
This paper presents a serial computational framework that hydrodynamically couples the lattice Boltzmann method (LBM) and the discrete element method (DEM) for the solution of particle suspension problems in two and three dimensions. The single-relaxation-time Bhatnagar-Gross-Krook (LBGK) form of the lattice Boltzmann equation is employed with an immersed moving boundary method for the fluid-structure interaction. Similar algorithms have been previously reported in the literature, however, this work deliberately utilizes solution options that minimize the computational overheads of the framework to facilitate simulations of multibody structural fields in large fluid domains. In particular, mixed boundary conditions are employed which combine the simple bounce-back technique with the immersed moving boundary method, and the relatively inexpensive D3Q15 lattice is employed for 3D solutions. The fundamentals of the LBM are briefly discussed followed by a review of the coupling techniques available for FSI using the LBM. Options for mapping solid obstacles to the LBM grid are presented and an algorithm for automatic, dynamic subcycling of the two explicit solution schemes is outlined. The LBM-DEM framework is then validated and benchmarked against previously published LBM results, with comments made where appropriate on the comparative accuracy and convergence characteristics. Finally, a multi-particle suspension simulation is presented to qualitatively assess the performance of the framework when a large number of dynamic contacts exist. © 2010 John Wiley & Sons, Ltd.
