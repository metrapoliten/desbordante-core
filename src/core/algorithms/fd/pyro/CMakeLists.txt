add_library(fd.pyro)
add_library(fd::pyro ALIAS fd.pyro)

add_headers(fd.pyro PUBLIC pyro.h)
target_sources(fd.pyro PRIVATE pyro.cpp)

target_link_libraries(fd.pyro PRIVATE spdlog::spdlog_header_only)
