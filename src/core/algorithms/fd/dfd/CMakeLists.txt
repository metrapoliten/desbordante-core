set(name dfd)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS
        dfd.cpp

        column_order/column_order.cpp
        column_order/ordered_partition.cpp

        lattice_observations/lattice_observations.cpp
        lattice_traversal/lattice_traversal.cpp

        partition_storage/partition_storage.cpp

        pruning_maps/dependencies_map.cpp
        pruning_maps/non_dependencies_map.cpp
        pruning_maps/pruning_map.cpp
    LIBS ${Desb}.fd.pli
)
add_headers(${name} PRIVATE dfd.h node_category.h)
