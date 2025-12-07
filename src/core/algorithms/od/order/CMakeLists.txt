add_library(Desbordante.od.order)
add_library(Desbordante::od::order ALIAS Desbordante.od.order)

add_headers(Desbordante.od.order
    PRIVATE
        dependency_checker.h
        list_lattice.h
        list_od.h
        order.h
        order_utility.h
        sorted_partitions.h
)
target_sources(Desbordante.od.order
    PRIVATE
        dependency_checker.cpp
        list_lattice.cpp
        order.cpp
        order_utility.cpp
        sorted_partitions.cpp
)
target_link_libraries(Desbordante.od.order PRIVATE model.table spdlog::spdlog_header_only)