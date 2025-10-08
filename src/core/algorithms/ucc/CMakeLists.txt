add_library(ucc STATIC)

file(GLOB_RECURSE ucc_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(ucc
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${ucc_sources}
)