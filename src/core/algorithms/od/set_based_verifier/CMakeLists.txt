add_library(od.set_based_aod_verifier)
add_library(od::set_based_aod_verifier ALIAS od.set_based_aod_verifier)

add_headers(od.set_based_aod_verifier PRIVATE verifier.h)
target_sources(od.set_based_aod_verifier PRIVATE verifier.cpp)