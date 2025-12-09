set(name cords)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd.sfd
    SRCS contingency_table.cpp cords.cpp frequency_handler.cpp sample.cpp
    LIBS ${Desb}::fd better-enums
)
add_headers(${name}
    PRIVATE
        cords.h
        correlation.h
        frequency_handler.h
        sample.h
        contingency_table.h
)
