add_library(Desbordante.gfd.miner)
add_library(Desbordante::gfd::miner ALIAS Desbordante.gfd.miner)

add_headers(Desbordante.gfd.miner PRIVATE gfd_miner.h)
target_sources(Desbordante.gfd.miner PRIVATE gfd_miner.cpp)

target_link_libraries(Desbordante.gfd.miner PRIVATE parser.graph)