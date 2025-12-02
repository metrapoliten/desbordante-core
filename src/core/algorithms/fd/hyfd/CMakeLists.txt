add_library(fd.hy.model)
add_headers(fd.hy.model PRIVATE
    model/fd_tree.h
    model/fd_tree_vertex.h
    model/non_fd_list.h
)
target_sources(fd.hy.model PRIVATE model/fd_tree.h model/fd_tree_vertex.cpp)

add_library(fd.hy)
add_library(fd::hy ALIAS fd.hy)

add_headers(fd.hy PUBLIC
        hyfd.h
)
add_headers(fd.hy PRIVATE
    hyfd_config.h
    inductor.h
    sampler.h
    validator.h
)
target_sources(fd.hy PRIVATE
    hyfd.cpp
    inductor.cpp
    validator.cpp
)

target_link_libraries(fd.hy PRIVATE fd::hycommon fd.hy.model)