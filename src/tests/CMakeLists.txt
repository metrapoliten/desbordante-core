# ---- Test Suite Configuration ----

# ---- Test Sources Setup ----
add_library(${Desb}.test.common)
add_headers(${Desb}.test.common PRIVATE common/all_csv_configs.h)
target_sources(${Desb}.test.common PRIVATE common/all_csv_configs.cpp)

if (COMPILE_TESTS)
	enable_testing()
	# Load CMake's built-in GoogleTest module
    include(GoogleTest)
	add_subdirectory(unit)
endif()

if (COMPILE_BENCHMARKS)

	add_subdirectory(benchmark)
#	add_executable(${BENCHMARK_BINARY} ${common_sources} ${benchmark_sources})

	# ---- Benchmark Dependencies ----

#    target_include_directories(${BENCHMARK_BINARY} PRIVATE "common")

	# Link benchmark executable with:
	# PRIVATE:
	# - Core library (implementation under benchmark)
#    target_link_libraries(${BENCHMARK_BINARY} PRIVATE ${CMAKE_PROJECT_NAME})
endif()

# ---- Test Data Preparation ----

# Copy test datasets to build output directory before any build target
# ALL ensures this runs by default for all build operations
add_custom_target(
	copy-files ALL
	COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_SOURCE_DIR}/test_input_data
			${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/input_data
	COMMENT "Copying test datasets to build directory"
)

# ---- Build Cleanup Configuration ----

# Register test data directory for automatic removal during cleanup
# Ensures test artifacts are deleted with `cmake --build . --target clean`
set_property(
	DIRECTORY
	APPEND
	PROPERTY ADDITIONAL_CLEAN_FILES "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/input_data"
)
