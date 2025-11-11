add_subdirectory(algebraic_constraints)
add_subdirectory(association_rules)
add_subdirectory(cfd)
add_subdirectory(dc)
add_subdirectory(dd)
add_subdirectory(fd)
add_subdirectory(gfd)
add_subdirectory(ind)
add_subdirectory(md)
add_subdirectory(metric)
add_subdirectory(nar)
add_subdirectory(nd)
add_subdirectory(od)
add_subdirectory(statistics)
add_subdirectory(ucc)

add_library(algorithms_headers INTERFACE)
target_sources(algorithms_headers
    INTERFACE
        FILE_SET HEADERS
        FILES
            algorithm.h
            algo_factory.h
            algorithms.h
            algorithm_types.h
            create_algorithm.h
)

add_library(algorithms_impl
        algo_factory.cpp
        algorithm.cpp
)

target_link_libraries(algorithms_impl PUBLIC algorithms_headers)

add_library(algos INTERFACE)

#add_library(common)
#target_sources(common
#    PUBLIC
#        FILE_SET HEADERS
#        FILES
#            algorithm.h
#            algo_factory.h
#        PRIVATE
#            algo_factory.cpp
#            algorithm.cpp
#)

#add_library(create INTERFACE)
#target_sources(create
#    PRIVATE
#        FILE_SET HEADERS
#        FILES
#            algorithms.h
#            algorithm_types.h
#            create_algorithm.h
#)

#target_link_libraries(common PRIVATE create)

#function(link_targets_with_create)
#    foreach(TARGET IN LISTS ARGN)
#        if(TARGET ${TARGET})
#            target_link_libraries(create INTERFACE ${TARGET})
#        else()
#            message(WARNING "Target '${TARGET}' doesn't exist")
#        endif()
#    endforeach()
#endfunction()

function(link_algos_with_headers)
    foreach(TARGET IN LISTS ARGN)
        if(TARGET ${TARGET})
            target_link_libraries(${TARGET} PUBLIC algorithms_headers)
        else()
            message(WARNING "Target '${TARGET}' doesn't exist")
        endif()
    endforeach()
endfunction()

link_algos_with_headers(AR cfd cfd_verifier DC DD FD GFD IND MD METRIC NAR ND OD stat ucc)
#link_targets_with_create(AR CFD DC DD FD GFD IND MD METRIC NAR ND OD stat ucc)
#target_link_libraries(IND PRIVATE create)

#add_library(algos)

#function(link_targets_with_algos)
#    foreach(TARGET IN LISTS ARGN)
#        if(TARGET ${TARGET})
#            target_link_libraries(algos PRIVATE ${TARGET})
#        else()
#            message(WARNING "Target '${TARGET}' doesn't exist")
#        endif()
#    endforeach()
#endfunction()

function(link_targets_with_algos)
    foreach(TARGET IN LISTS ARGN)
        if(TARGET ${TARGET})
            target_link_libraries(algos INTERFACE ${TARGET})
        else()
            message(WARNING "Target '${TARGET}' doesn't exist")
        endif()
    endforeach()
endfunction()

link_targets_with_algos(AR cfd cfd_verifier DC DD FD GFD IND MD METRIC NAR ND OD stat ucc)
