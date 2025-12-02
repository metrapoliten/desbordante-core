add_library(model.transaction)

add_headers(model.transaction
    PRIVATE
        itemset.h
        transactional_data.h
        transactional_input_format.h
)

target_sources(model.transaction
    PRIVATE
        itemset.cpp
        transactional_data.cpp
)