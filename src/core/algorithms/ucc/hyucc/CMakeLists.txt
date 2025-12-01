add_library(ucc.hy)
add_library(ucc::hy ALIAS ucc.hy)

add_headers(ucc.hy
    PRIVATE
        hyucc.h
        inductor.h
        preprocessor.h
        sampler.h
        validator.h
        model/non_ucc_list.h
        model/ucc_tree.h
        model/ucc_tree_vertex.h
)
target_sources(ucc.hy
    PRIVATE
        hyucc.cpp
        inductor.cpp
        validator.cpp
        model/ucc_tree.cpp
        model/ucc_tree_vertex.cpp
)

target_link_libraries(ucc.hy PRIVATE spdlog::spdlog_header_only)
