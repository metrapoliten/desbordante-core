include_guard(GLOBAL)
set(Desb "Desbordante" CACHE STRING "")

function(add_headers target scope)
    set(files ${ARGN})

    if(NOT TARGET ${target})
        message(FATAL_ERROR "Cannot specify headers for target: \"${target}\" which isn't  built by this project")
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
    if(files)
        target_sources(${target}
            ${scope}
                FILE_SET ${file_set_name}
                TYPE HEADERS
                BASE_DIRS ${PROJECT_SOURCE_DIR}/src #todo: can i do it better?
                FILES ${files}
        )
    else()
        target_sources(${target}
            ${scope}
                FILE_SET ${file_set_name}
                TYPE HEADERS
                BASE_DIRS ${PROJECT_SOURCE_DIR}/src
        )
    endif()
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
    set(singleVals PREFIX TYPE LIB_TYPE)
    set(multiVals SRCS LIBS)

    cmake_parse_arguments(args "" "${singleVals}" "${multiVals}" ${ARGN})
    if("${args_PREFIX}" STREQUAL "")
        set(name "${Desb}.${name}")
    else()
        set(name "${Desb}.${args_PREFIX}.${name}")
    endif()
    if(args_TYPE STREQUAL "EXE")
        add_executable(${name})
    elseif(args_TYPE STREQUAL "LIB")
        if(NOT args_LIB_TYPE)
            add_library(${name})
        elseif(args_LIB_TYPE STREQUAL "INTERFACE")
            add_library(${name} INTERFACE)
        else()
            message(FATAL_ERROR "Unknown lib type")
        endif ()
    else()
        message(FATAL_ERROR "add_target: TYPE must be EXE or LIB")
    endif()
    if(args_SRCS)
        target_sources(${name} PRIVATE ${args_SRCS})
    endif()
    add_headers(${name} PUBLIC)
    set_target_properties(${name} PROPERTIES LINK_LIBRARIES_ONLY_TARGETS ON)
    if(args_LIBS)
        target_link_libraries(${name} PRIVATE ${args_LIBS})
    endif()
    return(PROPAGATE name)
endfunction()

function(Desbordante_AddLibrary name)
    set(noVals CREATE_ALIAS)
    set(singleVals PREFIX LIB_TYPE)
    set(multiVals SRCS LIBS)
    cmake_parse_arguments(args "${noVals}" "${singleVals}" "${multiVals}" ${ARGN})
    Desbordante_AddTarget(${name}
            PREFIX ${args_PREFIX}
            TYPE LIB
            LIB_TYPE ${args_LIB_TYPE}
            SRCS ${args_SRCS}
            LIBS ${args_LIBS}
    )
    if(args_CREATE_ALIAS)
        string(REPLACE "." "::" alias "${name}")
        add_library(${alias} ALIAS ${name})
    endif()
    return(PROPAGATE name)
endfunction()
