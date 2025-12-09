set(name ar)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS
        apriori.cpp
        ar_algorithm.cpp
        candidate_hash_tree.cpp
    LIBS ${Desb}.model.transaction ${Desb}.algos spdlog::spdlog_header_only better-enums Boost::headers
)
#todo: apriori
add_headers(${name}
    PRIVATE
        ar.h
        apriori.h
        ar_algorithm.h
        ar_algorithm_enums.h
        candidate_hash_tree.h
        node.h
)
