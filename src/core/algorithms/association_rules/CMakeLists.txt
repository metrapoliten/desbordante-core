add_library(AR)

target_sources(AR
        PRIVATE
            FILE_SET HEADERS
        PUBLIC
            apriori.cpp
            ar_algorithm.cpp
            candidate_hash_tree.cpp
)