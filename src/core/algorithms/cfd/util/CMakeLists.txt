add_library(util)
target_sources(util
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/.."
    PRIVATE
        cfd_output_util.cpp
        partition_tidlist_util.cpp
        partition_util.cpp
        set_util.cpp
        tidlist_util.cpp
)