# MathProgBenchmarks.jl

A Julia package for automatic download and parsing of linear, quadratic and integer programming instances.

Supported datasets:

- [x] [Netlib](https://www.netlib.org/lp/data/index.html)
- [x] [MIPLIB 2017](https://miplib.zib.de/index.html)
- [x] [Mittelmann LP benchmark](https://plato.asu.edu/ftp/lptestset/)

## Getting started

1. To see which instances are available, call `list_instances(dataset, name)`.
2. To read a specific instance, call `read_instance(dataset, name)`.
3. The returned problem format is `QPSData` from [QPSReader.jl](https://github.com/JuliaSmoothOptimizers/QPSReader.jl).

More details are available in the docstrings.

## Tips

The problem source files are downloaded automatically thanks to [DataDeps.jl](https://github.com/oxinabox/DataDeps.jl).
Note that each download has to be validated manually from the REPL.
This doesn't work well when the triggering line of code is executed with VSCode's Julia extension, better run it in the REPL directly.
An alternative is to set `ENV["DATADEPS_ALWAYS_ACCEPT"] = true`.

The decompressed instances can be rather large (over 80 GB for the complete MIPLIB 2017 collection).
If you need to clean up some space, you can delete unneeded files inside the folder located at `MathProgBenchmarks.MPS_SCRATCH`.
