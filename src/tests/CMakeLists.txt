# ---- Test Suite Configuration ----

# ---- Test Sources Setup ----
add_library(Desbordante.test.common)
add_headers(Desbordante.test.common PRIVATE common/all_csv_configs.h)
target_sources(Desbordante.test.common PRIVATE common/all_csv_configs.cpp)

if (COMPILE_TESTS)
	enable_testing()
	# Load CMake's built-in GoogleTest module
    include(GoogleTest)
	add_subdirectory(unit)

#	# Create test executable
#    add_executable(${UNIT_TEST_BINARY} ${common_sources} ${unit_test_sources})
#
#	# ---- Test Dependencies ----
#
#    target_include_directories(${UNIT_TEST_BINARY} PRIVATE "common")
#
#	# Link test executable with:
#	# PRIVATE:
#	# - Core library (implementation under test)
#	# - GTest/GMock frameworks
#	# - Boost.Graph (test-specific dependencies)
#    target_link_libraries(${UNIT_TEST_BINARY} PRIVATE ${CMAKE_PROJECT_NAME} gtest gmock Boost::graph)
#
#	# ---- Test Discovery ----
#
#	# Auto-register tests from executable
#	# WORKING_DIRECTORY: Ensure test data paths resolve correctly
#    gtest_discover_tests(${UNIT_TEST_BINARY} WORKING_DIRECTORY "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
endif()

if (COMPILE_BENCHMARKS)
	# Create benchmark executable
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
