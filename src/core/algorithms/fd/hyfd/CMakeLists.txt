add_library(fd.hy.model)
add_headers(fd.hy.model PRIVATE
    model/fd_tree.h
    model/fd_tree_vertex.h
    model/non_fd_list.h
)
target_sources(fd.hy.model PRIVATE model/fd_tree.cpp model/fd_tree_vertex.cpp)

add_library(Desbordante.fd.hy)
add_library(Desbordante::fd::hy ALIAS Desbordante.fd.hy)

add_headers(Desbordante.fd.hy PRIVATE
        hyfd.h
)
add_headers(Desbordante.fd.hy PRIVATE
    hyfd_config.h
    inductor.h
    sampler.h
    validator.h
)
target_sources(Desbordante.fd.hy PRIVATE
    hyfd.cpp
    inductor.cpp
    validator.cpp
)

target_link_libraries(Desbordante.fd.hy PRIVATE fd::hycommon fd.hy.model)