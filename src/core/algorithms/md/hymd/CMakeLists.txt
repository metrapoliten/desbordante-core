set(name hy)
Desbordante_AddLibrary(${name}
    PREFIX md
    SRCS
        indexes/dictionary_compressor.cpp
        indexes/keyed_position_list_index.cpp
        indexes/records_info.cpp
        indexes/similarity_index.cpp

        lattice/cardinality/min_picker_lattice.cpp
        lattice/cardinality/min_picking_level_getter.cpp
        lattice/cardinality/one_by_one_min_picker.cpp

        lattice/md_lattice.cpp

        hymd.cpp
        lattice_traverser.cpp
        record_pair_inferrer.cpp
        similarity_data.cpp
        validator.cpp
    LIBS ${Desb}.md.hy.preprocessing ${Desb}.md spdlog::spdlog_header_only
)

add_headers(${name}
    PRIVATE
        hymd.h
        indexes/column_similarity_info.h
        indexes/compressed_records.h
        indexes/dictionary_compressor.h
        indexes/global_value_identifier.h
        indexes/keyed_position_list_index.h
        indexes/pli_cluster.h
        indexes/records_info.h
        indexes/similarity_index.h
        indexes/similarity_matrix.h

        lattice/cardinality/min_picker_lattice.h
        lattice/cardinality/min_picking_level_getter.h
        lattice/cardinality/one_by_one_min_picker.h

        lattice/level_getter.h
        lattice/lhs_specialization.h
        lattice/md.h
        lattice/md_lattice.h
        lattice/md_lattice_node_info.h
        lattice/md_node.h
        lattice/md_specialization.h
        lattice/node_base.h
        lattice/rhs.h
        lattice/single_level_func.h
        lattice/spec_generalization_checker.h
        lattice/support_node.h
        lattice/total_generalization_checker.h
        lattice/validation_info.h

        utility/bit_cast.h
        utility/exclusion_list.h
        utility/index_range.h
        utility/intersection_size.h
        utility/invalidated_rhss.h
        utility/inverse_permutation.h
        utility/java_hash.h
        utility/make_unique_for_overwrite.h
        utility/md_less.h
        utility/reserve_more.h
        utility/size_t_vector_hash.h
        utility/trivial_array.h
        utility/zip.h

        column_classifier_value_id.h
        column_match_info.h
        compressed_record.h
        enums.h
        lattice_traverser.h
        lhs_ccv_ids_info.h
        lowest_bound.h
        lowest_cc_value_id.h
        md_element.h
        md_lhs.h
        pair_comparison_result.h
        recommendation.h
        record_pair_inferrer.h
        rhss.h
        similarity_data.h
        table_identifiers.h
        validator.h
)

set(name hy.preprocessing)
Desbordante_AddLibrary(${name}
    PREFIX md
    SRCS
        preprocessing/column_matches/jaccard.cpp
        preprocessing/column_matches/lcs.cpp
        preprocessing/column_matches/levenshtein.cpp
        preprocessing/column_matches/monge_elkan.cpp
        preprocessing/column_matches/smith_waterman_gotoh.cpp
    LIBS ${Desb}.model.table spdlog::spdlog_header_only
)
add_headers(${name}
     PRIVATE
        preprocessing/ccv_id_pickers/index_uniform.h
        preprocessing/ccv_id_pickers/pick_lhs_ccv_ids_type.h

        preprocessing/column_matches/basic_calculator.h
        preprocessing/column_matches/column_match.h
        preprocessing/column_matches/column_match_impl.h
        preprocessing/column_matches/date_difference.h
        preprocessing/column_matches/equality.h
        preprocessing/column_matches/jaccard.h
        preprocessing/column_matches/lcs.h
        preprocessing/column_matches/levenshtein.h
        preprocessing/column_matches/lv_normalized.h
        preprocessing/column_matches/monge_elkan.h
        preprocessing/column_matches/number_difference.h
        preprocessing/column_matches/pairwise.h
        preprocessing/column_matches/single_transformer.h
        preprocessing/column_matches/smith_waterman_gotoh.h
        preprocessing/column_matches/transformed_columns_holder.h

        preprocessing/build_indexes.h
        preprocessing/encode_results.h
        preprocessing/similarity.h
        preprocessing/valid_table_results.h
)
