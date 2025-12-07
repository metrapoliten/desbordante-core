add_library(Desbordante.fd.verifier)
add_library(Desbordante::fd::verifier ALIAS Desbordante.fd.verifier)

add_headers(Desbordante.fd.verifier PRIVATE fd_verifier.h stats_calculator.h)
target_sources(Desbordante.fd.verifier PRIVATE fd_verifier.cpp stats_calculator.cpp)
target_link_libraries(Desbordante.fd.verifier PRIVATE spdlog::spdlog_header_only model.table)

add_library(Desbordante.fd.verifier.dynamic)
add_library(Desbordante::fd::verifier::dynamic ALIAS Desbordante.fd.verifier.dynamic)

add_headers(Desbordante.fd.verifier.dynamic PRIVATE dynamic_fd_verifier.h dynamic_stats_calculator.h)
add_headers(Desbordante.fd.verifier.dynamic PRIVATE highlight.h)
target_sources(Desbordante.fd.verifier.dynamic PRIVATE dynamic_fd_verifier.cpp dynamic_stats_calculator.cpp)
target_link_libraries(Desbordante.fd.verifier.dynamic PRIVATE model.table)