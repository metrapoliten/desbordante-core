add_library(Desbordante.fd.fun)
add_library(Desbordante::fd::fun ALIAS Desbordante.fd.fun)

add_headers(Desbordante.fd.fun PRIVATE fun.h)
target_sources(Desbordante.fd.fun PRIVATE fun.cpp)
