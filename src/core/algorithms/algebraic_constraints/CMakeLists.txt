add_library(Desbordante.ac)
add_library(Desbordante::ac ALIAS Desbordante.ac)
add_headers(Desbordante.ac PRIVATE ac.h ac_algorithm.h)
target_sources(Desbordante.ac PRIVATE
    ac_algorithm.cpp
    ac_exception_finder.cpp
)
target_link_libraries(Desbordante.ac PRIVATE model.table model.types spdlog::spdlog_header_only)
