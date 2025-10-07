add_library(AC STATIC)

target_sources(AC
    PUBLIC
        FILE_SET HEADERS
    PUBLIC
        ac_algorithm.cpp
        ac_exception_finder.cpp
)
