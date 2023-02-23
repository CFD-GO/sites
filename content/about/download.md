---
#background: "images/car6.png"
title: "Download and Install"
#section: "section text-center"
#description: "TCLB is an open-source software. The prefered way to use it is to download the source, compile it and run it."
---

## Get it

You can get the source from [github](https://github.com/CFD-GO/TCLB) with:
```bash
git clone https://github.com/CFD-GO/TCLB.git
cd TCLB
```

## Compile it

First you have to configure the compilation:
```bash
make configure
./configure
```

Then you can compile your selected model:
```bash
make d2q9
```

## Run it

To run the solver, just execute the compiled solver with a selected configuration file (you can find some in the examples):
```bash
CLB/d2q9/main example/flow/2d/karman.xml
```
