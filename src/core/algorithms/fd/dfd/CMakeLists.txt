add_library(fd.dfd)
add_library(fd::dfd ALIAS fd.dfd)

add_headers(fd.dfd PRIVATE dfd.h)
add_headers(fd.dfd PRIVATE node_category.h)
target_sources(fd.dfd
    PRIVATE
        dfd.cpp

        column_order/column_order.cpp
        column_order/ordered_partition.cpp

        lattice_observations/lattice_observations.cpp
        lattice_traversal/lattice_traversal.cpp

        partition_storage/partition_storage.cpp

        pruning_maps/dependencies_map.cpp
        pruning_maps/non_dependencies_map.cpp
        pruning_maps/pruning_map.cpp
)
