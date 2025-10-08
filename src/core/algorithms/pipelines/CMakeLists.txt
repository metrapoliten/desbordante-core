add_library(pipelines STATIC)

file(GLOB_RECURSE pipelines_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(pipelines
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${pipelines_sources}
)