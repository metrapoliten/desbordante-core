add_library(Desbordante.fd.aid)
add_library(Desbordante::fd::aid ALIAS Desbordante.fd.aid)

add_headers(Desbordante.fd.aid PRIVATE aid.h)
add_headers(Desbordante.fd.aid PRIVATE search_tree.h)
target_sources(Desbordante.fd.aid PRIVATE aid.cpp search_tree.cpp)
