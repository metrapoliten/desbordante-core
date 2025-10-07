set(NAME DC)

add_library(${NAME} STATIC)

file(GLOB_RECURSE dc_sources
        "${CMAKE_CURRENT_SOURCE_DIR}/*/*/*.h"
        "${CMAKE_CURRENT_SOURCE_DIR}/*/*/*.cpp"
        "${CMAKE_CURRENT_SOURCE_DIR}/*/*.h"
        "${CMAKE_CURRENT_SOURCE_DIR}/*/*.cpp"
)

target_sources(${NAME}
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${dc_sources}
)