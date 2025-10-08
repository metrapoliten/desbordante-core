add_library(METRIC STATIC)

file(GLOB_RECURSE metric_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(METRIC
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${metric_sources}
)