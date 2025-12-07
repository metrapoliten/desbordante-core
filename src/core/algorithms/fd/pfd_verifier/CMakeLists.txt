add_library(Desbordante.fd.pfd_verifier)
add_library(Desbordante::fd::pfd_verifier ALIAS Desbordante.fd.pfd_verifier)

add_headers(Desbordante.fd.pfd_verifier PRIVATE pfd_verifier.h)
add_headers(Desbordante.fd.pfd_verifier PRIVATE pfd_stats_calculator.h)
target_sources(Desbordante.fd.pfd_verifier PRIVATE pfd_verifier.cpp)

target_link_libraries(Desbordante.fd.pfd_verifier PRIVATE model.table)
