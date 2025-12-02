add_library(dc.verifier)
add_library(dc::verifier ALIAS dc.verifier)
add_headers(dc.verifier PRIVATE dc_verifier.h)
target_sources(dc.verifier PRIVATE dc_verifier.cpp)

target_link_libraries(dc.verifier PRIVATE model.table model.types)
