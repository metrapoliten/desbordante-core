set(name hy.common)
Desbordante_AddLibrary(${name}
    PREFIX fd
    SRCS all_column_combinations.cpp preprocessor.cpp sampler.cpp validator_helpers.cpp
    LIBS Boost::thread Desbordante.fd.hy.model
)
add_headers(${name} PRIVATE
        column_combination_list.h
        preprocessor.h
        sampler.h
        types.h
        util/pli_util.h
        validator_helpers.h
        all_column_combinations.h efficiency.h efficiency_threshold.h
)
add_headers(${name} INTERFACE primitive_validations.h)
