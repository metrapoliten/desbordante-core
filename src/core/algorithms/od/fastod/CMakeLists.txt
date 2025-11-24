add_library(od.fastod)
add_library(od::fastod ALIAS od.fastod)

add_headers(od.fastod
    PRIVATE
        fastod.h
        od_ordering.h
        hashing/hashing.h

        model/attribute_pair.h
        model/attribute_set.h
        model/canonical_od.h
        model/removal_set.h

        partitions/complex_stripped_partition.h
        partitions/range_based_stripped_partition.h
        partitions/stripped_partition.h

        storage/cache_with_limit.h
        storage/data_frame.h
        storage/partition_cache.h

        util/timer.h
        util/type_util.h
)

target_sources(od.fastod
    PRIVATE
        fastod.cpp
        model/attribute_pair.cpp
        model/attribute_set.cpp
        model/canonical_od.cpp

        partitions/complex_stripped_partition.cpp
        partitions/range_based_stripped_partition.cpp
        partitions/stripped_partition.cpp

        storage/data_frame.cpp

        util/timer.cpp
        util/type_util.cpp
)
