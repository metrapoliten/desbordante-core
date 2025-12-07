add_library(Desbordante.fd.depminer)
add_library(Desbordante::fd::depminer ALIAS Desbordante.fd.depminer)

add_headers(Desbordante.fd.depminer PRIVATE depminer.h)
add_headers(Desbordante.fd.depminer PRIVATE cmax_set.h)
target_sources(Desbordante.fd.depminer PRIVATE depminer.cpp)
