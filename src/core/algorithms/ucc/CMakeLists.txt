add_subdirectory(hpivalid)
add_subdirectory(hyucc)
add_subdirectory(pyroucc)
add_subdirectory(ucc_verifier)

set(name ucc)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS ucc_algorithm.cpp
    LIBS Boost::headers
)
add_headers(${name} PRIVATE raw_ucc.h ucc.h ucc_algorithm.h)