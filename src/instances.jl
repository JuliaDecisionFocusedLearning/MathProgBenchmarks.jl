"""
    read_instance(dataset::Dataset, name::String)

Read the instance identified by `name` from a given `dataset` and return a `QPSReader.QPSData` object.

# See also

- [`Dataset`](@ref)
"""
function read_instance(dataset::Dataset, name::String)
    if dataset == MIPLIB2017
        return read_miplib2017_instance(name)
    elseif dataset == Netlib
        return read_netlib_instance(name)
    elseif dataset == MittelmannLP
        return read_mittelmann_lp_instance(name)
    end
end

function read_miplib2017_instance(name::String)
    folder = if name in list_miplib2017_instances(; benchmark_only = true)
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

function read_mittelmann_lp_instance(name::String)
    folder_path = @datadep_str("mittelmann-lp-$name")
    path1 = joinpath(folder_path, "$name.mps.bz2")
    path2 = joinpath(folder_path, "$name.bz2")
    if ispath(path1)
        return read_mps(path1)
    else
        return read_mps(path2)
    end
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
    elseif endswith(path, ".bz2") || endswith(path, ".mps.bz2")
        compressed = CodecBzip2.read(path)
        contents = String(CodecBzip2.transcode(CodecBzip2.Bzip2Decompressor, compressed))
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
