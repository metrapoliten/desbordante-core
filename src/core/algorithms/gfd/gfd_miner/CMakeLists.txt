add_library(gfd.miner)
add_library(gfd::miner ALIAS gfd.miner)

add_headers(gfd.miner PUBLIC gfd_miner.h)
target_sources(gfd.miner PRIVATE gfd_miner.cpp)

target_link_libraries(gfd.miner PRIVATE parser.graph)