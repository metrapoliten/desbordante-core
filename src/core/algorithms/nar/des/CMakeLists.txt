add_library(Desbordante.nar.des)
add_library(Desbordante::nar::des ALIAS Desbordante.nar.des)

add_headers(Desbordante.nar.des
    PRIVATE
        des.h
        differential_functions.h
        encoded_nar.h
        encoded_value_range.h
        enums.h
        rng.h
)
target_sources(Desbordante.nar.des
    PRIVATE
        des.cpp
        differential_functions.cpp
        encoded_nar.cpp
        encoded_value_range.cpp
)

target_link_libraries(Desbordante.nar.des PRIVATE Desbordante::nar)