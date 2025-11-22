"""
    read_instance(dataset::Dataset, name::String)

Read the instance identified by `name` from a given `dataset` and return a `QPSReader.QPSData` object.

# See also

- [`Dataset`](@ref)
"""
function read_instance(dataset::Dataset, name::String)
    if dataset == MIPLIB2017 || dataset == MIPLIB2017Benchmark
        return read_miplib2017_instance(dataset, name)
    elseif dataset == Netlib
        return read_netlib_instance(name)
    end
end

function read_miplib2017_instance(dataset::Dataset, name::String)
    folder = if dataset == MIPLIB2017Benchmark
        datadep"miplib2017-benchmark"
    else
        datadep"miplib2017-collection"
    end
    name = lowercase(name)
    mps_gz_path = joinpath(folder, "$name.mps.gz")
    return read_mps(mps_gz_path)
end

function read_netlib_instance(name::String)
    name = uppercase(name)
    if name in ("BLEND", "DFL001", "FORPLAN", "GFRD-PNC", "SIERRA")
        # https://github.com/JuliaSmoothOptimizers/QPSReader.jl/issues/58
        mpsformat = :fixed
    else
        mpsformat = :free
    end
    netlib_path = fetch_netlib()
    sif_path = joinpath(netlib_path, "$name.SIF")
    return read_mps(sif_path; mpsformat)
end

function read_mps(path::String; mpsformat::Symbol = :free)
    if endswith(path, ".mps.gz")
        contents = GZip.open(path, "r") do f
            read(f, String)
        end
        mps_path = string(tempname(), ".mps")
        open(mps_path, "w") do f
            write(f, contents)
        end
    else
        @assert endswith(path, ".mps") || endswith(path, ".SIF")
        mps_path = path
    end

    qps_data = with_logger(NullLogger()) do
        readqps(mps_path; mpsformat)
    end
    return qps_data
end
