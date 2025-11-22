using MathProgBenchmarks
using Test

mittelmann_list = list_instances(MittelmannLP)
@test length(mittelmann_list) == 116

@test_nowarn read_instance(MittelmannLP, mittelmann_list[end])
