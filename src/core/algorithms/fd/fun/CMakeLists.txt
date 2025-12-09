set(name fun)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fun.cpp
    LIBS ${Desb}.fd.pli spdlog::spdlog_header_only
)
add_headers(${Desb}.fd.fun PRIVATE fun.h)
