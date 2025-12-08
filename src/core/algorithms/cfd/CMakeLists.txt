add_subdirectory(cfd_verifier)
#todo: first_algo/cfd/...
set(name cfd)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS cfd_discovery.cpp fd_first_algorithm.cpp
    LIBS ${Desb_PREFIX}.cfd.model ${Desb_PREFIX}.algos
)
add_headers(${name}
    PRIVATE
        enums.h
        fd_first_algorithm.h
        cfd_discovery.h
        miner_node.h
)

set(name cfd.util)
Desbordante_AddLibrary(${name}
    SRCS
        util/cfd_output_util.cpp
        util/partition_tidlist_util.cpp
        util/partition_util.cpp
        util/set_util.cpp
        util/tidlist_util.cpp
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

set(name cfd.model)
Desbordante_AddLibrary(${name}
    SRCS model/cfd_relation_data.cpp model/partition_tidlist.cpp model/raw_cfd.cpp
    LIBS Desbordante.cfd.util model.table
)
add_headers(${name}
    PRIVATE
        model/cfd_relation_data.h
        model/cfd_types.h
        model/partition_tidlist.h
        model/raw_cfd.h
        model/cfd_column_data.h
)
