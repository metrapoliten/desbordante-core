add_subdirectory(cfd_verifier)
#todo: first_algo/cfd/...
add_library(cfd.cfd)
add_library(cfd::cfd ALIAS cfd.cfd)
add_headers(cfd.cfd
    PRIVATE
        enums.h
        fd_first_algorithm.h
        cfd_discovery.h
        miner_node.h
)
target_sources(cfd.cfd
    PRIVATE
        cfd_discovery.cpp
        fd_first_algorithm.cpp
)

add_library(cfd.model)
add_headers(cfd.model
    PRIVATE
        model/cfd_relation_data.h
        model/cfd_types.h
        model/partition_tidlist.h
        model/raw_cfd.h
        model/cfd_column_data.h
)
target_sources(cfd.model
    PRIVATE
        model/cfd_relation_data.cpp
        model/partition_tidlist.cpp
        model/raw_cfd.cpp
)

add_library(cfd.util)
add_headers(cfd.util
    PRIVATE
        util/cfd_output_util.h
        util/partition_tidlist_util.h
        util/partition_util.h
        util/set_util.h
        util/tidlist_util.h
)
add_headers(cfd.util INTERFACE util/prefix_tree.h)
target_sources(cfd.util
    PRIVATE
        util/cfd_output_util.cpp
        util/partition_tidlist_util.cpp
        util/partition_util.cpp
        util/set_util.cpp
        util/tidlist_util.cpp
)

target_link_libraries(cfd.model PRIVATE cfd.util model.table)
target_link_libraries(cfd.cfd PRIVATE cfd.model)
target_link_libraries(cfd.verifier PRIVATE cfd.model)
