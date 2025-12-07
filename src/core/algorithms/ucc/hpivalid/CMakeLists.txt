add_library(Desbordante.ucc.hpivalid)
add_library(Desbordante::ucc::hpivalid ALIAS Desbordante.ucc.hpivalid)

add_headers(Desbordante.ucc.hpivalid
    PRIVATE
        config.h
        enums.h
        hpivalid.h
        hypergraph.h
        pli_table.h
        result_collector.h
        tree_search.h
)
target_sources(Desbordante.ucc.hpivalid
    PRIVATE
        hpivalid.cpp
        hypergraph.cpp
        result_collector.cpp
        tree_search.cpp
)

target_link_libraries(Desbordante.ucc.hpivalid PRIVATE spdlog::spdlog_header_only fd::hycommon)