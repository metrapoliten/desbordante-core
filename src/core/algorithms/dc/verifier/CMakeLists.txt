set(name dc.verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS dc_verifier.cpp
    LIBS ${Desb}.model.table ${Desb}.model.types ${Desb}.dc.model ${Desb}.dc.parser spdlog::spdlog_header_only
)
add_headers(${name} PRIVATE dc_verifier.h)
target_include_directories(${name} SYSTEM PRIVATE "${frozen_SOURCE_DIR}/include")
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
