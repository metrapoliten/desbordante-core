add_library(AC)

target_sources(AC
    PRIVATE
        ac_algorithm.cpp
        ac_exception_finder.cpp
    PRIVATE
        FILE_SET HEADERS
#        BASE_DIRS
#            ${CMAKE_CURRENT_LIST_DIR}
#        FILES
#            ac.h
#            ac_algorithm.h
#            ac_exception.h
#            ac_exception_finder.h
#            ac_pairs_collection.h
#            bin_operation_enum.h
#            mining_algorithms.h
#            ranges_collection.h
#            typed_column_pair.h
)
