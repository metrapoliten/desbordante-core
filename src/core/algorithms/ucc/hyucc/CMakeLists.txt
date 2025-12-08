set(name hy)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ucc
    SRCS
        hyucc.cpp
        inductor.cpp
        validator.cpp
        model/ucc_tree.cpp
        model/ucc_tree_vertex.cpp
    LIBS spdlog::spdlog_header_only ${Desb}.config ${Desb}.fd.hy.common ${Desb}::ucc ${Desb}.algos
)
add_headers(${Desb}.ucc.hy
    PRIVATE
        hyucc.h
        inductor.h
        preprocessor.h
        sampler.h
        validator.h
        model/non_ucc_list.h
        model/ucc_tree.h
        model/ucc_tree_vertex.h
)
