add_library(DC STATIC)

file(GLOB_RECURSE dc_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(DC
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${dc_sources}
)