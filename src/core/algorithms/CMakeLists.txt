set(ALGO_SUBDIRS
        algebraic_constraints
        association_rules
        cfd
#        dc
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
            algorithms.h
            algorithm_types.h
            create_algorithm.h
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

target_link_libraries(IND PRIVATE create_algo)

function(target_link_with_algos)
    foreach(TARGET IN LISTS ARGN)
        if(TARGET ${TARGET})
            target_link_libraries(${TARGET} PUBLIC algos)
        else()
            message(WARNING "Target '${TARGET}' doesn't exist")
        endif()
    endforeach()
endfunction()

target_link_with_algos(ac ar cfd.cfd cfd.verifier dc.fastadc dc.verifier DD FD GFD IND MD METRIC NAR ND OD stat ucc)
#target_link_libraries(algos PUBLIC AC AR cfd.cfd cfd.verifier DC DD FD GFD IND MD METRIC NAR ND OD stat ucc)