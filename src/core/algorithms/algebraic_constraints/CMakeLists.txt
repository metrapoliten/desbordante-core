add_library(AC)

target_sources(AC
    PUBLIC
        FILE_SET HEADERS
        FILES
            ac.h
            ac_algorithm.h
    PRIVATE
        FILE_SET privateHeaders
        TYPE HEADERS
        FILES
            ac_exception.h
            ac_exception_finder.h
            ac_pairs_collection.h
            bin_operation_enum.h
            mining_algorithms.h
            ranges_collection.h
            typed_column_pair.h
    PRIVATE
        ac_algorithm.cpp
        ac_exception_finder.cpp
)
