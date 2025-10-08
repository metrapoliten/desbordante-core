add_library(NAR STATIC)

file(GLOB_RECURSE nar_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(NAR
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${nar_sources}
)