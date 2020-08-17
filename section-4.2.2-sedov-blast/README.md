# Sedov blast wave with self-gravity

To set up everything to run the Sedov self-gravity test, change your working directory to this folder.
Then, start the Julia REPL and execute the following commands to install all required
dependencies.
```julia
julia> import Pkg

julia> Pkg.activate("..")

julia> Pkg.instantiate()

julia> using Trixi

julia> const EXAMPLE_DIR = joinpath(pathof(Trixi) |> dirname |> dirname, "examples", "euler_gravity_paper")
```
After that, you can generate the Sedov self gravity data for the figures by running the following code in the Julia REPL.

## Sec. 4.2.2, Table 6, Sedov + gravity, performance uniform vs. AMR
**AMR mesh:**
```julia
Trixi.run(joinpath(EXAMPLE_DIR, "parameters_sedov_self_gravity.toml"))
```

**Uniform mesh:**
```julia
Trixi.run(joinpath(EXAMPLE_DIR, "parameters_sedov_self_gravity.toml"),
          amr_interval=0)
```

### To postprocess the solution files use
```
/postprocessing/trixi2vtk --nvisnodes 16 --format vti
```
Then one can generate the plots using a visualization tool like Paraview
