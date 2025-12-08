set(name pyro)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS pyro.cpp
    LIBS spdlog::spdlog_header_only ${Desb_PREFIX}.fd.pyro.common ${Desb_PREFIX}.fd.pli
)

add_headers(Desbordante.fd.pyro PRIVATE pyro.h)
