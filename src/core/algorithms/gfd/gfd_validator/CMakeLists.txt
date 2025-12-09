#todo: egfd_validator/gfd_validator/naive
set(name validator)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX gfd
    SRCS balancer.cpp egfd_validator.cpp gfd_handler.cpp gfd_validator.cpp naivegfd_validator.cpp
    LIBS ${Desb}.parser.graph spdlog::spdlog_header_only ${Desb}.gfd ${Desb}.algos
)
add_headers(${name} PRIVATE balancer.h egfd_validator.h gfd_handler.h gfd_validator.h naivegfd_validator.h verification_algorithms.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
