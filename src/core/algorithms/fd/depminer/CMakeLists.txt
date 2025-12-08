set(name depminer)
Desbordante_AddLibrary(${name}
    PREFIX fd
    CREATE_ALIAS
    SRCS depminer.cpp
    LIBS ${Desb_PREFIX}.fd.pli
)

add_headers(Desbordante.fd.depminer PRIVATE depminer.h cmax_set.h)
