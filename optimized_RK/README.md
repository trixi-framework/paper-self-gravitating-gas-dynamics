# Optimized Runge-Kutta methods for hyperbolic diffusion

To optimize explicit low-storage Runge-Kutta methods for the hyperbolic diffusion problem,
you need Julia and MATLAB with [RK-Opt](https://github.com/ketch/RK-opt), with `RK-opt/polyopt`
and `RK-opt/RK-coeff-opt` added to the path of MATLAB.

1. Generate the spectrum of the hyperbolic diffusion problem by running the Jupyter notebook `spectrum_Trixi.ipynb`.
2. Optimize stability polynomials by running `optimize_stability_polynomials.m` in MATLAB.
3. Optimize stability polynomials by running `optimize_RK_schemes.m` in MATLAB.
   You should get files with names similar to [3Sstar-2-5_2020-08-13T09-04-19.txt](3Sstar-2-5_2020-08-13T09-04-19.txt),
   depending on the time of execution. You will probably get different coefficients, since the global optimization
   problem relies on randomly distributed starting points.
