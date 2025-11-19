add_library(fd.fdmine)
add_library(fd::fdmine ALIAS fd.fdmine)

add_headers(fd.fdmine PUBLIC fd_mine.h)
target_sources(fd.fdmine PRIVATE fd_mine.cpp)
