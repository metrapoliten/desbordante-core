add_library(cfd.verifier)
add_library(cfd::verifier ALIAS cfd.verifier)
target_sources(cfd.verifier
    PRIVATE
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
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