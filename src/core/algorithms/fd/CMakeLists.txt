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
)

foreach(DIR IN LISTS FD_SUBDIRS)
    add_subdirectory(${DIR})
endforeach()

