set(name csv)
Desbordante_AddLibrary(${name}
    PREFIX parser
    SRCS csv_parser.cpp
)
add_headers(${name} PRIVATE csv_parser.h)