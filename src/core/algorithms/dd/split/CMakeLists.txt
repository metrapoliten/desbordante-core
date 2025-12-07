add_library(Desbordante.dd.split)
add_library(Desbordante::dd::split ALIAS Desbordante.dd.split)

add_headers(Desbordante.dd.split PRIVATE split.h)
add_headers(Desbordante.dd.split PRIVATE enums.h model/distance_position_list_index.h)
target_sources(Desbordante.dd.split PRIVATE split.cpp model/distance_position_list_index.cpp)