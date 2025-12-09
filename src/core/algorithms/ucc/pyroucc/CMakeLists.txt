set(name pyro)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ucc
    SRCS pyroucc.cpp
    LIBS ${Desb}::ucc ${Desb}.fd.pyro.common spdlog::spdlog_header_only
)
add_headers(${name} PRIVATE pyroucc.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
