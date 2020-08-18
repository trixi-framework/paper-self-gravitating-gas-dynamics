# Convergence tests

To set up everything to run the convergence tests, change your working directory to this folder.
Then, start the Julia REPL and execute the following commands to install all required
dependencies.
```julia
julia> import Pkg

julia> Pkg.activate("..")

julia> Pkg.instantiate()

julia> using Trixi

julia> const EXAMPLES_DIR = joinpath(pathof(Trixi) |> dirname |> dirname, "examples", "repro-self-gravitating-gas-dynamics")
```
After that, you can reproduce the convergence experiments by running the following code in the Julia REPL.


## Sec. 4.1.1, Table 2, EOC tests compressible Euler

**N = 3**:
```julia
julia> Trixi.convtest(joinpath(EXAMPLES_DIR, "parameters_eoc_test_euler.toml"), 4)
```

**N = 4**:
```julia
julia> Trixi.convtest(joinpath(EXAMPLES_DIR, "parameters_eoc_test_euler.toml"), 4, N=4)
```


## Sec. 4.1.2, Table 3, EOC tests hyperbolic diffusion

**N = 3**:
```julia
julia> Trixi.convtest(joinpath(EXAMPLES_DIR, "parameters_eoc_test_hyperbolic_diffusion.toml"), 4)
```

**N = 4**:
```julia
julia> Trixi.convtest(joinpath(EXAMPLES_DIR, "parameters_eoc_test_hyperbolic_diffusion.toml"), 4, N=4)
```


## Sec. 4.1.3, Table 4, EOC tests coupled Euler-gravity

**N = 3**:
```julia
julia> Trixi.convtest(joinpath(EXAMPLES_DIR, "parameters_eoc_test_coupled_euler_gravity.toml"), 4)
```

**N = 4**:
```julia
julia> Trixi.convtest(joinpath(EXAMPLES_DIR, "parameters_eoc_test_coupled_euler_gravity.toml"), 4, N=4)
```

## Sec. 4.1.3, Table 5, EOC tests coupled Euler-gravity (update gravity once per step)

```julia
julia> Trixi.convtest(joinpath(EXAMPLES_DIR, "parameters_coupling_convergence_test.toml"), 4,
                      update_gravity_once_per_stage=false)
```
