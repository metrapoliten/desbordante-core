set(NAME IND)

add_library(${NAME} STATIC)

file(GLOB_RECURSE ind_sources
        "${CMAKE_CURRENT_SOURCE_DIR}/*.h"
        "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

target_sources(${NAME}
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        ${ind_sources}
)