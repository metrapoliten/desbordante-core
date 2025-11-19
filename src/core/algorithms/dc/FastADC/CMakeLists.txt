add_library(dc.fastadc)
add_library(dc::fastadc ALIAS cfd.cfd)

target_sources(dc.fastadc PRIVATE fastadc.cpp)
add_headers(dc.fastadc PUBLIC fastadc.h)
#TODO