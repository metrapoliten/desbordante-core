set(name spider)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ind
    SRCS spider.cpp attribute.cpp
)
add_headers(${name} PRIVATE spider.h attribute.h)
target_include_directories(${name} SYSTEM PRIVATE "${better-enums_SOURCE_DIR}")
