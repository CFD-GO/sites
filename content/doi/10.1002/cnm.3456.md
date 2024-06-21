---
doi: 10.1002/cnm.3456
title: Lattice Boltzmann simulation of transient blood flow in arterial geometries
  using a regularised, viscoplastic and shear-thinning fluid
authors:
- B Hill
- C Leonardi
keywords:
- computational fluid dynamics
- kuang-luo rheology
- lattice boltzmann method
- transient blood flow
date: '2021-08-01'
journal: International Journal for Numerical Methods in Biomedical Engineering
publisher: John Wiley and Sons Inc
scopus_cite: 4
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
tclb: publications
mcf: publications
redirect: https://doi.org/10.1002/cnm.3456         # DELETE THIS TO NOT REDIRECT
realauthors:
- B Hill: B.M. Hill
- C Leonardi: C.R. Leonardi
---


## Abstract
This paper presents a lattice Boltzmann framework for the transient simulation of blood flow using biologically inspired geometries and pressure boundary conditions. The Kuang-Luo rheological model is used to represent blood as a homogeneous continuum. This model includes the two primary non-Newtonian characteristics of blood, namely viscoplasticity and pseudoplasticity. This paper makes two contributions. First, the numerical challenges associated with zero strain rates and infinite viscosity, as a consequence of the yield stress in the Kuang-Luo model, were addressed by regularising the constitutive equation so that the viscosity tends towards a finite value at low strain rates. A two-relaxation-time operator, which exhibits improved performance over the single-relaxation-time operator and lower computational overhead than the multiple-relaxation-time operator, is employed in the collision process. The recursive relationship between the local strain rate and relaxation rate was addressed by use of an implicit solver for these two quantities. The implemented model was benchmarked against analytic solutions for Poiseuille flow between parallel plates in two dimensions and in a cylindrical tube in three dimensions. More importantly, the transient performance of the implemented model was demonstrated by matching the predicted start-up flow of the Poiseuille flow of a Bingham fluid with the corresponding analytical solution. Second, the numerical developments were applied in the simulation of transient blood flow in complex configurations. The development and implementation of physically inspired pressure profiles highlighted the shortcomings of using a sinusoidal pressure profile in the prediction of velocity and stress distributions. Finally, the simulation of blood flow in a section of a carotid artery indicated a number of flow characteristics that will be of interest to future investigations of clinical problems.
