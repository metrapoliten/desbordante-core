add_library(Desbordante.fd.fastfds)
add_library(Desbordante::fd::fastfds ALIAS Desbordante.fd.fastfds)

add_headers(Desbordante.fd.fastfds PRIVATE fastfds.h)
target_sources(Desbordante.fd.fastfds PRIVATE fastfds.cpp)

target_link_libraries(Desbordante.fd.fastfds PRIVATE spdlog::spdlog_header_only)
