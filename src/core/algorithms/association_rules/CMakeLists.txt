add_library(Desbordante.ar)
add_library(Desbordante::ar ALIAS Desbordante.ar)
#todo: apriori
add_headers(Desbordante.ar
    PRIVATE
        ar.h
        apriori.h
        ar_algorithm.h
        ar_algorithm_enums.h
        candidate_hash_tree.h
        node.h
)
target_sources(Desbordante.ar
    PRIVATE
        apriori.cpp
        ar_algorithm.cpp
        candidate_hash_tree.cpp
)
target_link_libraries(Desbordante.ar PRIVATE model.transaction)