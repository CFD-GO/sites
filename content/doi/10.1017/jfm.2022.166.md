---
doi: 10.1017/jfm.2022.166
title: Influence of particle polydispersity on bulk migration and size segregation
  in channel flows
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
date: '2022-05-25'
journal: Journal of Fluid Mechanics
publisher: Cambridge University Press
scopus_cite: 3
pub_type: Article
tclb: publications
mcf: publications
image: img/doi/10.1017/jfm.2022.166/Abstract.jpeg
realauthors:
- N Di Vaira: N.J. Di Vaira
- L Laniewski-Wollk: L. Łaniewski-Wołłk
- R Johnson: R.L. Johnson
- S Aminossadati: S.M. Aminossadati
- C Leonardi: C.R. Leonardi
---

![Render of plugging of smallest particles](/img/doi/10.1017/jfm.2022.166/Abstract.jpeg)

In this work we investigated the phenomenon of shear-induced migration for polydisperse suspensions for the first time. Shear-induced migration is basically the diffusion of particles in the direction of decreasing shear rate, caused by the accumlation of random particle collisions in sheared flows. In channels, it results in the accumulation of particles at the channel centre and a flattening of the velocity profile.  These concepts have long been established and investigated for monodisperse suspensions (all particles of the same size), and some works have even investigated bidisperse suspensions (particles of two different sizes), demonstrating that the larger particles preferentially migrate towards the channel centre.

Our study required us to simulate thousands of particles over large time scales, seeing as the development lengths of shear-induced migration are orders of magnitude longer than pure fluid flows. We achieved this using our group's LBM solver, TCLB, which includes coupling to open-source DEM solvers (so far LIGGGHTS and ESyS-Particle) and MPI capability for HPC GPU clusters. Overall, the publication includes nearly 100 LBM-DEM simulations (pictured below), each conducted on 4 GPU cores for 24 hours. The LBM solid coupling model we used for these simulations - the partially saturated method - comes ready-coded with the installation of TCLB.

This work made two fundamental discoveries. Firstly, when plugging occurs in the channel centre (due to high solid volume fraction) it is the smallest particles which preferentially form the plugs, and this occurs for both bidisperse and polydisperse suspensions. Secondly, the first three statistical moments of a suspension's particle size distribution completely characterise shear-induced migration. In this way, statistically-equivalent bidisperse and polydisperse suspensions exhibit the same migration.

These results could now form the basis for new particle separation microfluidic devices, and improve our understanding of dense suspension flows in unobservable subsurface environments.

![Shear-induced migration test cell](/img/doi/10.1017/jfm.2022.166/Fig16c.png)


