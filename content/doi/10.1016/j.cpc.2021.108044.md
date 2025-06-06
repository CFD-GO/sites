---
doi: 10.1016/j.cpc.2021.108044
title: Memory-efficient Lattice Boltzmann Method for low Reynolds number flows
authors:
- M Matyka
- M Dzikowski
keywords:
- cfd
- lattice boltzmann method
- lbm
- memory
date: '2021-10-01'
journal: Computer Physics Communications
publisher: Elsevier B.V.
scopus_cite: 6
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
tclb: publications
redirect: https://doi.org/10.1016/j.cpc.2021.108044 # DELETE THIS TO NOT REDIRECT
realauthors:
- M Matyka: M. Matyka
- M Dzikowski: M. Dzikowski
image: /img/doi/10.1016/j.cpc.2021.108044/firstpage.png
showonlyimage: yes
---


## Abstract
The Lattice Boltzmann Method algorithm is simplified by assuming constant numerical viscosity (the relaxation time is fixed at τ=1). This leads to the removal of the distribution function from the computer memory. To test the solver the Poiseuille and Driven Cavity flows are simulated and analyzed. The error of the solution decreases with the grid size L as L−2. Compared to the standard algorithm, the presented formulation is simpler and shorter in implementation. It is less error-prone and needs significantly less working memory in low Reynolds number flows. Our tests showed that the algorithm is less efficient in multiphase flows. To overcome this problem, further extension and the moments-only formulation was derived, inspired by the Multi-Relaxation Time (MRT) approach for single component multiphase flows.
