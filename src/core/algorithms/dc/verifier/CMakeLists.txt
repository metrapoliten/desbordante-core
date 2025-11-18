add_library(dc.verifier)
target_sources(dc.verifier
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${PROJECT_SOURCE_DIR}/src/core
    PRIVATE
        dc_verifier.cpp
)