add_library(parser.graph)

add_headers(parser.graph PRIVATE graph_parser.h)
target_sources(parser.graph PRIVATE graph_parser.cpp)

target_link_libraries(parser.graph PRIVATE Boost::graph)