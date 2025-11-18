add_subdirectory(split)
add_subdirectory(dd_verifier)

add_library(dd.dd INTERFACE)
add_library(dd::dd ALIAS dd.dd)

add_headers(dd.dd INTERFACE dd.h)

target_link_libraries(dd.verifier PUBLIC dd::dd)
target_link_libraries(dd.split PUBLIC dd::dd)