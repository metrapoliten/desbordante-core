set(name verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ucc
    SRCS ucc_verifier.cpp
)
add_headers(${name} PRIVATE ucc_stats_calculator.h ucc_verifier.h)
