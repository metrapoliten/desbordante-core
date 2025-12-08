set(name fd.aid)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS aid.cpp search_tree.cpp
    LIBS ${Desb}::fd
)
add_headers(${name} PRIVATE aid.h search_tree.h)
