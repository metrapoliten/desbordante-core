add_subdirectory(faida)
add_subdirectory(ind_verifier)
add_subdirectory(mind)
add_subdirectory(spider)

add_library(Desbordante.ind.ind)
add_library(Desbordante::ind ALIAS Desbordante.ind.ind)

add_headers(Desbordante.ind.ind
    PRIVATE
        ind.h
        ind_algorithm.h
)
target_sources(Desbordante.ind.ind
    PRIVATE
        ind.cpp
        ind_algorithm.cpp
)

#target_link_with_given(ind::ind PRIVATE ind.faida ind.spider)
target_link_libraries(ind.faida PRIVATE Desbordante::ind)
target_link_libraries(Desbordante.ind.ind PRIVATE model.table)
