# --- TaneCommon ---
set(name common)
Desbordante_AddLibrary(${name}
    PREFIX fd.tane
    SRCS model/lattice_level.cpp model/lattice_vertex.cpp tane_common.cpp
    LIBS spdlog::spdlog_header_only ${Desb}.fd.pli
)
add_headers(${name}
    PRIVATE
        tane_common.h
        model/lattice_level.h
        model/lattice_vertex.h
)

# --- Tane ---
set(name tane)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd
    SRCS afd_measures.cpp tane.cpp
    LIBS ${Desb}.fd.tane.common ${Desb}.fd.pli
)
add_headers(${name} PRIVATE afd_measures.h tane.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")

# --- PFDTane ---
set(name pfd)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX fd.tane
    SRCS pfdtane.cpp
    LIBS ${Desb}.fd.tane.common ${Desb}.fd.pli
)
add_headers(${name} PRIVATE pfdtane.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")