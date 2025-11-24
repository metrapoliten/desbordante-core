add_library(ucc.hpivalid)
add_library(ucc::hpivalid ALIAS ucc.hpivalid)

add_headers(ucc.hpivalid
    PRIVATE
        config.h
        enums.h
        hpivalid.h
        hypergraph.h
        pli_table.h
        result_collector.h
        tree_search.h
)
target_sources(ucc.hpivalid
    PRIVATE
        hpivalid.cpp
        hypergraph.cpp
        result_collector.cpp
        tree_search.cpp
)
