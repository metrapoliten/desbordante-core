set(name spider)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ind
    SRCS spider.cpp attribute.cpp
    LIBS better-enums
)
add_headers(${name} PRIVATE spider.h attribute.h)
