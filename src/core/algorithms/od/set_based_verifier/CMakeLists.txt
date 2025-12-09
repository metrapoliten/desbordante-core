set(name set_based_aod_verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX od
    SRCS verifier.cpp
    LIBS spdlog::spdlog_header_only
)
add_headers(${name} PRIVATE verifier.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
