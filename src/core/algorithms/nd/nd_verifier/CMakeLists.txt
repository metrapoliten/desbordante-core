add_library(Desbordante.nd.verifier)
add_library(Desbordante::nd::verifier ALIAS Desbordante.nd.verifier)

add_headers(Desbordante.nd.verifier
    PRIVATE
        nd_verifier.h
        util/highlight.h
        util/stats_calculator.h
        util/value_combination.h
)

target_sources(Desbordante.nd.verifier
    PRIVATE
        nd_verifier.cpp
        util/highlight.cpp
        util/stats_calculator.cpp
        util/value_combination.cpp
)

target_link_libraries(Desbordante.nd.verifier PRIVATE model.table)