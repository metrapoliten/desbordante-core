set(name set_based_aod_verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX od
    SRCS verifier.cpp
)
add_headers(${name} PRIVATE verifier.h)
