add_library(AR STATIC)

target_sources(AR
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        apriori.cpp
        ar_algorithm.cpp
        candidate_hash_tree.cpp
)