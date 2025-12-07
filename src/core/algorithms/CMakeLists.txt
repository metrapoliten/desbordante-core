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

add_library(create_algo INTERFACE)
add_headers(create_algo
    INTERFACE
        algorithms.h
        algorithm_types.h
        create_algorithm.h
)

add_library(algos)
add_headers(algos PRIVATE algo_factory.h algorithm.h)
target_sources(algos PRIVATE algo_factory.cpp algorithm.cpp)

foreach(DIR IN LISTS ALGO_SUBDIRS)
    add_subdirectory(${DIR})
endforeach()

target_link_libraries(create_algo INTERFACE fd::depminer fd::dfd fd::fastfds fd::fdep fd::mine fd::pyro fd::tane::tane
                                            fd::tane::pfd fd::fun fd::hy fd::aid fd::euler Desbordante.ar nar::des metric.verifier
                                            datastats fd::verifier ucc::hy ucc::pyro ucc::hpivalid Desbordante::cfd Desbordante::ac
                                            ucc::verifier ind::faida ind::spider ind::verifier od::fastod gfd::validator
                                            od::order dd::split fd::sfd::cords md::hy fd::pfdverifier Desbordante::cfd::verifier

)
target_link_libraries(ind.mind PRIVATE create_algo)

target_link_with_given(algos
    PRIVATE
        Desbordante.ac
        Desbordante.ar
        Desbordante.cfd.cfd
        Desbordante.cfd.verifier
        Desbordante.dc.verifier
        Desbordante.dd.verifier
        dd.split
        fd.fd
        gfd.miner
        gfd.validator
        ind.ind
        md.md
        metric.verifier
        nd.verifier
        od.fastod
        od.order
        datastats
        ucc.hy
)
target_link_libraries(algos PRIVATE util)