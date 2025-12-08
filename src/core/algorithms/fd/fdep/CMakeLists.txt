set(name fdep)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fdep.cpp fd_tree_element.cpp
    LIBS ${Desb_PREFIX}::fd
)
add_headers(Desbordante.fd.fdep PRIVATE fdep.h fd_tree_element.h)
