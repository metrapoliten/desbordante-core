add_library(Desbordante.fd.sfd.cords)
add_library(Desbordante::fd::sfd::cords ALIAS Desbordante.fd.sfd.cords)

add_headers(Desbordante.fd.sfd.cords
    PRIVATE
        cords.h
        correlation.h
        frequency_handler.h
        sample.h
        contingency_table.h
)
target_sources(Desbordante.fd.sfd.cords
    PRIVATE
        contingency_table.cpp
        cords.cpp
        frequency_handler.cpp
        sample.cpp
)
