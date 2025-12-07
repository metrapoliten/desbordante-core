add_library(Desbordante.dc.verifier)
add_library(Desbordante::dc::verifier ALIAS Desbordante.dc.verifier)
add_headers(Desbordante.dc.verifier PRIVATE dc_verifier.h)
target_sources(Desbordante.dc.verifier PRIVATE dc_verifier.cpp)

target_link_libraries(Desbordante.dc.verifier PRIVATE model.table model.types)
