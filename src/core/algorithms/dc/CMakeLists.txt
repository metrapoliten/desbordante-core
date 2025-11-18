add_subdirectory(verifier)

add_library(dc.fastadc)
add_library(dc.model)

target_sources(dc.model
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
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

add_library(dc.parser)
target_sources(dc.parser
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
        FILES parser/dc_parser.h
    PRIVATE
        parser/dc_parser.cpp
)

target_link_libraries(dc.verifier PRIVATE dc.model dc.parser)
