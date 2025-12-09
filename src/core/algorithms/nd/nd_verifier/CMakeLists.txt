set(name verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX nd
    SRCS nd_verifier.cpp util/highlight.cpp util/stats_calculator.cpp util/value_combination.cpp
    LIBS ${Desb}.model.table ${Desb}.algos spdlog::spdlog_header_only better-enums
)
add_headers(${name}
    PRIVATE
        nd_verifier.h
        util/highlight.h
        util/stats_calculator.h
        util/value_combination.h
)