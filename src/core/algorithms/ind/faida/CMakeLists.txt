add_library(Desbordante.ind.faida)
add_library(Desbordante::ind::faida ALIAS Desbordante.ind.faida)

#add_headers(ind.faida
#    PUBLIC
#
#)
add_headers(Desbordante.ind.faida
    PRIVATE
        candidate_generation/apriori_candidate_generator.h

        hashing/hashing.h
        hashing/murmur_hash_3.h

        inclusion_testing/combined_inclusion_tester.h
        inclusion_testing/hll_data.h
        inclusion_testing/hyperloglog.h
        inclusion_testing/iinclusion_tester.h
        inclusion_testing/sampled_inverted_index.h

        preprocessing/abstract_column_store.h
        preprocessing/hashed_column_store.h
        preprocessing/hashed_column_store.h
        preprocessing/irow_iterator.h
        preprocessing/preprocessor.h

        util/simple_cc.h
        util/simple_ind.h

        faida.h
)
target_sources(Desbordante.ind.faida
    PRIVATE
        candidate_generation/apriori_candidate_generator.cpp
        hashing/murmur_hash_3.cpp

        inclusion_testing/combined_inclusion_tester.cpp
        inclusion_testing/sampled_inverted_index.cpp

        preprocessing/abstract_column_store.cpp
        preprocessing/hashed_column_store.cpp
        preprocessing/preprocessor.cpp

        util/simple_ind.cpp

        faida.cpp
)

target_link_libraries(Desbordante.ind.faida PRIVATE spdlog::spdlog_header_only)
