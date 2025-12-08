set(name ac)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS ac_algorithm.cpp ac_exception_finder.cpp
    LIBS ${Desb_PREFIX}.model.table ${Desb_PREFIX}.model.types spdlog::spdlog_header_only ${Desb_PREFIX}.algos
)
add_headers(${name} PRIVATE ac.h ac_algorithm.h)
