add_library(Desbordante.gfd.validator)
add_library(Desbordante::gfd::validator ALIAS Desbordante.gfd.validator)
#todo: egfd_validator/gfd_validator/naive
add_headers(Desbordante.gfd.validator
    PRIVATE
        balancer.h
        egfd_validator.h
        gfd_handler.h
        gfd_validator.h
        naivegfd_validator.h
        verification_algorithms.h
)
target_sources(Desbordante.gfd.validator
    PRIVATE
        balancer.cpp
        egfd_validator.cpp
        gfd_handler.cpp
        gfd_validator.cpp
        naivegfd_validator.cpp
)

target_link_libraries(Desbordante.gfd.validator PRIVATE parser.graph spdlog::spdlog_header_only)
