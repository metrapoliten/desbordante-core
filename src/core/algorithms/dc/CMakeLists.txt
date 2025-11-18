add_library(DC)

add_subdirectory(verifier)

add_library(dcmodel EXCLUDE_FROM_ALL)
target_sources(dcmodel
    PUBLIC
        FILE_SET HEADERS
        FILES
            model/component.h
            model/dc.h
            model/operator.h
            model/point.h
            model/predicate.h
    PRIVATE
        FILE_SET privateHeaders
        TYPE HEADERS
        FILES
            model/column_operand.h
            model/tuple.h
    PRIVATE
        model/component.cpp
        model/dc.cpp
)

add_library(parser EXCLUDE_FROM_ALL)
target_sources(parser
    PUBLIC
        FILE_SET HEADERS
        FILES parser/dc_parser.h
    PRIVATE
        parser/dc_parser.cpp
)

target_link_libraries(dc_verifier PRIVATE dcmodel parser)

file(GLOB_RECURSE dc_sources
        "${CMAKE_CURRENT_LIST_DIR}/*.h"
        "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
)

target_sources(DC
    PUBLIC
        FILE_SET HEADERS
    PUBLIC
        ${dc_sources}
)