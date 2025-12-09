set(name common)
Desbordante_AddLibrary(${name}
    PREFIX testlib
    SRCS all_csv_configs.cpp
)
add_headers(${name} PRIVATE all_csv_configs.h csv_config_util.h)