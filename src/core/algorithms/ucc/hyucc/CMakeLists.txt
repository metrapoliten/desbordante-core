add_library(Desbordante.ucc.hy)
add_library(Desbordante::ucc::hy ALIAS Desbordante.ucc.hy)

add_headers(Desbordante.ucc.hy
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
target_sources(Desbordante.ucc.hy
    PRIVATE
        hyucc.cpp
        inductor.cpp
        validator.cpp
        model/ucc_tree.cpp
        model/ucc_tree_vertex.cpp
)

target_link_libraries(Desbordante.ucc.hy PRIVATE spdlog::spdlog_header_only config fd::hycommon Desbordante::ucc)
