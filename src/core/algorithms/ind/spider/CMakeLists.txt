add_library(ind.spider)
add_library(ind::spider ALIAS ind.spider)

add_headers(ind.spider PUBLIC spider.h)
add_headers(ind.spider PRIVATE attribute.h)
target_sources(ind.spider PRIVATE spider.cpp attribute.cpp)
