set(name hpivalid)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ucc
    SRCS hpivalid.cpp hypergraph.cpp result_collector.cpp tree_search.cpp
    LIBS spdlog::spdlog_header_only ${Desb_PREFIX}.fd.hy.common
)

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