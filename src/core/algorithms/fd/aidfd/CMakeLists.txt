add_library(fd.aid)
add_library(fd::aid ALIAS fd.aid)

add_headers(fd.aid PRIVATE aid.h)
add_headers(fd.aid PRIVATE search_tree.h)
target_sources(fd.aid PRIVATE aid.cpp search_tree.cpp)
