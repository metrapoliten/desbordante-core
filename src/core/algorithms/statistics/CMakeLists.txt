set(name datastats)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS data_stats.cpp statistic.cpp
    LIBS model.table model.types ${Desb_PREFIX}.algos
)
add_headers(${name} PRIVATE data_stats.h statistic.h)
