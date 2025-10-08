add_library(DD STATIC)

file(GLOB_RECURSE dd_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(DD
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${dd_sources}
)