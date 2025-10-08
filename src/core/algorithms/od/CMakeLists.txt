add_library(OD STATIC)

file(GLOB_RECURSE od_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(OD
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${od_sources}
)