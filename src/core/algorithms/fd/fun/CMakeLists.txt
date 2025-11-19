add_library(fd.fun)
add_library(fd::fun ALIAS fd.fun)

add_headers(fd.fun PUBLIC fun.h)
target_sources(fd.fun PRIVATE fun.cpp)
