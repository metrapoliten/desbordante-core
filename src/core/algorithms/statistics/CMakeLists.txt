add_library(stat STATIC)

file(GLOB_RECURSE stat_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(stat
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${stat_sources}
)