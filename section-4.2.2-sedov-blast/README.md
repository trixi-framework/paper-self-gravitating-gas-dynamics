# Sedov blast wave with self-gravity

To set up everything to run the Sedov self-gravity test, change your working directory to this folder.
Then, start the Julia REPL and execute the following commands to install all required
dependencies.
```julia
julia> import Pkg

julia> Pkg.activate("..")

julia> Pkg.instantiate()

julia> using Trixi

julia> const TRIXI_DIR = pathof(Trixi) |> dirname |> dirname
```
After that, you can generate the Sedov self gravity data for the figures by running the following code in the Julia REPL.


## Sec. 4.2.2, Figure 6, T=0.5, AMR meshes for Sedov + gravity
**T = 0.0 and T = 0.5:**
```julia
Trixi.run("parameters_sedov_self_gravity.toml", t_end=0.5)
```

**T = 1.0:**
```julia
Trixi.run("parameters_sedov_self_gravity.toml")
```

## Sec. 4.2.2, Figure 7a, T=0.5, Sedov + gravity
**AMR mesh:**
```julia
Trixi.run("parameters_sedov_self_gravity.toml", t_end=0.5)
```

**Uniform mesh:**
```julia
Trixi.run("parameters_sedov_self_gravity.toml",
          amr_interval=0, initial_refinement_level=8, t_end=0.5)
```

## Sec. 4.2.2, Figure 7b, T=1.0, Sedov + gravity
**AMR mesh:**
```julia
Trixi.run("parameters_sedov_self_gravity.toml")
```

**Uniform mesh:**
```julia
Trixi.run("parameters_sedov_self_gravity.toml", amr_interval=0, initial_refinement_level=8)
```

## Sec. 4.2.2, Table 6, Sedov + gravity, performance uniform vs. AMR
**AMR mesh:**
```julia
julia> Trixi.run("parameters_sedov_self_gravity.toml"))
```

**Uniform mesh:**
```julia
julia> Trixi.run(parameters_sedov_self_gravity.toml", amr_interval=0)
```

## Converting Trixi.jl's .h5 files to VTK/VTI
To postprocess the solution files use
```julia
shell> $TRIXI_DIR/postprocessing/trixi2vtk --nvisnodes 8 --format vti path/to/solution_euler_xxx.h5

shell> $TRIXI_DIR/postprocessing/trixi2vtk --nvisnodes 8 --format vti path/to/solution_gravity_xxx.h5
```
Then one can generate the plots using a visualization tool like Paraview or VisIt.
