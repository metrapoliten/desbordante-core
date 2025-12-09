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
    LIBS ${Desb}.model.table spdlog::spdlog_header_only ${Desb}.algos
)
add_headers(${name}
    PRIVATE
        dependency_checker.h
        list_lattice.h
        list_od.h
        order.h
        order_utility.h
        sorted_partitions.h
)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")