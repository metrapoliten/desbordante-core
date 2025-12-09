set(name pyro)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS pyro.cpp
    LIBS spdlog::spdlog_header_only ${Desb}.fd.pyro.common ${Desb}.fd.pli
)
add_headers(${Desb}.fd.pyro PRIVATE pyro.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
