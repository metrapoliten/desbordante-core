set(name pyro)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ucc
    SRCS pyroucc.cpp
    LIBS ${Desb}::ucc ${Desb}.fd.pyro.common
)
add_headers(${name} PRIVATE pyroucc.h)
