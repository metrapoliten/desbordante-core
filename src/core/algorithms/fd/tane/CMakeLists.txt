#TODO: enums.h?
# --- TaneCommon ---
add_library(fd.tane.common)
add_library(fd::tane::common ALIAS fd.tane.common)
target_link_libraries(fd.tane.common PRIVATE spdlog::spdlog_header_only)

add_headers(fd.tane.common PRIVATE tane_common.h)
add_headers(fd.tane.common
    PRIVATE
        model/lattice_level.h
        model/lattice_vertex.h
)
target_sources(fd.tane.common
    PRIVATE
        model/lattice_level.cpp
        model/lattice_vertex.cpp
        tane_common.cpp
)

# --- Tane ---
add_library(Desbordante.fd.tane.tane)
add_library(Desbordante::fd::tane ALIAS Desbordante.fd.tane.tane)

add_headers(Desbordante.fd.tane.tane
        PRIVATE
        afd_measures.h
        tane.h
)
target_sources(Desbordante.fd.tane.tane
    PRIVATE
        afd_measures.cpp
        tane.cpp
)

# --- PFDTane ---
add_library(Desbordante.fd.tane.pfd)
add_library(Desbordante::fd::tane::pfd ALIAS Desbordante.fd.tane.pfd)

add_headers(Desbordante.fd.tane.pfd PRIVATE pfdtane.h)
target_sources(Desbordante.fd.tane.pfd PRIVATE pfdtane.cpp)

# --- Linking ---
target_link_with_given(fd::tane::common PRIVATE Desbordante.fd.tane.tane Desbordante.fd.tane.pfd)