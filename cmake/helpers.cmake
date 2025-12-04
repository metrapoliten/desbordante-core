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