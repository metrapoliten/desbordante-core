add_library(fd.aidfd)
add_library(fd::aidfd ALIAS fd.aidfd)

add_headers(fd.aidfd PUBLIC aid.h)
add_headers(fd.aidfd PRIVATE search_tree.h)
target_sources(fd.aidfd PRIVATE aid.cpp search_tree.cpp)
