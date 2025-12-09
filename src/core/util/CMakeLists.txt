set(name util)
Desbordante_AddLibrary(${name}
    SRCS convex_hull.cpp create_dd.cpp levenshtein_distance.cpp progress.cpp qgram_vector.cpp worker_thread_pool.cpp
    LIBS spdlog::spdlog_header_only better-enums
)
add_headers(${name}
    PRIVATE
        argument_type.h
        auto_join_thread.h
        barrier.h
        bitset_utils.h
        cache_eviction_method.h
        caching_method.h
        convex_hull.h
        create_dd.h
        custom_hashes.h
        custom_random.h
        desbordante_assume.h
        enum_to_available_values.h
        erase_if_replace.h
        get_preallocated_vector.h
        kdtree.h
        levenshtein_distance.h
        logger.h
        maybe_unused_private_field.h
        mem_ptr_deduce.h
        parallel_for.h
        primitive_collection.h
        progress.h
        py_tuple_hash.h
        qgram_vector.h
        range_to_string.h
        timed_invoke.h
        worker_thread_pool.h
)
