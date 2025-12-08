add_subdirectory(nd_verifier)

set(name nd)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS nd.cpp util/get_vertical_names.cpp
)
add_headers(${name} PRIVATE nd.h util/get_vertical_names.h)
