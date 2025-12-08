set(name order)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX od
    SRCS
        dependency_checker.cpp
        list_lattice.cpp
        order.cpp
        order_utility.cpp
        sorted_partitions.cpp
    LIBS ${Desb_PREFIX}.model.table spdlog::spdlog_header_only ${Desb_PREFIX}.algos
)

add_headers(Desbordante.od.order
    PRIVATE
        dependency_checker.h
        list_lattice.h
        list_od.h
        order.h
        order_utility.h
        sorted_partitions.h
)