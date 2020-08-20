# Jeans instability

To set up everything to run the Jeans instability test, change your working directory to this folder.
Then, start the Julia REPL and execute the following commands to install all required
dependencies.
```julia
julia> import Pkg

julia> Pkg.activate("..")

julia> Pkg.instantiate()

julia> using Trixi

julia> const EXAMPLES_DIR = joinpath(pathof(Trixi) |> dirname |> dirname, "examples", "paper-self-gravitating-gas-dynamics")
```
After that, you can reproduce the Jeans instability data by running the following code in the Julia REPL.
Note that the analysis interval is set to 1 in order to generate enough data for smoother plots.


## Sec. 4.2.1, Figure 3, Jeans test with gravity updated every Euler RK stage
```julia
julia> Trixi.run(joinpath(EXAMPLES_DIR, "parameters_jeans_instability.toml",
                 analysis_interval=1)
```

## Sec. 4.2.1, Figure 4, Jeans test with gravity updated every Euler RK time step
```julia
julia> Trixi.run(joinpath(EXAMPLES_DIR, "parameters_jeans_instability.toml",
                 analysis_interval=1,
                 update_gravity_once_per_stage=false)
```

For either run you generate the figure using the python script `jeans_all_in_one.py`.
This script accesses the precomuted exact energy profiles stored in `E_kin.txt`,
`E_int.txt` and `E_pot.txt` and creates a plot saved as a pdf.
