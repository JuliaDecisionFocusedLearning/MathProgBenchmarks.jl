using MathOptBenchmarkInstances
using QPSReader
using Test

mittelmann_list = list_instances(MittelmannLP)
@test length(mittelmann_list) == 116

mittelmann_small = [n for n in mittelmann_list if startswith(n, "qap")]

for name in mittelmann_small
    @test read_instance(MittelmannLP, name) isa Tuple{QPSData, String}
end
