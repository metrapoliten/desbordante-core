add_subdirectory(hymd)
add_subdirectory(md_verifier)

set(name md)
Desbordante_AddLibrary(${name}
    SRCS md.cpp
    LIBS ${Desb_PREFIX}.algos
)

add_headers(${name}
    PRIVATE
        column_match.h
        column_similarity_classifier.h
        decision_boundary.h
        lhs_column_similarity_classifier.h
        md.h
        md_algorithm.h
        similarity.h
)
