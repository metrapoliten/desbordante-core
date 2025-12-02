add_library(fd.sfd.cords)
add_library(fd::sfd::cords ALIAS fd.sfd.cords)

add_headers(fd.sfd.cords
        PRIVATE
        cords.h
        correlation.h
        frequency_handler.h
        sample.h
)
add_headers(fd.sfd.cords
    PRIVATE
        contingency_table.h
)
target_sources(fd.sfd.cords
    PRIVATE
        contingency_table.cpp
        cords.cpp
        frequency_handler.cpp
        sample.cpp
)
