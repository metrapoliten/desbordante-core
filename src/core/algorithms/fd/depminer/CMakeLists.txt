add_library(fd.depminer)
add_library(fd::depminer ALIAS fd.depminer)

add_headers(fd.depminer PUBLIC depminer.h)
add_headers(fd.depminer PRIVATE cmax_set.h)
target_sources(fd.depminer PRIVATE depminer.cpp)
