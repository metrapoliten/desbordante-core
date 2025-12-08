set(name cfd.verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS cfd_stats_calculator.cpp cfd_verifier.cpp
    LIBS ${Desb}.cfd.model ${Desb}.algos
)
add_headers(${name}
    PRIVATE
        cfd_verifier.h
        highlight.h
        cfd_stats_calculator.h
)
