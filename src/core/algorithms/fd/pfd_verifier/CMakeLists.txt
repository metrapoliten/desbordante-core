add_library(fd.pfdverifier)
add_library(fd::pfdverifier ALIAS fd.pfdverifier)

add_headers(fd.pfdverifier PUBLIC pfd_verifier.h)
add_headers(fd.hyfd PRIVATE pfd_stats_calculator.h)
target_sources(fd.hyfd PRIVATE pfd_verifier.cpp)
