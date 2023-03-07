---
doi: 10.1016/j.camwa.2020.02.020
title: Open-loop optimal control of a flapping wing using an adjoint Lattice Boltzmann
  method
authors:
- M Rutkowski
- W Gryglas
- J Szumbarski
- C Leonardi
- L Laniewski-Wollk
keywords:
- adjoint
- flapping wing
- lattice boltzmann method
- optimal control
- validation
date: '2020-06-15'
journal: Computers and Mathematics with Applications
publisher: Elsevier Ltd
scopus_cite: 2
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
tclb: publications
mcf: publications
redirect: https://doi.org/10.1016/j.camwa.2020.02.020 # DELETE THIS TO NOT REDIRECT
realauthors:
- M Rutkowski: M. Rutkowski
- W Gryglas: W. Gryglas
- J Szumbarski: J. Szumbarski
- C Leonardi: C. Leonardi
- L Laniewski-Wollk: ' Łaniewski-Wołłk'
image: /img/doi/10.1016/j.camwa.2020.02.020/firstpage.png
showonlyimage: yes
---


## Abstract
We present the usage of an adjoint Lattice Boltzmann Method (LBM) for open-loop control of two-dimensional flapping wing motion. Movement of the wing is parametrised with periodic B-Splines, while the wing interacts with the surrounding flow via an Immersed Boundary (IB) method. Multi-objective optimisation is performed using a gradient optimisation algorithm, for which sensitivities are calculated with an adjoint method. The objectives selected were the mean lift force and mechanical power. To achieve performance suitable for optimisation, we also present an efficient GPU implementation of the LBM and adjoint LBM. The Immersed Boundary approach employed for the LBM is verified against results from the literature, while for the flapping case it is compared with two different Finite Volume Method (FVM) approaches. The obtained Pareto front of optimal designs shows a clear discrepancy between the power consumption and the mean lift force. A significant improvement of the basic wing design is demonstrated, and highlights the applicability of adjoint LBM simulations in complex open-loop control problems.
