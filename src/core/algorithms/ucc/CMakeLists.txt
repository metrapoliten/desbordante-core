add_subdirectory(hpivalid)
add_subdirectory(hyucc)
add_subdirectory(pyroucc)
add_subdirectory(ucc_verifier)

add_library(ucc.ucc)
add_library(ucc::ucc ALIAS ucc.ucc)

add_headers(ucc.ucc
    PRIVATE
        raw_ucc.h
        ucc.h
        ucc_algorithm.h
)
target_sources(ucc.ucc PRIVATE ucc_algorithm.cpp)