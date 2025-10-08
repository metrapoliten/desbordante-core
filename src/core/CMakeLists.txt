# ---- Core Library Configuration ----

# Define the library name
set(LIB_NAME ${CMAKE_PROJECT_NAME})

add_subdirectory(algorithms)

# Collect all source files recursively (headers and implementations)
file(GLOB_RECURSE lib_sources "${CMAKE_CURRENT_LIST_DIR}/config/*.h" "${CMAKE_CURRENT_LIST_DIR}/config/*.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/model/*.h" "${CMAKE_CURRENT_LIST_DIR}/model/*.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/parser/*.h" "${CMAKE_CURRENT_LIST_DIR}/parser/*.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/util/*.h" "${CMAKE_CURRENT_LIST_DIR}/util/*.cpp")

# Configure threading support with pthread preference
# Required for Boost.Thread and other thread-dependent components
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

# Build core project as a static library
add_library(${LIB_NAME} STATIC ${lib_sources})
target_link_libraries(${LIB_NAME} PUBLIC algos)

# Link essential dependencies
# PRIVATE: Boost and threading internals (implementation details)
# PUBLIC: easyloggingpp affects public interface (logging in headers)
target_link_libraries(
    ${LIB_NAME}
    PRIVATE ${Boost_LIBRARIES} # Boost components specified in find_package
            Threads::Threads # System threading library
    PUBLIC easyloggingpp # Logging infrastructure exposed in headers
)

# ---- Vertical Hashing Optimization ----

# Performance/functionality trade-off:
# - Disabled by default for maximum performance
# - Enabled for wide datasets (>32 columns) with potential performance penalty
option(SAFE_VERTICAL_HASHING
       "Enable safe vertical hashing mode. Allows processing wide datasets (>32 columns) \
    at the cost of reduced performance. Recommended for exploratory data analysis." OFF
)

# Propagate the setting to all consumers of the library
if(SAFE_VERTICAL_HASHING)
    target_compile_definitions(
        ${LIB_NAME} PUBLIC SAFE_VERTICAL_HASHING # Affects compilation of dependent code
    )
endif()
