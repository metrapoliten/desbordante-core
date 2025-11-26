add_subdirectory(des)

add_library(nar.nar)
add_library(nar::nar ALIAS nar.nar)

add_headers(nar.nar
    PRIVATE
        nar_algorithm.h
        value_range.h
)
target_sources(nar.nar
    PRIVATE
        nar.cpp
        nar_algorithm.cpp
        value_range.cpp
)