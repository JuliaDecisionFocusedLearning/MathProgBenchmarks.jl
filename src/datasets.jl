"""
    Dataset

Enum type for mathematical programming datasets.

Possible values:

- [`MIPLIB2017`](@ref), [`MIPLIB2017Benchmark`](@ref)
- [`Netlib`](@ref)
"""
@enum Dataset MIPLIB2017 MIPLIB2017Benchmark Netlib

"""
    MIPLIB2017

Mixed Integer Linear Programs from the MIPLIB2017 collection dataset.

Source: <https://miplib.zib.de/>.
"""
MIPLIB2017

"""
    MIPLIB2017Benchmark

Mixed Integer Linear Programs from the MIPLIB2017 benchmark dataset (much smaller than the collection dataset).

Source: <https://miplib.zib.de/>.
"""
MIPLIB2017Benchmark

"""
    Netlib

Linear Programs from the Netlib dataset.

Source: <https://www.netlib.org/lp/data/index.html>.
"""
Netlib
