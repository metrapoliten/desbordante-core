add_library(ucc.hy)
add_library(ucc::hy ALIAS ucc.hy)

add_headers(ucc.hy
    PRIVATE
        hyucc.h
        inductor.h
        preprocessor.h
        sampler.h
        validator.h
)
target_sources(ucc.hy
    PRIVATE
        hyucc.cpp
        inductor.cpp
        validator.cpp
)

target_link_libraries(ucc.hy PRIVATE spdlog_helper)
