add_subdirectory(nd_verifier)

add_library(Desbordante.nd.nd)
add_library(Desbordante::nd ALIAS Desbordante.nd.nd)

add_headers(Desbordante.nd.nd
    PRIVATE
        nd.h
        util/get_vertical_names.h
)

target_sources(Desbordante.nd.nd
    PRIVATE
        nd.cpp
        util/get_vertical_names.cpp
)