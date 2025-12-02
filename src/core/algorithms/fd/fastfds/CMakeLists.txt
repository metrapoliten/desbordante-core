add_library(fd.fastfds)
add_library(fd::fastfds ALIAS fd.fastfds)

add_headers(fd.fastfds PRIVATE fastfds.h)
target_sources(fd.fastfds PRIVATE fastfds.cpp)

target_link_libraries(fd.fastfds PRIVATE spdlog::spdlog_header_only)
