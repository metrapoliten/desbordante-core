add_library(GFD STATIC)

file(GLOB_RECURSE gfd_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(GFD
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${gfd_sources}
)