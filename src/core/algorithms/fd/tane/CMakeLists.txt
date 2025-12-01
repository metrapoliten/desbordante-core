#TODO: enums.h?
# --- TaneCommon ---
add_library(fd.tane.common)
add_library(fd::tane::common ALIAS fd.tane.common)
target_link_libraries(fd.tane.common PRIVATE spdlog_helper)

add_headers(fd.tane.common PUBLIC tane_common.h)
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
add_library(fd.tane.tane)
add_library(fd::tane::tane ALIAS fd.tane.tane)

add_headers(fd.tane.tane
    PUBLIC
        afd_measures.h
        tane.h
)
target_sources(fd.tane.tane
    PRIVATE
        afd_measures.cpp
        tane.cpp
)

# --- PFDTane ---
add_library(fd.tane.pfd)
add_library(fd::tane::pfd ALIAS fd.tane.pfd)

add_headers(fd.tane.pfd PUBLIC pfdtane.h)
target_sources(fd.tane.pfd PRIVATE pfdtane.cpp)

# --- Linking ---
target_link_with_given(fd::tane::common PRIVATE fd.tane.tane fd.tane.pfd)