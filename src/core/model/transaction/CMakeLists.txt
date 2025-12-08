set(name transaction)
Desbordante_AddLibrary(${name}
    PREFIX model
    SRCS itemset.cpp transactional_data.cpp
)
add_headers(model.transaction PRIVATE itemset.h transactional_data.h transactional_input_format.h)