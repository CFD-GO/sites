---
doi: 10.1103/PhysRevE.96.053301
title: Improved locality of the phase-field lattice-Boltzmann model for immiscible
  fluids at high density ratios
authors:
- A Fakhari
- T Mitchell
- C Leonardi
- D Bolster
keywords: []
date: '2017-11-01'
journal: Physical Review E
publisher: American Physical Societyrevtex@aps.org
scopus_cite: 106
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
redirect: https://doi.org/10.1103/PhysRevE.96.053301 # DELETE THIS TO NOT REDIRECT
realauthors:
  A Fakhari: A. Fakhari
  T Mitchell: T. Mitchell
  C Leonardi: C. Leonardi
  D Bolster: D. Bolster
---
{{< author "A Fakhari" "A. Fakhari" >}}, {{< author "T Mitchell" "T. Mitchell" >}}, {{< author "C Leonardi" "C. Leonardi" >}}, {{< author "D Bolster" "D. Bolster" >}}

## Abstract
© 2017 American Physical Society.Based on phase-field theory, we introduce a robust lattice-Boltzmann equation for modeling immiscible multiphase flows at large density and viscosity contrasts. Our approach is built by modifying the method proposed by Zu and He [Phys. Rev. E 87, 043301 (2013)PLEEE81539-375510.1103/PhysRevE.87.043301] in such a way as to improve efficiency and numerical stability. In particular, we employ a different interface-tracking equation based on the so-called conservative phase-field model, a simplified equilibrium distribution that decouples pressure and velocity calculations, and a local scheme based on the hydrodynamic distribution functions for calculation of the stress tensor. In addition to two distribution functions for interface tracking and recovery of hydrodynamic properties, the only nonlocal variable in the proposed model is the phase field. Moreover, within our framework there is no need to use biased or mixed difference stencils for numerical stability and accuracy at high density ratios. This not only simplifies the implementation and efficiency of the model, but also leads to a model that is better suited to parallel implementation on distributed-memory machines. Several benchmark cases are considered to assess the efficacy of the proposed model, including the layered Poiseuille flow in a rectangular channel, Rayleigh-Taylor instability, and the rise of a Taylor bubble in a duct. The numerical results are in good agreement with available numerical and experimental data.
