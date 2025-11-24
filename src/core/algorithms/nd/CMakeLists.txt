add_subdirectory(nd_verifier)

add_library(nd.nd)
add_library(nd::nd ALIAS nd.nd)

add_headers(nd.nd
    PRIVATE
        nd.h
        util/get_vertical_names.h
)

target_sources(nd.nd
    PRIVATE
        nd.cpp
        util/get_vertical_names.cpp
)