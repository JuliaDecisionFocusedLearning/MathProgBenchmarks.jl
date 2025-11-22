using Aqua
using MathProgBenchmarks
using Test

ENV["DATADEPS_ALWAYS_ACCEPT"] = true

@testset verbose = true "MathProgBenchmarks" begin
    @testset "Code quality" begin
        Aqua.test_all(MathProgBenchmarks; undocumented_names = true)
    end
    @testset "Netlib" begin
        include("netlib.jl")
    end
    @testset "MIPLIB2017" begin
        include("miplib2017.jl")
    end
end
