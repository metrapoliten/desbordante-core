add_library(parser.csv)
add_library(parser::csv ALIAS parser.csv)

add_headers(parser.csv PUBLIC csv_parser.h)
target_sources(parser.csv PRIVATE csv_parser.cpp)