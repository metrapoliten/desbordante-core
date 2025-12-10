add_subdirectory(FastADC)
add_subdirectory(verifier)

set(name model)
Desbordante_AddLibrary(${name}
    PREFIX dc
    SRCS model/component.cpp model/dc.cpp
    LIBS ${Desb}.algos spdlog::spdlog_header_only frozen better-enums Boost::headers
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

set(name parser)
Desbordante_AddLibrary(${name}
    PREFIX dc
    SRCS parser/dc_parser.cpp
    LIBS spdlog::spdlog_header_only frozen better-enums Boost::headers
)
add_headers(${name} PRIVATE parser/dc_parser.h)
