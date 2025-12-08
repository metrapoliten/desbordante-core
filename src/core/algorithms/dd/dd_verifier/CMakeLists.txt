set(name dd.verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS dd_verifier.cpp
    LIBS Desbordante.dd model.table model.types spdlog::spdlog_header_only ${Desb_PREFIX}.algos
)
add_headers(${name} PRIVATE dd_verifier.h highlight.h)
