add_library(fd.verifier)
add_library(fd::verifier ALIAS fd.verifier)

add_headers(fd.verifier PUBLIC fd_verifier.h stats_calculator.h)
target_sources(fd.verifier PRIVATE fd_verifier.cpp stats_calculator.cpp)
target_link_libraries(fd.verifier PRIVATE spdlog::spdlog_header_only)

add_library(fd.dynverifier)
add_library(fd::dynverifier ALIAS fd.dynverifier)

add_headers(fd.dynverifier PUBLIC dynamic_fd_verifier.h dynamic_stats_calculator.h)
add_headers(fd.dynverifier PRIVATE highlight.h)
target_sources(fd.dynverifier PRIVATE dynamic_fd_verifier.cpp dynamic_stats_calculator.cpp)