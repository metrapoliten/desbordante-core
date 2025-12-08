set(name mine)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fd_mine.cpp
    LIBS spdlog::spdlog_header_only ${Desb_PREFIX}.fd.pli
)
add_headers(${name} PRIVATE fd_mine.h)
