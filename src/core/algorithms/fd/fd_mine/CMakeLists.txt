add_library(fd.mine)
add_library(fd::mine ALIAS fd.mine)

add_headers(fd.mine PUBLIC fd_mine.h)
target_sources(fd.mine PRIVATE fd_mine.cpp)

target_link_libraries(fd.mine PRIVATE spdlog_helper)
