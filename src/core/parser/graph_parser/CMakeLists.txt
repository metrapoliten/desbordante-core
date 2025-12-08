set(name graph)
Desbordante_AddLibrary(${name}
    PREFIX parser
    SRCS graph_parser.cpp
    LIBS Boost::graph
)
add_headers(${name} PRIVATE graph_parser.h)