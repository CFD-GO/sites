---
doi: 10.1016/j.camwa.2023.05.020
title: Revisiting the second-order convergence of the lattice Boltzmann method with
  reaction-type source terms
authors:
- G Gruszczynski
- M Dzikowski
- L Laniewski-Wollk
keywords:
- lattice boltzmann method
- reaction equation
- second-order convergence
- source term
date: '2023-08-15'
journal: Computers and Mathematics with Applications
publisher: Elsevier Ltd
scopus_cite: 1
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
redirect: https://doi.org/10.1016/j.camwa.2023.05.020 # DELETE THIS TO NOT REDIRECT
realauthors:
- G Gruszczynski: G. Gruszczyński
- M Dzikowski: M. Dzikowski
- L Laniewski-Wollk: Ł. Łaniewski-Wołłk
---


## Abstract
This study analyses an approach to consistently recover the second-order convergence of the lattice Boltzmann method (LBM), which is frequently degraded by an improper discretisation of the required source terms. The current work focuses on advection-diffusion models, in which the source terms are dependent on the intensity of transported fields. Such terms can be observed in reaction-type equations used in heat and mass transfer problems or multiphase flows. The investigated scheme is applicable to a wide range of formulations within the LBM framework. All considered source terms are interpreted as contributions to the zeroth-moment of the distribution function. These account for sources in a scalar field, such as density, concentration, temperature or a phase field. Further application of this work can be found in the method of manufactured solutions or in the immersed boundary method. This paper is dedicated to three aspects regarding proper inclusion of the source term in LBM schemes. Firstly, it identifies the differences observed between the ways in which source terms are included in the LBM schemes present in the literature. The algebraic manipulations are explicitly presented in this paper to clarify the observed differences, and to identify their origin. Secondly, it analyses in full detail, the implicit relation between the value of the transported macroscopic field, and the sum of the LBM densities. This relation is valid for any source term discretization scheme. It is a crucial ingredient for preserving the second-order convergence in the case of complex source terms. Moreover, three equivalent forms of the second-order accurate collision operator are presented. Finally, closed form solutions of this implicit relation are shown for a variety of common models, including general linear and second order terms; population growth models, such as the Logistic or Gompertz model and the Allen-Cahn equation. The second-order convergence of the proposed LBM schemes is verified on both linear and non-linear source terms. The pitfalls of the commonly used acoustic and diffusive scalings are identified and discussed. Furthermore, for a simplified case, the competing errors are shown visually with isolines of error in the space of spatial and temporal resolutions.
