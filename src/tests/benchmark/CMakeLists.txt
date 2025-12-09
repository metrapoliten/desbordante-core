# Create benchmark executable
set(name benchmark)
Desbordante_AddLibrary(benchmark
    SRCS main.cpp benchmark_cli.cpp benchmark_comparer.cpp
    LIBS
        ${Desb}.test.common
        ${Desb}::dc::fastadc
        ${Desb}::dd::split
        ${Desb}::ind
        ${Desb}::ind::mind
        ${Desb}::fd::hy
        ${Desb}::fd::pyro
        ${Desb}::fd::tane
        ${Desb}::fd::aid
        ${Desb}.md.hy
        ${Desb}.md.hy.preprocessing
        ${Desb}::nar::des
        Boost::program_options
        better-enums
        frozen
)
add_headers(${name}
    PRIVATE
        adc_benchmark.h
        benchmark_cli.h
        benchmark_comparer.h
        benchmark_results_io.h
        benchmark_runner.h
        dd_benchmark.h
        fd_benchmark.h
        ind_benchmark.h
        md_benchmark.h
        nar_benchmark.h
)
