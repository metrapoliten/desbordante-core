add_library(fd.pyrocommon)
add_library(fd::pyrocommon ALIAS fd.pyrocommon)

add_headers(fd.pyrocommon
        PRIVATE
        core/dependency_candidate.h
        core/dependency_consumer.h
        core/fd_g1_strategy.h
        core/key_g1_strategy.h
        core/vertical_info.h

        model/list_agree_set_sample.h
)
add_headers(fd.pyrocommon
    PRIVATE
        core/dependency_strategy.h
        core/parameters.h
        core/profiling_context.h
        core/search_space.h

        model/agree_set_sample.h
        model/agree_set_sample_impl.h
        model/confidence_interval.h
        model/partial_fd.h
        model/partial_key.h
        model/pli_cache.h
)
target_sources(fd.pyrocommon
    PRIVATE
        core/dependency_candidate.cpp
        core/dependency_consumer.cpp
        core/dependency_strategy.cpp
        core/fd_g1_strategy.cpp
        core/key_g1_strategy.cpp
        core/profiling_context.cpp
        core/search_space.cpp

        model/agree_set_sample.cpp
        model/confidence_interval.cpp
        model/pli_cache.cpp
        model/list_agree_set_sample.cpp
)
target_link_libraries(fd.pyrocommon PRIVATE spdlog::spdlog_header_only model.table)
