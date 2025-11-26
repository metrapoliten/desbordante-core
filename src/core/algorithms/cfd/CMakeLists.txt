add_subdirectory(cfd_verifier)

add_library(cfd.cfd)
add_library(cfd::cfd ALIAS cfd.cfd)
target_sources(cfd.cfd
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
        FILES
            enums.h
            fd_first_algorithm.h
    PRIVATE
        FILE_SET privateHeaders
        TYPE HEADERS
        FILES
            cfd_discovery.h
            miner_node.h
#    INTERFACE
#        FILE_SET interfaceHeaders
#        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
#        TYPE HEADERS
#        FILES mining_algorithms.h
    PRIVATE
        cfd_discovery.cpp
        fd_first_algorithm.cpp
)

add_library(cfd.model)
add_library(cfd::model ALIAS cfd.model)
target_sources(cfd.model
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core/
        FILES
            model/cfd_relation_data.h
            model/cfd_types.h
            model/partition_tidlist.h
            model/raw_cfd.h
    PRIVATE
        FILE_SET privateHeaders
        TYPE HEADERS
        FILES model/cfd_column_data.h
    PRIVATE
        model/cfd_relation_data.cpp
        model/partition_tidlist.cpp
        model/raw_cfd.cpp
)

add_library(cfd.util)
add_library(cfd::util ALIAS cfd.util)
target_sources(cfd.util
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
        FILES
            util/cfd_output_util.h
            util/partition_tidlist_util.h
            util/partition_util.h
            util/set_util.h
            util/tidlist_util.h
    INTERFACE
        FILE_SET interfaceHeaders
        TYPE HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
        FILES util/prefix_tree.h
    PRIVATE
        util/cfd_output_util.cpp
        util/partition_tidlist_util.cpp
        util/partition_util.cpp
        util/set_util.cpp
        util/tidlist_util.cpp
)

target_link_libraries(cfd.model PRIVATE cfd::util)
target_link_libraries(cfd.cfd PUBLIC cfd.model PRIVATE cfd.util)
target_link_libraries(cfd.verifier PRIVATE cfd.util cfd.model)
