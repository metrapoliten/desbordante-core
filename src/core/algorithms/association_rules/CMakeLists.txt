add_library(ar)
#todo: apriori
add_headers(ar
    PRIVATE
        ar.h
        apriori.h
        ar_algorithm.h
        ar_algorithm_enums.h
        candidate_hash_tree.h
        node.h
)
target_sources(ar
    PRIVATE
        apriori.cpp
        ar_algorithm.cpp
        candidate_hash_tree.cpp
)
target_link_libraries(ar PRIVATE model.transaction)