add_library(FD STATIC)

file(GLOB_RECURSE fd_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(FD
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${fd_sources}
)