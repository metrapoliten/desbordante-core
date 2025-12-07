add_library(Desbordante.fd.mine)
add_library(Desbordante::fd::mine ALIAS Desbordante.fd.mine)

add_headers(Desbordante.fd.mine PRIVATE fd_mine.h)
target_sources(Desbordante.fd.mine PRIVATE fd_mine.cpp)

target_link_libraries(Desbordante.fd.mine PRIVATE spdlog::spdlog_header_only)
