# A purely hyperbolic discontinuous Galerkin approach for self-gravitating gas dynamics

[![License: MIT](https://img.shields.io/badge/License-MIT-success.svg)](https://opensource.org/licenses/MIT)
[![DOI](https://zenodo.org/badge/DOI/TODO.svg)](https://doi.org/TODO)

This repository contains some code used in the article
```
@online{schlottke2020purely,
  title={A purely hyperbolic discontinuous {G}alerkin approach for
         self-gravitating gas dynamics},
  author={Schlottke-Lakemper, Michael and Winters, Andrew R and
          Ranocha, Hendrik and Gassner, Gregor},
  year={2020},
  month={08},
  eprint={2008.TODO},
  eprinttype={arxiv},
  eprintclass={math.NA}
}
```

> One of the key challenges when simulating astrophysical flows with self-gravity is to compute the
gravitational forces. In contrast to the hyperbolic hydrodynamic equations, the gravity field is
described by an elliptic Poisson equation. Thus, it requires special numerical treatment. To avoid
this issue, we present a purely hyperbolic approach for self-gravitating gas dynamics. We
reformulate the elliptic problem into a hyperbolic diffusion problem, which is solved iteratively
using the same explicit high-order discontinuous Galerkin method we use for the flow solution. The
flow and the gravity solvers operate on a joint hierarchical Cartesian mesh and are two-way coupled
via the volumetric source terms. A key benefit of our approach is that it allows to reuse existing
explicit hyperbolic solvers without modifications, while retaining their advanced features such as
non-conforming and solution-adaptive grids. By updating the gravitational field in each Runge-Kutta
stage of the hydrodynamics solver, high-order convergence is achieved even in coupled multi-physics
simulations. After verifying the expected order of convergence for single-physics and multi-physics
setups, we validate our approach by a simulation of the Jeans gravitational instability.
Furthermore, we demonstrate the full capabilities of our numerical framework by computing a
self-gravitating Sedov blast with shock capturing in the flow solver and adaptive mesh refinement
for the entire coupled system.


If you find these results useful, please cite the article mentioned above. If you
use the implementations provided here, please cite this repository as
```
@misc{schlottke2020purelyRepro,
  title={{trixi\_euler\_gravity\_repro}.
         {A} purely hyperbolic discontinuous {G}alerkin approach for
         self-gravitating gas dynamics},
  author={Schlottke-Lakemper, Michael and Winters, Andrew R and
          Ranocha, Hendrik and Gassner, Gregor},
  year={2020},
  month={08},
  howpublished={\url{https://github.com/trixi-framework/trixi_euler_gravity_repro}},
  doi={TODO}
}
```


## Numerical experiments

The numerical experiments presented in the paper use [Trixi.jl](https://github.com/trixi-framework/Trixi.jl),
flexible tree-based numerical simulation framework for PDEs written in Julia. To reproduce the numerical
experiments, you need to install [Julia](https://julialang.org/).

The subfolders of this repository contain README.md files with instructions to reproduce the numerical
experiments, including postprocessing.

The numerical experiments were carried out using Julia v1.5.0.
The MATLAB scripts were executed using MATLAB R2018a.


## Disclaimer

Everything is provided as is and without warranty. Use at your own risk!
