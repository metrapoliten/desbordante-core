add_library(dd.split)
add_library(dd::split ALIAS dd.split)

add_headers(dd.split PRIVATE split.h)
add_headers(dd.split PRIVATE enums.h model/distance_position_list_index.h)
target_sources(dd.split PRIVATE split.cpp model/distance_position_list_index.cpp)