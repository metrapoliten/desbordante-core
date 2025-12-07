add_library(Desbordante.od.set_based_aod_verifier)
add_library(Desbordante::od::set_based_aod_verifier ALIAS Desbordante.od.set_based_aod_verifier)

add_headers(Desbordante.od.set_based_aod_verifier PRIVATE verifier.h)
target_sources(Desbordante.od.set_based_aod_verifier PRIVATE verifier.cpp)