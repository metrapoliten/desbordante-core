add_library(Desbordante.cfd.verifier)
add_library(Desbordante::cfd::verifier ALIAS Desbordante.cfd.verifier)
add_headers(Desbordante.cfd.verifier
    PRIVATE
        cfd_verifier.h
        highlight.h
        cfd_stats_calculator.h
)
target_sources(Desbordante.cfd.verifier PRIVATE cfd_stats_calculator.cpp cfd_verifier.cpp)