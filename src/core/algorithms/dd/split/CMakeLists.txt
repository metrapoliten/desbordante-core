set(name split)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX dd
    SRCS split.cpp model/distance_position_list_index.cpp
    LIBS ${Desb}.dd ${Desb}.model.table ${Desb}.model.types spdlog::spdlog_header_only ${Desb}.algos
)
add_headers(${Desb}.dd.split PRIVATE split.h enums.h model/distance_position_list_index.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")