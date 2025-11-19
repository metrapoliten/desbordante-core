add_library(fd.pfdverifier)
add_library(fd::pfdverifier ALIAS fd.pfdverifier)

add_headers(fd.pfdverifier PUBLIC pfd_verifier.h)
add_headers(fd.pfdverifier PRIVATE pfd_stats_calculator.h)
target_sources(fd.pfdverifier PRIVATE pfd_verifier.cpp)
