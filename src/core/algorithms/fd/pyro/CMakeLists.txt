add_library(Desbordante.fd.pyro)
add_library(Desbordante::fd::pyro ALIAS Desbordante.fd.pyro)

add_headers(Desbordante.fd.pyro PRIVATE pyro.h)
target_sources(Desbordante.fd.pyro PRIVATE pyro.cpp)

target_link_libraries(Desbordante.fd.pyro PRIVATE spdlog::spdlog_header_only fd::pyrocommon)
