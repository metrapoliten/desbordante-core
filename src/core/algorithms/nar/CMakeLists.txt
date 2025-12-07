add_subdirectory(des)

add_library(Desbordante.nar.nar)
add_library(Desbordante::nar ALIAS Desbordante.nar.nar)

add_headers(Desbordante.nar.nar
    PRIVATE
        nar_algorithm.h
        value_range.h
)
target_sources(Desbordante.nar.nar
    PRIVATE
        nar.cpp
        nar_algorithm.cpp
        value_range.cpp
)
target_link_libraries(Desbordante.nar.nar PRIVATE model.table)