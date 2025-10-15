add_library(CFD STATIC)

target_sources(CFD
#        INTERFACE
#            FILE_SET interfaceHeaders
#            TYPE HEADERS
#            FILES
        PUBLIC
            FILE_SET HEADERS
            FILES model/cfd_relation_data.h
        PRIVATE
            FILE_SET privateHeaders
            TYPE HEADERS
#            BASE_DIRS ${CMAKE_CURRENT_LIST_DIR}
#            FILES
#                model/cfd_column_data.h
#                model/cfd_types.h
#                model/partition_tidlist.h
#                model/raw_cfd.h
#        PRIVATE
#            FILE_SET privateHeaders
#            TYPE HEADERS
#            BASE_DIRS ${CMAKE_CURRENT_LIST_DIR}
#            FILES
#                model/cfd_relation_data.h
#                cfd_verifier/cfd_stats_calculator.h
#                cfd_verifier/cfd_verifier.h
#                util/cfd_output_util.h
#                util/partition_tidlist_util.h
#                util/partition_util.cpp
#                util/prefix_tree.h
#                util/set_util.h
#                util/tidlist_util.h

        PRIVATE
            model/cfd_relation_data.cpp
            model/partition_tidlist.cpp
            model/raw_cfd.cpp

            cfd_verifier/cfd_stats_calculator.cpp
            cfd_verifier/cfd_verifier.cpp

            util/cfd_output_util.cpp
            util/partition_tidlist_util.cpp
            util/partition_util.cpp
            util/set_util.cpp
            util/tidlist_util.cpp

            cfd_discovery.cpp
            fd_first_algorithm.cpp
)

#target_include_directories(CFD
#        PUBLIC
#        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
#        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/model>"
#)