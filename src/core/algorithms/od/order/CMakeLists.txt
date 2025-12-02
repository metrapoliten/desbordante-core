add_library(od.order)
add_library(od::order ALIAS od.order)

add_headers(od.order
    PRIVATE
        dependency_checker.h
        list_lattice.h
        list_od.h
        order.h
        order_utility.h
        sorted_partitions.h
)
target_sources(od.order
    PRIVATE
        dependency_checker.cpp
        list_lattice.cpp
        order.cpp
        order_utility.cpp
        sorted_partitions.cpp
)
target_link_libraries(od.order PRIVATE model.table)