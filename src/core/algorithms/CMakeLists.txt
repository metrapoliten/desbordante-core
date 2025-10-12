add_library(algos STATIC)

target_sources(algos
        PUBLIC
        FILE_SET HEADERS
        PUBLIC algo_factory.cpp algorithm.cpp)

add_subdirectory(algebraic_constraints)
add_subdirectory(association_rules)
add_subdirectory(cfd)
add_subdirectory(dc)
add_subdirectory(dd)
add_subdirectory(fd)
add_subdirectory(gfd)
add_subdirectory(ind)
add_subdirectory(md)
add_subdirectory(metric)
add_subdirectory(nar)
add_subdirectory(nd)
add_subdirectory(od)
add_subdirectory(statistics)
add_subdirectory(ucc)

target_link_libraries(algos PUBLIC AC AR CFD DC DD FD GFD IND MD METRIC NAR ND OD pipelines stat ucc)