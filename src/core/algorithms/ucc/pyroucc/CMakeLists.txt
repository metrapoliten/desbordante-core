add_library(ucc.pyro)
add_library(ucc::pyro ALIAS ucc.pyro)

add_headers(ucc.pyro PRIVATE pyroucc.h)
target_sources(ucc.pyro PRIVATE pyroucc.cpp)
