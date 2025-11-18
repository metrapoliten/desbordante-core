add_library(dc_verifier)
target_sources(dc_verifier
    PUBLIC
        FILE_SET HEADERS
    PRIVATE
        dc_verifier.cpp
)