set(NAME CFD)

add_library(${NAME} STATIC)

target_sources(${NAME}
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        cfd_verifier/cfd_stats_calculator.cpp
        cfd_verifier/cfd_verifier.cpp
        model/cfd_relation_data.cpp
        model/partition_tidlist.cpp
        model/raw_cfd.cpp
        util/cfd_output_util.cpp
        util/partition_tidlist_util.cpp
        util/partition_util.cpp
        util/set_util.cpp
        util/tidlist_util.cpp
        cfd_discovery.cpp
        fd_first_algorithm.cpp
)