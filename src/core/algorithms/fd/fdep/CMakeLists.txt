set(name fdep)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fdep.cpp fd_tree_element.cpp
    LIBS ${Desb}::fd spdlog::spdlog_header_only
)
add_headers(${Desb}.fd.fdep PRIVATE fdep.h fd_tree_element.h)
