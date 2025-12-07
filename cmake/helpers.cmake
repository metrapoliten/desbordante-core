function(add_headers target scope)
    set(files ${ARGN})

    if(NOT TARGET ${target})
        message(FATAL_ERROR "[add_headers] Target wasn't found: \"${target}\"")
    endif()

    if(scope STREQUAL "PUBLIC")
        set(file_set_name "HEADERS")
    elseif(scope STREQUAL "PRIVATE")
        set(file_set_name "privateHeaders")
    elseif(scope STREQUAL "INTERFACE")
        set(file_set_name "interfaceHeaders")
    else()
        message(FATAL_ERROR
                "[add_headers] Invalid scope for target \"${target}\": \"${scope}\"."
                "Possible scopes: PRIVATE, PUBLIC, INTERFACE."
        )
    endif()

    target_sources(${target}
        ${scope}
            FILE_SET ${file_set_name}
            TYPE HEADERS
            BASE_DIRS ${PROJECT_SOURCE_DIR}/src #todo: make good
            FILES ${files}
    )
endfunction()

function(target_link_with_given given scope)
    foreach(target IN LISTS given)
        if(NOT TARGET ${target})
            message(FATAL_ERROR "[target_link_with_given] Target wasn't found: \"${target}\"")
        endif()
    endforeach()

    foreach(target IN LISTS ARGN)
        if(NOT TARGET ${target})
            message(FATAL_ERROR "[target_link_with_given] Target wasn't found: \"${target}\"")
        endif()
        target_link_libraries(${target} ${scope} ${given})
    endforeach()
endfunction()

function(Desbordante_AddTarget name)
    set(singleVals TYPE)
    set(multiVals _SRCS _LIBS)

    cmake_parse_arguments(args "" "${singleVals}" "${multiVals}" ${ARGN})
    if(args_TYPE STREQUAL "EXE")
        add_executable(${name} ${args_SRCS})
    elseif(args_TYPE STREQUAL "LIB")
        add_library(${name} ${args_SRCS}) #todo: target_srcs?
    else()
        message(FATAL_ERROR "add_target: TYPE must be EXE or LIB")
    endif()
    set_target_properties(${name} PROPERTIES LINK_LIBRARIES_ONLY_TARGETS ON)
    if(args_LIBS)
        target_link_libraries(${name} PRIVATE ${args_LIBS})
    endif()
endfunction()