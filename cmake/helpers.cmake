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
            BASE_DIRS ${PROJECT_SOURCE_DIR}/src
            FILES ${files}
    )
endfunction()

function(target_link_with_given GIVEN SCOPE)
    foreach(TARGET IN LISTS GIVEN)
        if(NOT TARGET ${TARGET})
            message(FATAL_ERROR "[target_link_with_given] TARGET '${TARGET}' doesn't exist.")
        endif()
    endforeach()

    foreach(TARGET IN LISTS ARGN)
        if(TARGET ${TARGET})
            target_link_libraries(${TARGET} ${SCOPE} ${GIVEN})
        else()
            message(FATAL_ERROR "Target '${TARGET}' doesn't exist")
        endif()
    endforeach()
endfunction()

function(Desbordante_AddTarget NAME)
    set(singleVals TYPE)
    set(multiVals SRCS LIBS)

    cmake_parse_arguments(args "" "${singleVals}" "${multiVals}" ${ARGN})
    if(args_TYPE STREQUAL "EXE")
        add_executable(${NAME} ${args_SRCS})
    elseif(args_TYPE STREQUAL "LIB")
        add_library(${NAME} ${args_SRCS}) #todo: target_srcs?
    else()
        message(FATAL_ERROR "add_target: TYPE must be EXE or LIB")
    endif()
    set_target_properties(${NAME} PROPERTIES LINK_LIBRARIES_ONLY_TARGETS ON)
    if(args_LIBS)
        target_link_libraries(${NAME} PRIVATE ${args_LIBS})
    endif()
endfunction()