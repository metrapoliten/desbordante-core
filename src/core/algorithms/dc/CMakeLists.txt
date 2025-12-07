add_subdirectory(FastADC)
add_subdirectory(verifier)

add_library(dc.model)
add_headers(dc.model
    PRIVATE
        FILES
            model/component.h
            model/dc.h
            model/operator.h
            model/point.h
            model/predicate.h
            model/column_operand.h
            model/tuple.h
)
target_sources(dc.model PRIVATE model/component.cpp model/dc.cpp)

add_library(dc.parser)
add_headers(dc.parser PRIVATE parser/dc_parser.h)
target_sources(dc.parser PRIVATE parser/dc_parser.cpp)

target_link_libraries(Desbordante.dc.verifier PRIVATE dc.model dc.parser)
