add_library(IND STATIC)

file(GLOB_RECURSE ind_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(IND
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${ind_sources}
)