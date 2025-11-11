add_library(cfd_verifier)

target_sources(cfd_verifier
    PUBLIC
        FILE_SET HEADERS
        FILES
        cfd_verifier.h
    PRIVATE
        cfd_stats_calculator.cpp
        cfd_verifier.cpp
)