add_subdirectory(model EXCLUDE_FROM_ALL)
add_subdirectory(util EXCLUDE_FROM_ALL)

add_subdirectory(cfd_verifier)

add_library(cfd)

target_sources(cfd
        PUBLIC
            FILE_SET HEADERS
            FILES
                mining_algorithms.h
        PRIVATE
            cfd_discovery.cpp
            fd_first_algorithm.cpp
)

target_link_libraries(cfd
        PUBLIC model
        PRIVATE util
)
target_link_libraries(cfd_verifier PRIVATE model util)