add_library(AR)

target_sources(AR
        PUBLIC
            FILE_SET HEADERS
            FILES
                ar.h
                mining_algorithms.h
        PRIVATE
            FILE_SET privateHeaders
            TYPE HEADERS
            FILES
                apriori.h
                ar_algorithm.h
                ar_algorithm_enums.h
                candidate_hash_tree.h
                node.h
        PRIVATE
            apriori.cpp
            ar_algorithm.cpp
            candidate_hash_tree.cpp
)