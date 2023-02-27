---
doi: 10.1016/j.ijheatmasstransfer.2022.123259
title: A comparative study of 3D cumulant and central moments lattice Boltzmann schemes
  with interpolated boundary conditions for the simulation of thermal flows in high
  Prandtl number regime
authors:
- G Gruszczynski
- L Laniewski-Wollk
realauthors:
- G. Gruszczyński
- Ł. Łaniewski-Wołłk
keywords:
- central moments lattice boltzmann method
- cumulant lattice boltzmann method
- heat transfer
- high-order moments
- interpolated (anti-)bounce-back
date: '2022-11-15'
journal: International Journal of Heat and Mass Transfer
publisher: Elsevier Ltd
auto_content: yes                        # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                           # DELETE THIS TO NOT AUTO GENERATE METADATA
image: /img/doi/10.1016/j.ijheatmasstransfer.2022.123259/firstpage.png
showonlyimage: yes
---
[G. Gruszczyński](https://www.scopus.com/authid/detail.uri?authorId=57210809186), [Ł. Łaniewski-Wołłk](https://www.scopus.com/authid/detail.uri?authorId=56719775800)

## Abstract
© 2022 Elsevier LtdThermal flows characterized by high Prandtl number are numerically challenging as the transfer of momentum and heat occurs at different time scales. To account for very low thermal conductivity and obey the Courant-Friedrichs-Lewy condition, the numerical diffusion of the scheme has to be reduced. As a consequence, the numerical artefacts are dominated by the dispersion errors commonly known as wiggles. In this study, we explore possible remedies for these issues in the framework of lattice Boltzmann method by means of applying novel collision kernels, lattices with large number of discrete velocities, namely D3Q27, and a second-order boundary conditions. For the first time, the cumulant-based collision operator is utilised to simulate both the hydrodynamic and the thermal field. Alternatively, the advected field is computed using the central moments’ collision operator. Different relaxation strategies have been examined to account for additional degrees of freedom introduced by a higher order lattice. To validate the proposed kernels for a pure advection-diffusion problem, the numerical simulations are compared against analytical solution of a Gaussian hill. The structure of the numerical dispersion is shown by simulating advection and diffusion of a square indicator function. Next, the influence of the interpolated boundary conditions on the quality of the results is measured in the case of the heat conduction between two concentric cylinders. Finally, a study of steady forced heat convection from a confined cylinder is performed and compared against a Finite Element Method solution. It is known from the literature, that the higher order moments contribute to the solution of the macroscopic advection-diffusion equation. Numerical results confirm that to profit from lattice with a larger number of discrete velocities, like D3Q27, it is not sufficient to relax only the first-order central moments/cumulants of the advected field. In all of the performed benchmarks, the kernel based on the two relaxation time approach has been shown to be superior or at least as good as counter-candidating kernels.
