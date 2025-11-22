module MathProgBenchmarks

using DataDeps
using GZip
using Logging
using QPSReader

include("datasets.jl")
include("instances.jl")
include("lists.jl")

export Dataset, MIPLIB2017, MIPLIB2017Benchmark, Netlib
export read_instance
export list_instances

function __init__()
    register(
        DataDep(
            "miplib2017-collection",
            """
            All instances in the MIPLIB 2017 collection set (size: 3.5 GB).
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/collection.zip",
            post_fetch_method = unpack,
        ),
    )
    register(
        DataDep(
            "miplib2017-benchmark",
            """
            All instances in the MIPLIB 2017 benchmark set (size: 317 MB).
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/benchmark.zip",
            post_fetch_method = unpack,
            "c756eefd544d83b31809306b45d3549a1a5b9378e6aa78b68738b1a3b6a418fa"
        ),
    )
    register(
        DataDep(
            "miplib2017-collection-list",
            """
            List of instances in the MIPLIB 2017 collection.
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/collection-v1.test",
            "c416f857083e2b7ec6edad87acc80437e2ea4be65debdbe7c4f3072881981c3f"
        ),
    )
    register(
        DataDep(
            "miplib2017-benchmark-list",
            """
            List of instances in the MIPLIB 2017 benchmark.
            Source: https://miplib.zib.de/index.html.""",
            "https://miplib.zib.de/downloads/benchmark-v2.test",
            "0ee9758dba64bb1689cc121c794ee547992a046bcabe1cce9ea79158375dabd5"
        ),
    )
    return nothing
end

end # module MathProgBenchmarks
