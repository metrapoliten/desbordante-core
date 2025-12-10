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
    set(noVals CREATE_ALIAS)
    set(singleVals PREFIX TYPE)
    set(multiVals SRCS LIBS)

    cmake_parse_arguments(arg "${noVals}" "${singleVals}" "${multiVals}" ${ARGN})

    if(DEFINED ${arg_PREFIX})
        set(name "${Desb}.${args_PREFIX}.${name}")
    else()
        set(name "${Desb}.${name}")
    endif()

    if(arg_TYPE STREQUAL "EXE")
        add_executable(${name})
    elseif(arg_TYPE STREQUAL "LIB")
        add_library(${name})
    elseif(arg_TYPE STREQUAL "INTERFACE")
        add_library(${name} INTERFACE)
    elseif(arg_TYPE STREQUAL "OBJECT")
        add_library(${name} OBJECT)
    else()
        add_library(${name} ${arg_TYPE})
    endif()

    set_target_properties(${name} PROPERTIES LINK_LIBRARIES_ONLY_TARGETS ON)
    target_compile_features(${name} PUBLIC cxx_std_14)

    macro(processScope scope raw_args)
        if(NOT "${raw_args}" STREQUAL "")
            set(innerNoVals "")
            set(innerOneVals "")
            set(innerMultiVals SRCS HDRS LIBS)

            cmake_parse_arguments(innerArg "${innerNoVals}" "${innerOneVals}" "${innerMultiVals}" ${raw_args})

            if(innerArg_SRCS)
                target_sources(${name} ${scope} ${innerArg_SRCS})
            endif()

            if (innerArg_HDRS)
                add_headers(${name} ${scope} ${innerArg_HDRS})
            endif ()

            if(innerArg_LIBS)
                target_link_libraries(${name} ${scope} ${innerArg_LIBS})
            endif()
        endif()
    endmacro()

    process_scope(PRIVATE "${arg_PRIVATE}")
    process_scope(PUBLIC "${arg_PUBLIC}")
    process_scope(INTERFACE "${arg_INTERFACE}")

    if(arg_CREATE_ALIAS AND arg_TYPE NOT STREQUAL "EXE")
        string(REPLACE "." "::" alias "${name}")
        add_library(${alias} ALIAS ${name})
    endif()

    return(PROPAGATE name)
endfunction()

