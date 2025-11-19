function(add_headers TARGET SCOPE)
    set(files ${ARGN})

    if(NOT TARGET ${HD_TARGET})
        message(FATAL_ERROR "[add_headers] TARGET \"${HD_TARGET}\" не существует.")
    endif()

    if(SCOPE STREQUAL "PUBLIC")
        set(FILESET_NAME "HEADERS")
    elseif(SCOPE STREQUAL "PRIVATE")
        set(FILESET_NAME "privateHeaders")
    elseif(SCOPE STREQUAL "INTERFACE")
        set(FILESET_NAME "interfaceHeaders")
    else()
        message(FATAL_ERROR
                "[add_headers] Некорректная SCOPE: \"${HD_SCOPE}\". "
                "Ожидается PUBLIC, PRIVATE или INTERFACE."
        )
    endif()

    target_sources(${TARGET}
            ${SCOPE}
            FILE_SET ${FILESET_NAME}
            TYPE HEADERS
            BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
            FILES ${files}
    )
endfunction()


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
            algorithms.h
            algorithm_types.h
            create_algorithm.h
)

add_library(algos)
target_sources(algos
    PUBLIC
        FILE_SET HEADERS
        FILES
            algo_factory.h
            algorithm.h
    PRIVATE
        algo_factory.cpp
        algorithm.cpp
)

foreach(DIR IN LISTS ALGO_SUBDIRS)
    add_subdirectory(${DIR})
endforeach()

target_link_libraries(IND PRIVATE create_algo)

function(target_link_with_given GIVEN SCOPE)
    foreach(TARGET IN LISTS ARGN)
        if(TARGET ${TARGET})
            target_link_libraries(${TARGET} ${SCOPE} ${GIVEN})
        else()
            message(WARNING "Target '${TARGET}' doesn't exist")
        endif()
    endforeach()
endfunction()

target_link_with_given(algos PRIVATE ac ar cfd.cfd cfd.verifier dc.fastadc dc.verifier dd.verifier dd.split FD GFD IND MD METRIC NAR ND OD stat ucc)
#target_link_libraries(algos PUBLIC AC AR cfd.cfd cfd.verifier DC DD FD GFD IND MD METRIC NAR ND OD stat ucc)