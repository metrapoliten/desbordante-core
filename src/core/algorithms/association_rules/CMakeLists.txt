add_library(ar)

target_sources(ar
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
        FILES
            ar.h
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