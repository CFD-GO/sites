---
doi: 10.1016/j.cpc.2022.108548
title: Development and performance of a HemeLB GPU code for human-scale blood flow
  simulation
authors:
- I Zacharoudiou
- J McCullough
- P Coveney
keywords:
- blood flow modelling
- high performance computing
- lattice boltzmann method
date: '2023-01-01'
journal: Computer Physics Communications
publisher: Elsevier B.V.
scopus_cite: 2
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
redirect: https://doi.org/10.1016/j.cpc.2022.108548 # DELETE THIS TO NOT REDIRECT
realauthors:
- I Zacharoudiou: I. Zacharoudiou
- J McCullough: J.W.S. McCullough
- P Coveney: P.V. Coveney
image: /img/doi/10.1016/j.cpc.2022.108548/firstpage.png
showonlyimage: yes
---


## Abstract
In recent years, it has become increasingly common for high performance computers (HPC) to possess some level of heterogeneous architecture - typically in the form of GPU accelerators. In some machines these are isolated within a dedicated partition, whilst in others they are integral to all compute nodes - often with multiple GPUs per node - and provide the majority of a machine's compute performance. In light of this trend, it is becoming essential that codes deployed on HPC are updated to execute on accelerator hardware. In this paper we introduce a GPU implementation of the 3D blood flow simulation code HemeLB that has been developed using CUDA C++. We demonstrate how taking advantage of NVIDIA GPU hardware can achieve significant performance improvements compared to the equivalent CPU only code on which it has been built whilst retaining the excellent strong scaling characteristics that have been repeatedly demonstrated by the CPU version. With HPC positioned on the brink of the exascale era, we use HemeLB as a motivation to provide a discussion on some of the challenges that many users will face when deploying their own applications on upcoming exascale machines. Program summary: Program Title: HemeLB (HemePure_GPU) CPC Library link to program files: https://doi.org/10.17632/jhdv4drxbx.1 Developer's repository link: https://github.com/UCL-CCS/HemePure-GPU Licensing provisions: LGPLv3 Programming language: CUDA C++ Nature of problem: The geometric characteristics of arteries and veins throughout the human body can vary considerably between individuals. This is particularly true for patients with cardiovascular disease. Accurately resolving the dynamics of blood flow within such domains requires a three-dimensional technique that can replicate such variations at high fidelity. The study of full human-scale domains for physiologically relevant timeframes further demands a tool that can be executed efficiently on the advancing technological frameworks available on modern high performance computers. Solution method: HemeLB uses the lattice Boltzmann method [1,2,3,4] to simulate blood flow in complex, three-dimensional sparse vasculatures. A single relaxation time approximation is used [5]. Solid boundaries are modelled using simple bounce-back boundary conditions [6]. Blood flow is driven by applying either velocity or pressure boundary conditions [7]. The localised solution kernels of the algorithm allow for efficient parallelisation of the method to very high core counts. This version of HemeLB outlines the conversion of the code to allow execution on NVIDIA GPUs, currently the most widely used architecture in ultra high performance computers, whilst retaining its capacity for strong scaling to very large core counts. References: [1] S. Succi, The Lattice Boltzmann Equation: For Fluid Dynamics and Beyond, Oxford University Press, 2001. [2] A.A. Mohamad, Lattice Boltzmann Method: Fundamentals and Engineering Applications with Computer Codes, Springer London, 2011. [3] T. Krüger, H. Kusumaatmaja, A. Kuzmin, O. Shardt, G. Silva, and E.M. Viggen, The Lattice Boltzmann Method: Principles and Practice, Springer, 2017. [4] S. Succi, The Lattice Boltzmann Equation: For Complex States of Flowing Matter, Oxford University Press, Oxford, 2018. [5] P.L. Bhatnagar, E.P. Gross, and M. Krook, Physical review, 94 (3) (1954) 511. [6] A.J.C. Ladd and R. Verberg, Journal of statistical physics, 104 (5) (2001) 1191–1251. [7] R.W. Nash, H.B. Carver, M.O. Bernabeu, J. Hetherington, D.K. Groen, T. Krüger, and P.V. Coveney, Phys. Rev. E, 89 (2014) 023303.
