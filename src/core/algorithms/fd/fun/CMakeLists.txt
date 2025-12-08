set(name fun)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fun.cpp
    LIBS ${Desb_PREFIX}.fd.pli
)
add_headers(Desbordante.fd.fun PRIVATE fun.h)
