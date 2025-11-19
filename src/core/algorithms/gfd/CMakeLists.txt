add_library(gfd)

file(GLOB_RECURSE gfd_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(gfd
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${gfd_sources}
)