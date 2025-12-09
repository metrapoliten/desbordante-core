add_subdirectory(cfd_verifier)
#todo: first_algo/cfd/...
set(name cfd)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS cfd_discovery.cpp fd_first_algorithm.cpp
    LIBS ${Desb}.cfd.model ${Desb}.algos spdlog::spdlog_header_only better-enums Boost::headers
)
add_headers(${name}
    PRIVATE
        enums.h
        fd_first_algorithm.h
        cfd_discovery.h
        miner_node.h
)

set(name util)
Desbordante_AddLibrary(${name}
    PREFIX cfd
    SRCS
        util/cfd_output_util.cpp
        util/partition_tidlist_util.cpp
        util/partition_util.cpp
        util/set_util.cpp
        util/tidlist_util.cpp
    LIBS Boost::headers
)
add_headers(${name}
    PRIVATE
        util/cfd_output_util.h
        util/partition_tidlist_util.h
        util/partition_util.h
        util/set_util.h
        util/tidlist_util.h
)
add_headers(${name} INTERFACE util/prefix_tree.h)

set(name model)
Desbordante_AddLibrary(${name}
    PREFIX cfd
    SRCS model/cfd_relation_data.cpp model/partition_tidlist.cpp model/raw_cfd.cpp
    LIBS ${Desb}.cfd.util ${Desb}.model.table Boost::headers
)
add_headers(${name}
    PRIVATE
        model/cfd_relation_data.h
        model/cfd_types.h
        model/partition_tidlist.h
        model/raw_cfd.h
        model/cfd_column_data.h
)
