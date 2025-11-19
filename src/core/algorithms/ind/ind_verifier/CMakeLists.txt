add_library(ind.verifier)
add_library(ind::verifier ALIAS ind.verifier)

add_headers(ind.verifier PUBLIC ind_verifier.h)
target_sources(ind.verifier PRIVATE ind_verifier.cpp)
