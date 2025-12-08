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
set(name fd)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS fd.cpp fd_algorithm.cpp
    LIBS model.table ${Desb_PREFIX}.algos
)
add_headers(${name} PRIVATE fd.h fd_algorithm.h raw_fd.h)

# --- PliBasedFD ---
set(name pli)
Desbordante_AddLibrary(${name}
    PREFIX fd
    SRCS pli_based_fd_algorithm.cpp
    LIBS ${Desb_PREFIX}::fd
)
add_headers(${name} PRIVATE pli_based_fd_algorithm.h)
