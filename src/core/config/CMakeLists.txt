add_library(config STATIC)

target_sources(config
        PUBLIC
        FILE_SET HEADERS
        PUBLIC
        custom_random_seed/option.cpp

        equal_nulls/option.cpp

        error/option.cpp

        error_measure/option.cpp

        indices/option.cpp
        indices/validate_index.cpp

        max_arity/option.cpp

        max_lhs/option.cpp

        mem_limit/option.cpp

        tabular_data/crud_operations/delete/option.cpp
        tabular_data/crud_operations/insert/option.cpp
        tabular_data/crud_operations/update/option.cpp

        tabular_data/input_table/option.cpp

        thread_number/option.cpp

        time_limit/option.cpp)

