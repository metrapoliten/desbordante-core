add_library(Desbordante.fd.dfd)
add_library(Desbordante::fd::dfd ALIAS Desbordante.fd.dfd)

add_headers(Desbordante.fd.dfd PRIVATE dfd.h node_category.h)
target_sources(Desbordante.fd.dfd
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
