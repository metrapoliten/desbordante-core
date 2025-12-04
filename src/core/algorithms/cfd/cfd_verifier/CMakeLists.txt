add_library(cfd.verifier)
add_library(cfd::verifier ALIAS cfd.verifier)
add_headers(cfd.verifier
    PRIVATE
        cfd_verifier.h
        highlight.h
        cfd_stats_calculator.h
)
target_sources(cfd.verifier PRIVATE cfd_stats_calculator.cpp cfd_verifier.cpp)