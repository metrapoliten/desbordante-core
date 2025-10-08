add_library(ND STATIC)

file(GLOB_RECURSE nd_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(ND
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${nd_sources}
)