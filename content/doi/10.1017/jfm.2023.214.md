---
doi: 10.1017/jfm.2023.214
title: Hydrodynamic clogging of micro-particles in planar channels under electrostatic forces
authors:
- N Di Vaira
- L Laniewski-Wollk
- R Johnson
- S Aminossadati
- C Leonardi
keywords:
- computational methods
- particle/fluid flow
- suspensions
date: '2023-04-10'
journal: Journal of Fluid Mechanics
publisher: Cambridge University Press
scopus_cite: 1
pub_type: Article
tclb: publications
mcf: publications
image: img/doi/10.1017/jfm.2023.214/Abstract.jpeg
realauthors:
- N Di Vaira: N.J. Di Vaira
- L Laniewski-Wollk: L. Łaniewski-Wołłk
- R Johnson: R.L. Johnson
- S Aminossadati: S.M. Aminossadati
- C Leonardi: C.R. Leonardi
---

![Flow around an arch](/img/doi/10.1017/jfm.2023.214/Abstract.jpeg)

Particle clogging can occur in any scenario where a flow path or constriction is small relative to the size of objects trying to pass through it - think of flow through silos, blood flows through needles, and even the evacuation of crowds through barrieres. It originates from the formation of a single arch, behind which an entire flow path can become blocked. This work is the first time hydrodynamic clogging has been thoroughly investigated in planar channels. We also studied the effects of electrostatic forces, which become significant for micro-particles.

The primary outcome of the work is detailed maps showing where clogging will occur based on the particle solid volume fraction. These maps present significantly-improved predictions of clogging compared to the current methods that are used for particle transport through subsurface fractures and microfluidic devices. We also show that strong electrostatics increases the probability of clogging, due to attachment to the channel surfaces.

Each parametric map was generated using a stochastic methodology based on up to 100 separate fluid-particle simulations, each of which could contain up to 800,000 lattice elements. The efficient computation of these simulations was enabled by our group's LBM solver, TCLB, which includes coupling to open-source DEM solvers (so far LIGGGHTS and ESyS-Particle) and MPI capability for HPC GPU clusters. The LBM solid coupling model we used for these simulations - the partially saturated method - comes ready-coded with the installation of TCLB. 

{{< youtube HyxKbEa8Dt8 >}}
