---
doi: 10.1016/j.camwa.2018.01.002
title: Improved coupling of time integration and hydrodynamic interaction in particle
  suspensions using the lattice Boltzmann and discrete element methods
authors:
- D Wang
- C Leonardi
- S Aminossadati
realauthors:
- D. Wang
- C.R. Leonardi
- S.M. Aminossadati
keywords:
- discrete element method
- fluid-particle interactions
- lattice boltzmann method
- partially saturated boundary
- two-relaxation-time
date: '2018-04-01'
journal: Computers and Mathematics with Applications
publisher: Elsevier Ltd
auto_content: yes                        # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                           # DELETE THIS TO NOT AUTO GENERATE METADATA
image: /img/doi/10.1016/j.camwa.2018.01.002/firstpage.png
showonlyimage: yes
---
[D. Wang](https://www.scopus.com/authid/detail.uri?authorId=57200546044), [C.R. Leonardi](https://www.scopus.com/authid/detail.uri?authorId=25646377900), [S.M. Aminossadati](https://www.scopus.com/authid/detail.uri?authorId=10739803900)

## Abstract
© 2018 Elsevier LtdThis paper introduces improvements to the simulation of particle suspensions using the lattice Boltzmann method (LBM) and the discrete element method (DEM). First, the benefit of using a two-relaxation-time (TRT) collision operator, instead of the popular Bhatnagar–Gross–Krook (BGK) collision operator, is demonstrated. Second, a modified solid weighting function for the partially saturated method (PSM) for fluid–solid interaction is defined and tested. Results are presented for a range of flow configurations, including sphere packs, duct flows, and settling spheres, with good accuracy and convergence observed. Past research has shown that the drag, and consequently permeability, predictions of the LBM exhibit viscosity-dependence when used with certain boundary conditions such as bounce-back or interpolated bounce-back, and this is most pronounced when the BGK collision operator is employed. The improvements presented here result in a range of computational viscosities, and therefore relaxation parameters, within which drag and permeability predictions remain invariant. This allows for greater flexibility in using the relaxation parameter to adjust the LBM timestep, which can subsequently improve synchronisation with the time integration of the DEM. This has significant implications for the simulation of large-scale suspension phenomena, where the limits of computational hardware persistently constrain the resolution of the LBM lattice.
