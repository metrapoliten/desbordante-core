set(NAME ND)

add_library(${NAME} STATIC)

file(GLOB_RECURSE nd_sources
        "${CMAKE_CURRENT_SOURCE_DIR}/*.h"
        "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

target_sources(${NAME}
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${nd_sources}
)