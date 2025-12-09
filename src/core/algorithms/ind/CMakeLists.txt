add_subdirectory(faida)
add_subdirectory(ind_verifier)
add_subdirectory(mind)
add_subdirectory(spider)

set(name ind)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS ind.cpp ind_algorithm.cpp
    LIBS ${Desb}.model.table ${Desb}.algos
)
add_headers(${name} PRIVATE ind.h ind_algorithm.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
