set(name pfd_verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS pfd_verifier.cpp
    LIBS ${Desb}.model.table
)
add_headers(${name} PRIVATE pfd_verifier.h pfd_stats_calculator.h)
