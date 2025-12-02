add_library(fd.hycommon)
add_library(fd::hycommon ALIAS fd.hycommon)

add_headers(fd.hycommon PUBLIC
        column_combination_list.h
        preprocessor.h
        sampler.h
        types.h
        util/pli_util.h
        validator_helpers.h
)
add_headers(fd.hycommon PRIVATE all_column_combinations.h efficiency.h efficiency_threshold.h)
add_headers(fd.hycommon INTERFACE primitive_validations.h)
target_sources(fd.hycommon PRIVATE all_column_combinations.cpp preprocessor.cpp sampler.cpp validator_helpers.cpp)
target_link_libraries(fd.hycommon PRIVATE Boost::thread fd.hy.model)
