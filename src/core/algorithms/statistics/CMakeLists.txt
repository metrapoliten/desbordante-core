add_library(Desbordante.datastats)
add_library(Desbordante::datastats ALIAS Desbordante.datastats)

add_headers(Desbordante.datastats PRIVATE data_stats.h statistic.h)
target_sources(Desbordante.datastats PRIVATE data_stats.cpp statistic.cpp)

target_link_libraries(Desbordante.datastats PRIVATE model.table model.types)
