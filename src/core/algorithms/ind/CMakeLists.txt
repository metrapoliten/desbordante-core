add_subdirectory(faida)
add_subdirectory(ind_verifier)
add_subdirectory(mind)
add_subdirectory(spider)

add_library(ind.ind)
add_library(ind::ind ALIAS ind.ind)

add_headers(ind.ind
    PRIVATE
        ind.h
        ind_algorithm.h
)
target_sources(ind.ind
    PRIVATE
        ind.cpp
        ind_algorithm.cpp
)

#target_link_with_given(ind::ind PRIVATE ind.faida ind.spider)
target_link_libraries(ind.faida PRIVATE ind::ind)
target_link_libraries(ind.ind PRIVATE model.table)
