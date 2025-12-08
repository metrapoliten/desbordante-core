set(name miner)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX gfd
    SRCS gfd_miner.cpp
    LIBS ${Desb_PREFIX}.parser.graph ${Desb_PREFIX}.gfd ${Desb_PREFIX}.algos
)
add_headers(${name} PRIVATE gfd_miner.h)