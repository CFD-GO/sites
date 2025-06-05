---
doi: 10.1016/j.camwa.2019.08.018
title: A cascaded phase-field lattice Boltzmann model for the simulation of incompressible,
  immiscible fluids with high density contrast
authors:
- G Gruszczynski
- T Mitchell
- C Leonardi
- L Laniewski-Wollk
- T Barber
keywords:
- galilean invariance
- incompressible, cascaded lbm
- lattice boltzmann
- multiphase
- phase-field
- taylor bubble
date: '2020-02-15'
journal: Computers and Mathematics with Applications
publisher: Elsevier Ltd
scopus_cite: 30
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
tclb: publications
mcf: publications
redirect: https://doi.org/10.1016/j.camwa.2019.08.018 # DELETE THIS TO NOT REDIRECT
realauthors:
- G Gruszczynski: G. Gruszczyński
- T Mitchell: T. Mitchell
- C Leonardi: C. Leonardi
- L Laniewski-Wollk: Ł. Łaniewski-Wołłk
- T Barber: T. Barber
image: /img/doi/10.1016/j.camwa.2019.08.018/firstpage.png
showonlyimage: yes
---


## Abstract
In this work, a conservative phase-field model for the simulation of immiscible multiphase flows is developed using an incompressible, velocity-based, cascaded lattice Boltzmann method (CLBM). Extensions are made to the lattice Boltzmann (LB) equations for interface tracking and incompressible hydrodynamics, proposed by Fakhari et al. [1], by performing relaxation operations in central moment space. This was motivated by the work of Fei et al. [2,3], where promising results from such a transformation were observed. The relaxation of central moments is defined in a reference frame moving with the fluid, while the existing multiple-relaxation time [4,5] scheme performs collision in a fixed frame of reference. Moreover, the derivations make use of continuous, Maxwellian distribution functions. As a result, the CLBM enhances the Galilean invariance and stability of the method when high lattice Mach numbers are evident. The cascaded scheme has been previously used in the literature to simulate multiphase flows based on the pseudo-potential model, where it allowed for high density and viscosity contrasts to be captured [6,7]. Here, the CLBM is implemented within the phase-field framework and is verified through the analysis of a layered Poiseuille flow. The performance of the CLBM is then investigated in terms of spurious currents, Galilean invariance and computational efficiency. Finally, the work of Fakhari et al. [1] is extended by validating the model's ability to capture the relation between surface tension and the rise velocity of a planar Taylor bubble, in both stagnant and flowing fluids. New counter-current results indicate that the rise velocity model of Ha-Ngoc and Fabre [8] also applies in this regime.
