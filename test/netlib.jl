using MathProgBenchmarks
using Test

netlib_list = list_instances(Netlib)
@test length(netlib_list) == 114

for name in netlib_list
    @test_nowarn qps_data = read_instance(Netlib, name)
end
