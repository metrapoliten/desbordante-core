set(name dd.verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS dd_verifier.cpp
    LIBS ${Desb}.dd ${Desb}.model.table ${Desb}.model.types spdlog::spdlog_header_only ${Desb}.algos better-enums
)
add_headers(${name} PRIVATE dd_verifier.h highlight.h)
