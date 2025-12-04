using Aqua
using MathOptBenchmarkInstances
using Test

ENV["DATADEPS_ALWAYS_ACCEPT"] = true

@testset verbose = true "MathOptBenchmarkInstances" begin
    @testset "Code quality" begin
        Aqua.test_all(MathOptBenchmarkInstances; undocumented_names = true)
    end
    @testset "Netlib" begin
        include("netlib.jl")
    end
    @testset "MIPLIB 2017" begin
        include("miplib2017.jl")
    end
    @testset "Mittelmann" begin
        include("mittelmann.jl")
    end
end
