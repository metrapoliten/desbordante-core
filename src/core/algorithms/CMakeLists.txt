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
        Desbordante::ac
        Desbordante::ar
        Desbordante::cfd
        Desbordante::cfd::verifier
        Desbordante::datastats
        Desbordante::dd::split
        Desbordante::fd::aid
        Desbordante::fd::depminer
        Desbordante::fd::dfd
        Desbordante::fd::euler
        Desbordante::fd::fastfds
        Desbordante::fd::fdep
        Desbordante::fd::fun
        Desbordante::fd::hy
        Desbordante::fd::mine
        Desbordante::fd::pfd_verifier
        Desbordante::fd::pyro
        Desbordante::fd::sfd::cords
        Desbordante::fd::tane
        Desbordante::fd::tane::pfd
        Desbordante::fd::verifier
        Desbordante::gfd::validator
        Desbordante::ind::faida
        Desbordante::ind::spider
        Desbordante::ind::verifier
        Desbordante::metric::verifier
        ${Desb_PREFIX}.md.hy
        Desbordante::nar::des
        Desbordante::od::order
        Desbordante::ucc::hy
        Desbordante::ucc::pyro
        Desbordante::ucc::hpivalid
        ${Desb_PREFIX}::ucc::verifier
        ${Desb_PREFIX}::od::fast
)

set(name algos)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS algo_factory.cpp algorithm.cpp
    LIBS ${Desb_PREFIX}.util ${Desb_PREFIX}.config ${Desb_PREFIX}.parser.csv spdlog::spdlog_header_only
)
add_headers(${name} PRIVATE algo_factory.h algorithm.h)

foreach(DIR IN LISTS ALGO_SUBDIRS)
    add_subdirectory(${DIR})
endforeach()
