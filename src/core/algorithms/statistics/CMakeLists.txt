add_library(datastats)

add_headers(datastats PRIVATE data_stats.h statistic.h)
target_sources(datastats PRIVATE data_stats.cpp statistic.cpp)

target_link_libraries(datastats PRIVATE model.table model.types)
