set(name des)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX nar
    SRCS des.cpp differential_functions.cpp encoded_nar.cpp encoded_value_range.cpp
    LIBS ${Desb_PREFIX}::nar
)
add_headers(${name}
    PRIVATE
        des.h
        differential_functions.h
        encoded_nar.h
        encoded_value_range.h
        enums.h
        rng.h
)
