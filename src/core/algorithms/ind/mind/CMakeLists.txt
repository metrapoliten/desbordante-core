add_library(Desbordante.ind.mind)
add_library(Desbordante::ind::mind ALIAS Desbordante.ind.mind)

add_headers(Desbordante.ind.mind PRIVATE mind.h)
add_headers(Desbordante.ind.mind PRIVATE raw_ind.h)
target_sources(Desbordante.ind.mind PRIVATE mind.cpp)

#target_link_libraries(ind.mind PRIVATE ${Boost_LIBRARIES})
