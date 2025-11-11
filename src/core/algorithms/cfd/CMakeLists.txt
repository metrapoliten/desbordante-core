add_subdirectory(model)
add_subdirectory(util)

target_link_libraries(util PRIVATE model)

add_subdirectory(cfd_verifier)

add_library(cfd)

target_sources(cfd
        PUBLIC
            FILE_SET HEADERS
            FILES
                mining_algorithms.h
#        PRIVATE
#            FILE_SET privateHeaders
#            BASE_DIRS
#                model
#                util
#
#            TYPE HEADERS
        PRIVATE
#            model/cfd_relation_data.cpp
#            model/partition_tidlist.cpp
#            model/raw_cfd.cpp
#
#            cfd_verifier/cfd_stats_calculator.cpp
#            cfd_verifier/cfd_verifier.cpp
#
#            util/cfd_output_util.cpp
#            util/partition_tidlist_util.cpp
#            util/partition_util.cpp
#            util/set_util.cpp
#            util/tidlist_util.cpp
            cfd_discovery.cpp
            fd_first_algorithm.cpp
)

target_link_libraries(cfd PRIVATE util)
target_link_libraries(cfd PRIVATE model)
target_link_libraries(cfd_verifier PRIVATE util)
target_link_libraries(cfd_verifier PRIVATE util)