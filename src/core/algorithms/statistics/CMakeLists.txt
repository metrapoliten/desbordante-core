add_library(datastats)

add_headers(datastats PUBLIC data_stats.h)
add_headers(datastats PRIVATE statistic.h)
target_sources(datastats PRIVATE data_stats.cpp statistic.cpp)
