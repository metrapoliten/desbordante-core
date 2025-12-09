set(name csv)
Desbordante_AddLibrary(${name}
    PREFIX parser
    SRCS csv_parser.cpp
    LIBS Boost::headers
)
add_headers(${name} PRIVATE csv_parser.h)