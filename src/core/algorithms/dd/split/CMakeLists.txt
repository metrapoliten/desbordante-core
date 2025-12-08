set(name split)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX dd
    SRCS split.cpp model/distance_position_list_index.cpp
    LIBS ${Desb_PREFIX}.dd ${Desb_PREFIX}.model.table ${Desb_PREFIX}.model.types spdlog::spdlog_header_only ${Desb_PREFIX}.algos
)
add_headers(${Desb_PREFIX}.dd.split PRIVATE split.h enums.h model/distance_position_list_index.h)