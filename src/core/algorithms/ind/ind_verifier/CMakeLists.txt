set(name verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ind
    SRCS ind_verifier.cpp
)
add_headers(${name} PRIVATE ind_verifier.h)
