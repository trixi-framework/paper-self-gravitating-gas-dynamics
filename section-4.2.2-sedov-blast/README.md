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
julia> Trixi.run("parameters_sedov_self_gravity.toml", t_end=0.5)
```

**T = 1.0:**
```julia
julia> Trixi.run("parameters_sedov_self_gravity.toml")
```

## Sec. 4.2.2, Figure 7a, T=0.5, Sedov + gravity
**AMR mesh:**
```julia
julia> Trixi.run("parameters_sedov_self_gravity.toml", t_end=0.5)
```

**Uniform mesh:**
```julia
julia> Trixi.run("parameters_sedov_self_gravity.toml", amr_interval=0, initial_refinement_level=8, t_end=0.5)
```

## Sec. 4.2.2, Figure 7b, T=1.0, Sedov + gravity
**AMR mesh:**
```julia
julia> Trixi.run("parameters_sedov_self_gravity.toml")
```

**Uniform mesh:**
```julia
julia> Trixi.run("parameters_sedov_self_gravity.toml", amr_interval=0, initial_refinement_level=8)
```

## Sec. 4.2.2, Table 6, Sedov + gravity, performance uniform vs. AMR
**AMR mesh:**
```julia
julia> Trixi.run("parameters_sedov_self_gravity.toml")
```

**Uniform mesh:**
```julia
julia> Trixi.run(parameters_sedov_self_gravity.toml", amr_interval=0)
```

## Converting Trixi.jl's .h5 files to VTK/VTI
To postprocess the solution files, you first need to manually install some
dependencies. Start a fresh Julia REPL and execute the following commands (only
required *once*):
```julia
julia> import Pkg

julia> Pkg.add("ArgParse")

julia> Pkg.add("HDF5")

julia> Pkg.add("TimerOutputs")

julia> Pkg.add("WriteVTK")

julia> Pkg.add("ProgressMeter")
```

When working with the postprocessing tools, start Julia und load Trixi.jl
with the same startup sequence as [above](#sedov-blast-wave-with-self-gravity).
You can then convert the HDF5 output files of Trixi.jl to VTK-compatible file by
switching to shell mode (enter `;`) and running
```julia
shell> $TRIXI_DIR/postprocessing/trixi2vtk --nvisnodes 8 --format vti out/solution_euler_000000.h5

shell> $TRIXI_DIR/postprocessing/trixi2vtk --nvisnodes 8 --format vti out/solution_gravity_000000.h5
```
Then one can generate the plots using a visualization tool like [ParaView](https://www.paraview.org)
or [VisIt](https://visit.llnl.gov).
