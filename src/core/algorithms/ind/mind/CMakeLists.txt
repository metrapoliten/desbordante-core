set(name mind)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ind
    SRCS mind.cpp
    LIBS ${Desb}.create_algo spdlog::spdlog_header_only better-enums
)
add_headers(${name} PRIVATE mind.h raw_ind.h)
