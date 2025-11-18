add_library(cfd.verifier)
target_sources(cfd.verifier
    PUBLIC
        FILE_SET HEADERS
        FILES cfd_verifier.h
    PRIVATE
        FILE_SET privateHeaders
        TYPE HEADERS
        FILES
            highlight.h
            cfd_stats_calculator.h
    PRIVATE
        cfd_stats_calculator.cpp
        cfd_verifier.cpp
)