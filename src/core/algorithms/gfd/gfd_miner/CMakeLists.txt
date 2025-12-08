set(name miner)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX gfd
    SRCS gfd_miner.cpp
    LIBS ${Desb}.parser.graph ${Desb}.gfd ${Desb}.algos
)
add_headers(${name} PRIVATE gfd_miner.h)