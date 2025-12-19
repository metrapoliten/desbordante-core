# ---- Test Suite Configuration ----

# ---- Test Sources Setup ----
add_subdirectory(common)

if(DESBORDANTE_BUILD_TESTS)
    add_subdirectory(unit)
endif()
if(DESBORDANTE_BUILD_BENCHMARKS)
    add_subdirectory(benchmark)
endif()

# ---- Build Cleanup Configuration ----

# Register test data directory for automatic removal during cleanup
# Ensures test artifacts are deleted with `cmake --build . --target clean`
set_property(
    DIRECTORY
    APPEND
    PROPERTY ADDITIONAL_CLEAN_FILES "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/input_data"
)
