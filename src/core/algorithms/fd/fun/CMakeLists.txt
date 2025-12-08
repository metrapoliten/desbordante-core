set(name fun)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fun.cpp
    LIBS ${Desb}.fd.pli
)
add_headers(${Desb}.fd.fun PRIVATE fun.h)
