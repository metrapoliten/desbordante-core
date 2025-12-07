add_library(Desbordante.ucc.pyro)
add_library(Desbordante::ucc::pyro ALIAS Desbordante.ucc.pyro)

add_headers(Desbordante.ucc.pyro PRIVATE pyroucc.h)
target_sources(Desbordante.ucc.pyro PRIVATE pyroucc.cpp)

target_link_libraries(Desbordante.ucc.pyro PRIVATE Desbordante::ucc fd::pyrocommon)
