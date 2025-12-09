set(name hy.model)
Desbordante_AddLibrary(${name}
    PREFIX fd
    SRCS model/fd_tree.cpp model/fd_tree_vertex.cpp
)
add_headers(${name} PRIVATE
    model/fd_tree.h
    model/fd_tree_vertex.h
    model/non_fd_list.h
)

set(name hy)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS hyfd.cpp inductor.cpp validator.cpp
    LIBS ${Desb}.fd.hy.common ${Desb}.fd.hy.model ${Desb}.fd.pli spdlog::spdlog_header_only better-enums
)
add_headers(${name} PRIVATE
    hyfd.h
    hyfd_config.h
    inductor.h
    sampler.h
    validator.h
)