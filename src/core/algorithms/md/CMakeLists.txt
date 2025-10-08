add_library(MD STATIC)

file(GLOB_RECURSE md_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(MD
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${md_sources}
)