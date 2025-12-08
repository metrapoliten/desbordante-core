set(name euler)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS cluster.cpp eulerfd.cpp mlfq.cpp search_tree.cpp
    LIBS ${Desb_PREFIX}::fd
)
add_headers(${name} PRIVATE eulerfd.h cluster.h mlfq.h search_tree.h)
