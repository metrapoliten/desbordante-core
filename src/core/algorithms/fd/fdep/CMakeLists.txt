add_library(Desbordante.fd.fdep)
add_library(Desbordante::fd::fdep ALIAS Desbordante.fd.fdep)

add_headers(Desbordante.fd.fdep PRIVATE fdep.h)
add_headers(Desbordante.fd.fdep PRIVATE fd_tree_element.h)
target_sources(Desbordante.fd.fdep PRIVATE fdep.cpp fd_tree_element.cpp)
