add_subdirectory(des)

set(name nar)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS nar.cpp nar_algorithm.cpp value_range.cpp
    LIBS ${Desb}.model.table
)
add_headers(${name} PRIVATE nar_algorithm.h value_range.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
