add_library(fd.fdep)
add_library(fd::fdep ALIAS fd.fdep)

add_headers(fd.fdep PUBLIC fdep.h)
add_headers(fd.fdep PRIVATE fd_tree_element.h)
target_sources(fd.fdep PRIVATE fdep.cpp fd_tree_element.cpp)
