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
        od
        statistics
        ucc
)

add_library(create_algo INTERFACE)
target_sources(create_algo
    INTERFACE
        FILE_SET HEADERS
        FILES
        create_algorithm.h
        algorithm_types.h
        algorithms.h
)

add_library(algos)
target_sources(algos
    PUBLIC
        FILE_SET HEADERS
        FILES
            algorithm.h
            algo_factory.h
    PRIVATE
        algo_factory.cpp
        algorithm.cpp
)

foreach(DIR IN LISTS ALGO_SUBDIRS)
    add_subdirectory(${DIR})
endforeach()

target_link_libraries(create_algo INTERFACE AC AR cfd cfd_verifier DC DD FD GFD IND MD METRIC NAR ND OD stat ucc)
target_link_libraries(IND PRIVATE create_algo)

target_link_libraries(algos PUBLIC AC AR cfd cfd_verifier DC DD FD GFD IND MD METRIC NAR ND OD stat ucc)
