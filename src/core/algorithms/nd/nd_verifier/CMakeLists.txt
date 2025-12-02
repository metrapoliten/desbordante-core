add_library(nd.verifier)
add_library(nd::verifier ALIAS nd.verifier)

add_headers(nd.verifier
    PRIVATE
        nd_verifier.h
        util/highlight.h
        util/stats_calculator.h
        util/value_combination.h
)

target_sources(nd.verifier
    PRIVATE
        nd_verifier.cpp
        util/highlight.cpp
        util/stats_calculator.cpp
        util/value_combination.cpp
)

target_link_libraries(nd.verifier PRIVATE model.table)