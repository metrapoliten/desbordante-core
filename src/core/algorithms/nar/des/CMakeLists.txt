add_library(nar.des)
add_library(nar::des ALIAS nar.des)

add_headers(nar.des
    PRIVATE
        des.h
        differential_functions.h
        encoded_nar.h
        encoded_value_range.h
        enums.h
        rng.h
)
target_sources(nar.des
    PRIVATE
        des.cpp
        differential_functions.cpp
        encoded_nar.cpp
        encoded_value_range.cpp
)

target_link_libraries(nar.des PRIVATE nar::nar)