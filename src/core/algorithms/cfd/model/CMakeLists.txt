add_library(model)
target_sources(model
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/.."
    PRIVATE
        cfd_relation_data.cpp
        partition_tidlist.cpp
        raw_cfd.cpp
)