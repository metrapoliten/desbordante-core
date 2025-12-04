add_library(ac)
add_headers(ac PRIVATE ac.h ac_algorithm.h)
target_sources(ac PRIVATE
    ac_algorithm.cpp
    ac_exception_finder.cpp
)
target_link_libraries(ac PRIVATE model.table model.types spdlog::spdlog_header_only)
