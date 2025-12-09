set(name verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX md
    SRCS validation/validation.cpp md_verifier.cpp
    LIBS ${Desb}.md.hy ${Desb}.md spdlog::spdlog_header_only better-enums
)
add_headers(${name} PRIVATE highlights/highlights.h validation/validation.h cmptr.h column_similarity_classifier.h md_verifier.h)