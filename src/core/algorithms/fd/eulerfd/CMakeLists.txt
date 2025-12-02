add_library(fd.eulerfd)
add_library(fd::eulerfd ALIAS fd.eulerfd)

add_headers(fd.eulerfd PRIVATE eulerfd.h)
target_sources(fd.eulerfd
    PRIVATE
        cluster.cpp
        eulerfd.cpp
        mlfq.cpp
        search_tree.cpp
)
