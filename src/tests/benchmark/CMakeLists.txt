# Create benchmark executable
Desbordante_AddTarget(benchmark
    TYPE EXE
    _SRCS main.cpp benchmark_cli.cpp benchmark_comparer.cpp
    _LIBS
        Desbordante.test.common
        Boost::program_options
        Desbordante::dc::fastadc
        Desbordante::dd::split
        Desbordante::ind
        Desbordante::ind::mind
        Desbordante::fd::hy
        Desbordante::fd::pyro
        Desbordante::fd::tane
        Desbordante::fd::aid
        md::hy
        md.hy.preprocessing
        Desbordante::nar::des
)

add_headers(Desbordante.benchmark
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
