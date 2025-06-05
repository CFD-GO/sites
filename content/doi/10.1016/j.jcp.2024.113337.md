---
doi: 10.1016/j.jcp.2024.113337
title: 'Development of a central-moment phase-field lattice Boltzmann model for thermocapillary
  flows: Droplet capture and computational performance'
authors:
- M Holzer
- T Mitchell
- C Leonardi
- U Rude
keywords:
- large scale simulations
- lattice boltzmann method
- performance analysis
- phase-field theory
- thermocapillary flow
date: '2024-12-01'
journal: Journal of Computational Physics
publisher: Academic Press Inc.
scopus_cite: 4
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
mcf: publications
redirect: https://doi.org/10.1016/j.jcp.2024.113337 # DELETE THIS TO NOT REDIRECT
realauthors:
- M Holzer: M. Holzer
- T Mitchell: T.R. Mitchell
- C Leonardi: C.R. Leonardi
- U Rude: U. Rüde
image: /img/doi/10.1016/j.jcp.2024.113337/firstpage.png
showonlyimage: yes
---


## Abstract
This study develops a computationally efficient phase-field lattice Boltzmann (LB) model with the capability to simulate thermocapillary flows. The model was implemented into the open-source simulation framework, WALBERLA, and extended to conduct the collision stage using central moments. The multiphase model was coupled with both a passive-scalar thermal LB and a Runge-Kutta (RK) solution to the energy equation in order to resolve temperature-dependent surface tension phenomena. Various lattice stencils (D3Q7, D3Q15, D3Q19, D3Q27) were tested for the passive-scalar LB, and both the second- and fourth-order RK methods were investigated. There was no significant difference observed in the accuracy of the LB or RK schemes. The passive scalar D3Q7 LB discretisation tended to provide computational benefits, while the second order RK scheme is superior in memory usage. This paper makes contributions relating to the modelling of thermocapillary flows and to understanding the behaviour of droplet capture with thermal sources analogous to thermal tweezers. Four primary contributions to the literature are identified. First, a new 3D thermocapillary, central-moment phase-field LB model is presented and implemented in the open-source software, WALBERLA. Second, the accuracy and computational performance of various techniques to resolve the energy equation for multiphase, incompressible fluids are investigated. Third, the dynamic droplet transport behaviour in the presence of thermal sources is studied, and insight is provided into the potential ability to manipulate droplets based on local domain heating. Finally, a concise analysis of the computational performance and near-perfect scaling results on NVIDIA and AMD GPU-clusters is shown. This research enables the detailed study of droplet manipulation and control in thermocapillary devices by providing a highly-efficient computational modelling methodology.
