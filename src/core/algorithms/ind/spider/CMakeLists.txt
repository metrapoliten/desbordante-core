set(name spider)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    PREFIX ind
    SRCS spider.cpp attribute.cpp
)
add_headers(Desbordante.ind.spider PRIVATE spider.h attribute.h)
