add_library(Desbordante.fd.euler)
add_library(Desbordante::fd::euler ALIAS Desbordante.fd.euler)

add_headers(Desbordante.fd.euler PRIVATE eulerfd.h)
target_sources(Desbordante.fd.euler
    PRIVATE
        cluster.cpp
        eulerfd.cpp
        mlfq.cpp
        search_tree.cpp
)
