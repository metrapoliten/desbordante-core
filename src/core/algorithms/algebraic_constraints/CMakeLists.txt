set(name ac)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS ac_algorithm.cpp ac_exception_finder.cpp
    LIBS ${Desb}.model.table ${Desb}.model.types spdlog::spdlog_header_only ${Desb}.algos better-enums
)
add_headers(${name} PRIVATE ac.h ac_algorithm.h)
