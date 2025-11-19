add_library(fd.hyfd)
add_library(fd::hyfd ALIAS fd.hyfd)

add_headers(fd.hyfd PUBLIC
        hyfd.h
)
add_headers(fd.hyfd PRIVATE
    model/fd_tree.h
    model/fd_tree_vertex.h
    model/non_fd_list.h
    hyfd_config.h
    inductor.h
    sampler.h
    validator.h
)
target_sources(fd.hyfd PRIVATE
    model/fd_tree.cpp
    model/fd_tree_vertex.cpp
    hyfd.cpp
    inductor.cpp
)
