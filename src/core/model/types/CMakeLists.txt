set(name types)
Desbordante_AddLibrary(${name}
    PREFIX model
    SRCS create_type.cpp
    LIBS ${Desb_PREFIX}.util
)
add_headers(${name}
    PRIVATE
        big_int_type.h
        bitset.h
        builtin.h
        create_type.h
        date_type.h
        double_type.h
        empty_type.h
        imetrizable_type.h
        int_type.h
        mixed_type.h
        null_type.h
        numeric_type.h
        string_type.h
        type.h
        types.h
        undefined_type.h
)