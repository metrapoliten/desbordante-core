set(ALGO_SUBDIRS
        algebraic_constraints
        association_rules
        cfd
        dc
        dd
        fd
        gfd
        ind
        md
        metric
        nar
        nd
        od/fastod
        od/order
        od/set_based_verifier
        statistics
        ucc
)

set(name create_algo)
Desbordante_AddLibrary(${name}
    LIB_TYPE INTERFACE
)
add_headers(${name}
    INTERFACE
        algorithms.h
        algorithm_types.h
        create_algorithm.h
)
target_link_libraries(${name}
    INTERFACE
        ${Desb}::ac
        ${Desb}::ar
        ${Desb}::cfd
        ${Desb}::cfd::verifier
        ${Desb}::datastats
        ${Desb}::dd::split
        ${Desb}::fd::aid
        ${Desb}::fd::depminer
        ${Desb}::fd::dfd
        ${Desb}::fd::euler
        ${Desb}::fd::fastfds
        ${Desb}::fd::fdep
        ${Desb}::fd::fun
        ${Desb}::fd::hy
        ${Desb}::fd::mine
        ${Desb}::fd::pfd_verifier
        ${Desb}::fd::pyro
        ${Desb}::fd::sfd::cords
        ${Desb}::fd::tane
        ${Desb}::fd::tane::pfd
        ${Desb}::fd::verifier
        ${Desb}::gfd::validator
        ${Desb}::ind::faida
        ${Desb}::ind::spider
        ${Desb}::ind::verifier
        ${Desb}::metric::verifier
        ${Desb}.md.hy
        ${Desb}::nar::des
        ${Desb}::od::order
        ${Desb}::ucc::hy
        ${Desb}::ucc::pyro
        ${Desb}::ucc::hpivalid
        ${Desb}::ucc::verifier
        ${Desb}::od::fast
)

set(name algos)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS algo_factory.cpp algorithm.cpp
    LIBS ${Desb}.util ${Desb}.config ${Desb}.parser.csv spdlog::spdlog_header_only
)
add_headers(${name} PRIVATE algo_factory.h algorithm.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")

foreach(DIR IN LISTS ALGO_SUBDIRS)
    add_subdirectory(${DIR})
endforeach()
