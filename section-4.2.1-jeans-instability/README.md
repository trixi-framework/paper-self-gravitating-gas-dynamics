# Jeans instability

To set up everything to run the Jeans instability test, change your working directory to this folder.
Then, start the Julia REPL and execute the following commands to install all required
dependencies.
```julia
julia> import Pkg

julia> Pkg.activate("..")

julia> Pkg.instantiate()

julia> using Trixi
```
After that, you can reproduce the Jeans instability data by running the following code in the Julia REPL.


## Sec. 4.2.1, Figures 3 and 4, Jeans instability simulation
**Fig. 3: Jeans test with gravity updated every Euler RK stage:**
```julia
julia> Trixi.run("parameters_jeans_instability.toml", analysis_interval=1)
```

**Fig. 4: Jeans test with gravity updated every Euler RK time step:**
```julia
julia> Trixi.run("parameters_jeans_instability.toml", analysis_interval=1,
                 update_gravity_once_per_stage=false)
```

Note that the analysis interval is set to 1 in order to generate enough data for smoother plots.
For either run you generate the figure using the Python script `jeans_all_in_one.py`:
```bash
./jeans_all_in_one.py analysis.dat
```
This script accesses the precomputed exact energy profiles stored in `E_kin.txt`,
`E_int.txt` and `E_pot.txt` and creates a plot saved as a PDF.


## Sec. 4.2.1, Figures 5, Jeans test gravity sub-cycle distribution
**Fig. 5a:**
```julia
Trixi.run("parameters_jeans_instability.toml")
```

**Fig. 5b:**
```julia
Trixi.run("parameters_jeans_instability.toml",
          time_integration_scheme_gravity="timestep_gravity_erk52_3Sstar!", cfl_gravity=1.2)
```
