add_library(Desbordante.ind.verifier)
add_library(Desbordante::ind::verifier ALIAS Desbordante.ind.verifier)

add_headers(Desbordante.ind.verifier PRIVATE ind_verifier.h)
target_sources(Desbordante.ind.verifier PRIVATE ind_verifier.cpp)
