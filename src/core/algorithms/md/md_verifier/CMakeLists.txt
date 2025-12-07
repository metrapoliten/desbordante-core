add_library(Desbordante.md.verifier)
add_library(Desbordante::md::verifier ALIAS Desbordante.md.verifier)

add_headers(Desbordante.md.verifier
    PRIVATE
        highlights/highlights.h
        validation/validation.h
        cmptr.h
        column_similarity_classifier.h
        md_verifier.h
)
target_sources(Desbordante.md.verifier
    PRIVATE
        validation/validation.cpp
        md_verifier.cpp
)

target_link_libraries(Desbordante.md.verifier PRIVATE md::hy)