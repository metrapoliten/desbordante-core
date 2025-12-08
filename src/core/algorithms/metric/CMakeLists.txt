set(name verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX metric
    SRCS highlight_calculator.cpp metric_verifier.cpp points_calculator.cpp
    LIBS ${Desb}.model.table ${Desb}.algos
)
add_headers(${name}
    PRIVATE
        aliases.h
        enums.h
        highlight.h
        highlight_calculator.h
        metric_verifier.h
        points.h
        points_calculator.h
)