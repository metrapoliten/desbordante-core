set(name cfd.verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS cfd_stats_calculator.cpp cfd_verifier.cpp
    LIBS ${Desb}.cfd.model ${Desb}.algos spdlog::spdlog_header_only
)
add_headers(${name}
    PRIVATE
        cfd_verifier.h
        highlight.h
        cfd_stats_calculator.h
)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
