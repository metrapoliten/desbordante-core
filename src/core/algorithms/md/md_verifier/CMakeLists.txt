add_library(md.verifier)
add_library(md::verifier ALIAS md.verifier)

add_headers(md.verifier
    PRIVATE
        highlights/highlights.h
        validation/validation.h
        cmptr.h
        column_similarity_classifier.h
        md_verifier.h
)
target_sources(md.verifier
    PRIVATE
        validation/validation.cpp
        md_verifier.cpp
)
