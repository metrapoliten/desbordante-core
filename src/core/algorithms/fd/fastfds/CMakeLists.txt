set(name fastfds)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fastfds.cpp
    LIBS spdlog::spdlog_header_only ${Desb_PREFIX}.fd.pli
)
add_headers(${name} PRIVATE fastfds.h)
