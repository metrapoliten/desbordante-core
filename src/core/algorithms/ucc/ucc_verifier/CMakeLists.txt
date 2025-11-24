add_library(ucc.verifier)
add_library(ucc::verifier ALIAS ucc.verifier)

add_headers(ucc.verifier PRIVATE ucc_stats_calculator.h ucc_verifier.h)
target_sources(ucc.verifier PRIVATE ucc_verifier.cpp)
