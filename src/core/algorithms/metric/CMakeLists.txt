add_library(metric)
#todo: metric verifier
add_headers(metric
    PRIVATE
        aliases.h
        enums.h
        highlight.h
        highlight_calculator.h
        metric_verifier.h
        points.h
        points_calculator.h
)
target_sources(metric
    PRIVATE
        highlight_calculator.cpp
        metric_verifier.cpp
        points_calculator.cpp
)

target_link_libraries(metric PRIVATE model.table)