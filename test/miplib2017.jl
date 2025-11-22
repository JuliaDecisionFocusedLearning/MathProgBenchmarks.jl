using MathProgBenchmarks
using Test

miplib_list = list_instances(MIPLIB2017)
@test length(miplib_list) == 1065

miplib_benchmark_list = list_instances(MIPLIB2017Benchmark)
@test length(miplib_benchmark_list) == 240

for name in miplib_benchmark_list[1:10]
    @test_nowarn qps_data = read_instance(MIPLIB2017Benchmark, name)
end
