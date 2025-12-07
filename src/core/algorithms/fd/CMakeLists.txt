set(FD_SUBDIRS
    aidfd
    depminer
    dfd
    eulerfd
    fastfds
    fd_mine
    fd_verifier
    fdep
    fun
    hycommon
    hyfd
    pfd_verifier
    pyro
    pyrocommon
    sfd
    tane
)

foreach(DIR IN LISTS FD_SUBDIRS)
    add_subdirectory(${DIR})
endforeach()

# --- FD ---
add_library(Desbordante.fd.fd)
add_library(Desbordante::fd ALIAS Desbordante.fd.fd)

add_headers(Desbordante.fd.fd
        PRIVATE
        fd.h
        fd_algorithm.h
        raw_fd.h
)
target_sources(Desbordante.fd.fd
    PRIVATE
        fd.cpp
        fd_algorithm.cpp
)

# --- PliBasedFD ---
add_library(fd.pli)
add_library(fd::pli ALIAS fd.pli)

add_headers(fd.pli
        PRIVATE
        pli_based_fd_algorithm.h
)
target_sources(fd.pli
    PRIVATE
        pli_based_fd_algorithm.cpp
)

# --- Linking ---
target_link_libraries(fd.pli PRIVATE Desbordante::fd)
target_link_libraries(Desbordante.fd.fd PRIVATE model.table)

#TODO: pli -> common -> pfd/tane
target_link_with_given(fd::pli PRIVATE fd.dfd fd.tane.tane fd.tane.pfd fd.tane.common fd.fastfds fd.mine fd.pyro fd.depminer fd.hy fd.fun)
target_link_with_given(Desbordante::fd PRIVATE fd.fdep fd.euler fd.aid fd.sfd.cords fd.pli)
