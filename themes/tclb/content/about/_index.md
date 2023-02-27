---
title: TCLB Solver
---
![TCLB Solver Header](https://raw.githubusercontent.com/CFD-GO/documents/master/assets/header.png)

TCLB is a MPI+CUDA or MPI+CPU high-performance Computational Fluid Dynamics simulation code, based on the Lattice Boltzmann Method.
It provides a clear interface for calculation of complex physics, and the implementation of new models.

### Authors

TCLB began development in 2012 with the aim at providing a framework for efficient CFD computations with LBM, mainly for research.

Author: [Łukasz Łaniewski-Wołłk](https://github.com/llaniewski)

Co-authors:
* [Michał Dzikowski](https://github.com/mdzik)

Contributors:
* [Wojtek Regulski](https://github.com/wojtasMEiL)
* [Zbigniew Gawłowicz](https://github.com/zgawlowicz)
* [Mariusz Rutkowski](https://github.com/mrutkowski-aero)
* [Dmytro Sashko](https://github.com/shkodm)
* [Travis Mitchell](https://github.com/TravisMitchell)
* [Paweł Obrępalski](https://github.com/PabloOb)
* [Grzegorz Gruszczyński](https://github.com/ggruszczynski)

Developed at:
- [Zakład Aerodynamiki](https://meil.pw.edu.pl/ZA/) at [Politechnika Warszawska (Warsaw University of Technology)](http://pw.edu.pl/)
- [School of Mechanical & Mining Engineering](https://www.mechmining.uq.edu.au/) at [University of Queensland](http://uq.edu.au/)

### Citation
Please use **appropriate citations if using this software** in any research publication. The publication should cite [the original paper about TCLB](https://doi.org/10.1016/j.camwa.2015.12.043) and papers which describe the used LMB models. You can find the list of TCLB publications at [docs.tclb.io/general-info/publications/](https://docs.tclb.io/general-info/publications/). You can also find the information about published articles in the source code of the models.
The code can be cited additionally, by its [Zenodo DOI](https://doi.org/10.5281/zenodo.3550331).

### License

This software is distributed under the [GPL v3 License](LICENSE).

If you need this software under a different license, please contact the main author. Contact: llaniewski([monkey](https://en.wikipedia.org/wiki/At_sign#Names_in_other_languages))meil.pw.edu.pl

### Supported architectures

This code is designed to run on **Linux**. We strongly recommend using Linux for compilation, computation and postprocessing.

Nevertheless, TCLB can be compiled on Windows (CPU only), using the [Windows Subsystem for Linux](https://pl.wikipedia.org/wiki/Windows_Subsystem_for_Linux). It also can be compiled on MacOS (also CPU only). Both Debian and Red Hat based Linux distributions are supported by the `install.sh` script described below, as is MacOS (with `brew` package manager).

### LBM-DEM computation

TCLB code can be coupled with Discrete Element Method (DEM) codes, to enable computation of flow with particles.

The DEM codes that TCLB can be integrated with are:
- [LIGGGHTS](https://www.cfdem.com/liggghts-open-source-discrete-element-method-particle-simulation-code)
- [LAMMPS](https://lammps.sandia.gov/)
- [ESYS-Particle](https://launchpad.net/esys-particle)

Refer to the documentation for instructions on compilation and coupling.
