# ---- Core Library Configuration ----

# Define the library name
#set(LIB_NAME ${CMAKE_PROJECT_NAME})

# Collect all source files recursively (headers and implementations)
file(GLOB_RECURSE model_srcs "${CMAKE_CURRENT_LIST_DIR}/model/*.h" "${CMAKE_CURRENT_LIST_DIR}/model/*.cpp")
file(GLOB_RECURSE util_srcs "${CMAKE_CURRENT_LIST_DIR}/util/*.h" "${CMAKE_CURRENT_LIST_DIR}/util/*.cpp")

add_library(model ${model_srcs})
add_library(util ${util_srcs})

add_subdirectory(config)
add_subdirectory(algorithms)
add_subdirectory(parser/csv_parser)

# Configure threading support with pthread preference
# Required for Boost.Thread and other thread-dependent components
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

add_library(spdlog_helper INTERFACE)
target_link_libraries(spdlog_helper INTERFACE spdlog::spdlog_header_only)
target_compile_definitions(spdlog_header_only INTERFACE
        $<$<CONFIG:Debug>:SPDLOG_ACTIVE_LEVEL=SPDLOG_LEVEL_TRACE>
        $<$<CONFIG:Release>:SPDLOG_ACTIVE_LEVEL=SPDLOG_LEVEL_INFO>
)

# Build core project as a static library
#add_library(${LIB_NAME} STATIC ${lib_sources} ${model_srcs} ${parser})
target_link_libraries(model PUBLIC util PRIVATE spdlog_helper)
target_link_libraries(util PRIVATE spdlog_helper)
target_link_libraries(algos PUBLIC config model parser::csv spdlog_helper)
#target_link_libraries(${LIB_NAME} PUBLIC config)
#target_link_libraries(${LIB_NAME} PUBLIC algos)

# Link essential dependencies
# PRIVATE: Boost and threading internals (implementation details)
# PUBLIC: spdlog affects public interface (logging in headers)
#target_link_libraries(
#    ${LIB_NAME}
#    PRIVATE ${Boost_LIBRARIES} # Boost components specified in find_package
#            Threads::Threads # System threading library
#    PUBLIC spdlog::spdlog_header_only # Logging infrastructure exposed in headers
#)

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
