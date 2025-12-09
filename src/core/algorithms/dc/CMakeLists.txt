add_subdirectory(FastADC)
add_subdirectory(verifier)

set(name dc.model)
Desbordante_AddLibrary(${name}
    SRCS model/component.cpp model/dc.cpp
    LIBS ${Desb}.algos spdlog::spdlog_header_only
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
target_include_directories(${name} SYSTEM PRIVATE "${frozen_SOURCE_DIR}/include")
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")

set(name dc.parser)
Desbordante_AddLibrary(${name}
    SRCS parser/dc_parser.cpp
    LIBS spdlog::spdlog_header_only
)
add_headers(${name} PRIVATE parser/dc_parser.h)
target_include_directories(${name} SYSTEM PRIVATE "${frozen_SOURCE_DIR}/include")
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
