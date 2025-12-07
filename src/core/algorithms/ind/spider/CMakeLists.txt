add_library(Desbordante.ind.spider)
add_library(Desbordante::ind::spider ALIAS Desbordante.ind.spider)

add_headers(Desbordante.ind.spider PRIVATE spider.h)
add_headers(Desbordante.ind.spider PRIVATE attribute.h)
target_sources(Desbordante.ind.spider PRIVATE spider.cpp attribute.cpp)
