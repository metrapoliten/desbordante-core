add_subdirectory(split)
add_subdirectory(dd_verifier)

add_library(dd.dd INTERFACE)
add_library(dd::dd ALIAS dd.dd)

add_headers(dd.dd INTERFACE dd.h)

target_link_with_given("dd::dd;model.table;model.types;spdlog::spdlog_header_only"
    PRIVATE
        Desbordante.dd.verifier Desbordante.dd.split
)