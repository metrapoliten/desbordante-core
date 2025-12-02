add_library(dd.verifier)
add_library(dd::verifier ALIAS dd.verifier)

add_headers(dd.verifier PRIVATE dd_verifier.h highlight.h)
target_sources(dd.verifier PRIVATE dd_verifier.cpp)
