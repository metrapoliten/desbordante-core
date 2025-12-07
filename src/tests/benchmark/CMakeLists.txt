add_executable(benchmark) #old name: ${CMAKE_PROJECT_NAME}_benchmark

add_headers(benchmark
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
target_sources(benchmark
    PRIVATE
        main.cpp
        benchmark_cli.cpp
        benchmark_comparer.cpp
)
#todo: delete when PR
target_include_directories(benchmark PRIVATE "../common")
target_link_libraries(benchmark
    PRIVATE
        test.common
        Boost::program_options
        Desbordante::dc::fastadc
        dd::split
        ind::ind ind::mind
        fd::hy fd::pyro
        fd::tane::tane
        fd::aid
        md::hy md.hy.preprocessing
        nar::des
)