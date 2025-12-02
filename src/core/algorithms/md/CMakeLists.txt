add_subdirectory(hymd)
add_subdirectory(md_verifier)

add_library(md.md)
add_library(md::md ALIAS md.md)

add_headers(md.md
    PRIVATE
        column_match.h
        column_similarity_classifier.h
        decision_boundary.h
        lhs_column_similarity_classifier.h
        md.h
        md_algorithm.h
        similarity.h
)
target_sources(md.md PRIVATE md.cpp)

target_link_with_given(md::md PRIVATE md.hy md.verifier)
