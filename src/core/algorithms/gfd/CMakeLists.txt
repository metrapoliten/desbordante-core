add_subdirectory(gfd_miner)
add_subdirectory(gfd_validator)

add_library(gfd.gfd)
add_library(gfd::gfd ALIAS gfd.gfd)

add_headers(gfd.gfd PRIVATE gfd.h)
add_headers(gfd.gfd
    PRIVATE
        comparator.h
        graph_descriptor.h
)
target_sources(gfd.gfd
    PRIVATE
        comparator.cpp
        gfd.cpp
)

target_link_with_given(gfd::gfd PRIVATE Desbordante.gfd.miner Desbordante.gfd.validator)
