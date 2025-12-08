set(name verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS fd_verifier.cpp stats_calculator.cpp
    LIBS spdlog::spdlog_header_only ${Desb}.model.table
)
add_headers(${name} PRIVATE fd_verifier.h stats_calculator.h)

set(name verifier.dynamic)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS dynamic_fd_verifier.cpp dynamic_stats_calculator.cpp
    LIBS ${Desb}.model.table
)
add_headers(${Desb}.fd.verifier.dynamic PRIVATE dynamic_fd_verifier.h dynamic_stats_calculator.h highlight.h)