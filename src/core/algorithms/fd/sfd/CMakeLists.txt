add_library(fd.cords)
add_library(fd::cords ALIAS fd.cords)

add_headers(fd.cords
    PUBLIC
        cords.h
        correlation.h
        frequency_handler.h
        sample.h
)
add_headers(fd.cords
    PRIVATE
        contingency_table.h
)
target_sources(fd.cords
    PRIVATE
        contingency_table.cpp
        frequency_handler.cpp
        sample.cpp
)
