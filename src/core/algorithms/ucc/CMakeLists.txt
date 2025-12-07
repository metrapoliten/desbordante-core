add_subdirectory(hpivalid)
add_subdirectory(hyucc)
add_subdirectory(pyroucc)
add_subdirectory(ucc_verifier)

add_library(Desbordante.ucc.ucc)
add_library(Desbordante::ucc ALIAS Desbordante.ucc.ucc)

add_headers(Desbordante.ucc.ucc
    PRIVATE
        raw_ucc.h
        ucc.h
        ucc_algorithm.h
)
target_sources(Desbordante.ucc.ucc PRIVATE ucc_algorithm.cpp)