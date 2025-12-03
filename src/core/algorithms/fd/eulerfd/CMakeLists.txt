add_library(fd.euler)
add_library(fd::euler ALIAS fd.euler)

add_headers(fd.euler PRIVATE eulerfd.h)
target_sources(fd.euler
    PRIVATE
        cluster.cpp
        eulerfd.cpp
        mlfq.cpp
        search_tree.cpp
)
