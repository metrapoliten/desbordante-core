set(name datastats)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS data_stats.cpp statistic.cpp
    LIBS ${Desb}.model.table ${Desb}.model.types ${Desb}.algos better-enums
)
add_headers(${name} PRIVATE data_stats.h statistic.h)
