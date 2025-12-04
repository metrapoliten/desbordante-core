add_library(metric.verifier)
add_library(metric::verifier ALIAS metric.verifier)
#todo: metric verifier
add_headers(metric.verifier
    PRIVATE
        aliases.h
        enums.h
        highlight.h
        highlight_calculator.h
        metric_verifier.h
        points.h
        points_calculator.h
)
target_sources(metric.verifier
    PRIVATE
        highlight_calculator.cpp
        metric_verifier.cpp
        points_calculator.cpp
)

target_link_libraries(metric.verifier PRIVATE model.table)