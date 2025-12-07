add_library(Desbordante.dd.verifier)
add_library(Desbordante::dd::verifier ALIAS Desbordante.dd.verifier)

add_headers(Desbordante.dd.verifier PRIVATE dd_verifier.h highlight.h)
target_sources(Desbordante.dd.verifier PRIVATE dd_verifier.cpp)
