set(name datastats)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS data_stats.cpp statistic.cpp
    LIBS ${Desb_PREFIX}.model.table ${Desb_PREFIX}.model.types ${Desb_PREFIX}.algos
)
add_headers(${name} PRIVATE data_stats.h statistic.h)
