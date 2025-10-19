add_library(common)

add_library(create INTERFACE)

target_sources(create
    PRIVATE
        FILE_SET HEADERS
        FILES
            algorithms.h
            algorithm_types.h
            create_algorithm.h
)

target_sources(common
        PUBLIC
            FILE_SET HEADERS
            FILES
                algorithm.h
                algo_factory.h
        PRIVATE
            algo_factory.cpp
            algorithm.cpp
)

target_link_libraries(common PRIVATE create)