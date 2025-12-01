add_library(dc.fastadc.structs)
add_library(dc::fastadc::structs ALIAS dc.fastadc.structs)
add_headers(dc.fastadc.structs
    PUBLIC
        misc/misc.h
        model/column_operand.h
        model/denial_constraint.h
        model/evidence.h
        model/evidence_set.h
        model/operator.h
        model/pli_shard.h
        model/predicate.h

        providers/index_provider.h
        providers/index_provider.h

        util/approximate_evidence_inverter.h
        util/common_clue_set_builder.h
        util/evidence_aux_structures_builder.h
        util/evidence_set_builder.h
        util/predicate_builder.h
        util/predicate_organizer.h
)

add_headers(dc.fastadc.structs
    PRIVATE
        misc/typed_column_data_value_differences.h
        model/predicate_set.h
        util/closure.h
        util/clue_set_builder.h
        util/cross_clue_set_builder.h
        util/dc_candidate.h
        util/dc_candidate_trie.h
        util/denial_constraint_set.h
        util/ntree_search.h
        util/single_clue_set_builder.h
)
target_sources(dc.fastadc.structs
    PRIVATE
        misc/typed_column_data_value_differences.cpp
        model/operator.cpp
        model/pli_shard.cpp
        model/predicate.cpp
        model/predicate_set.cpp
        providers/index_provider.cpp
        util/clue_set_builder.cpp
        util/cross_clue_set_builder.cpp
        util/dc_candidate_trie.cpp
        util/evidence_aux_structures_builder.cpp
        util/predicate_builder.cpp
        util/single_clue_set_builder.cpp
)
target_link_libraries(dc.fastadc.structs PRIVATE spdlog_helper)

add_library(dc.fastadc)
add_library(dc::fastadc ALIAS cfd.cfd)

add_headers(dc.fastadc PUBLIC fastadc.h)
target_sources(dc.fastadc PRIVATE fastadc.cpp)
target_link_libraries(dc.fastadc PRIVATE dc::fastadc::structs)