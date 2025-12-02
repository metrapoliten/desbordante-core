add_subdirectory(split)
add_subdirectory(dd_verifier)

add_library(dd.dd INTERFACE)
add_library(dd::dd ALIAS dd.dd)

add_headers(dd.dd INTERFACE dd.h)

target_link_libraries(dd.verifier PRIVATE dd::dd model.table model.types)
target_link_libraries(dd.split PRIVATE dd::dd model.table model.types)