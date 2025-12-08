add_subdirectory(FastADC)
add_subdirectory(verifier)

set(name dc.model)
Desbordante_AddLibrary(${name}
    SRCS model/component.cpp model/dc.cpp
    LIBS ${Desb_PREFIX}.algos
)
add_headers(${name}
    PRIVATE
        model/component.h
        model/dc.h
        model/operator.h
        model/point.h
        model/predicate.h
        model/column_operand.h
        model/tuple.h
)
set(name dc.parser)
Desbordante_AddLibrary(${name}
    SRCS parser/dc_parser.cpp
)
add_headers(${name} PRIVATE parser/dc_parser.h)
