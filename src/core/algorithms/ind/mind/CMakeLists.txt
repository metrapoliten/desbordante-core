add_library(ind.mind)
add_library(ind::mind ALIAS ind.mind)

add_headers(ind.mind PUBLIC mind.h)
add_headers(ind.mind PRIVATE raw_ind.h)
target_sources(ind.mind PRIVATE mind.cpp)

#target_link_libraries(ind.mind PRIVATE ${Boost_LIBRARIES})
