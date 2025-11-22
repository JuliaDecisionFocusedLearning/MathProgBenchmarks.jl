using MathProgBenchmarks
using QPSReader
using Test

netlib_list = list_instances(Netlib)
@test length(netlib_list) == 114

for name in netlib_list
    @test read_instance(Netlib, name) isa Tuple{QPSData, String}
end
