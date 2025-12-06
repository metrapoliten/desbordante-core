cmake_minimum_required(VERSION 3.25)

project(
    Desbordante.bindings
    LANGUAGES CXX
    VERSION 0.0.0
    DESCRIPTION "Python bindings to the interface of the Desbordante C++ core library"
)

if(PYTHON)
    CPMAddPackage("gh:pybind/pybind11@2.13.4")
endif()
set(BINDINGS_NAME desbordante)
add_library(${BINDINGS_NAME} MODULE bind_main_classes.cpp bind_main_classes.h bindings.cpp)
# ---- Python Bindings Configuration ----
#todo: move to 1 func
function(add_bindings_with_libraries NAME FILES)
    set(BIND_NAME Desbordante.bind.${NAME})
    add_library(${BIND_NAME} ${FILES}) #target_sources?
    target_link_libraries(${BIND_NAME} PRIVATE pybind11::pybind11)
    target_link_libraries(${BINDINGS_NAME} PRIVATE ${BIND_NAME})
#    target_link_libraries(${BIND_NAME} PRIVATE ${LIBS})
    #todo: delete when includes
    target_include_directories(${BIND_NAME} PRIVATE ".")
endfunction()

add_bindings_with_libraries(ac "ac/bind_ac.h;ac/bind_ac.cpp")

add_bindings_with_libraries(ar "ar/bind_ar.h;ar/bind_ar.cpp")

add_bindings_with_libraries(cfd "cfd/bind_cfd.h;cfd/bind_cfd_verification.h;cfd/bind_cfd_verification.cpp")

add_bindings_with_libraries(data "data/bind_data_types.h;data/bind_data_types.cpp")

add_bindings_with_libraries(dc "dc/bind_dc_verification.h;dc/bind_fastadc.h;dc/bind_dc_verification.cpp;dc/bind_fastadc.cpp")

add_bindings_with_libraries(dd "dd/bind_dd_verification.h;dd/bind_split.h;dd/bind_dd_verification.cpp;dd/bind_split.cpp")

add_bindings_with_libraries(dynamic "dynamic/bind_dynamic_fd_verification.h;dynamic/bind_dynamic_fd_verification.cpp")

add_bindings_with_libraries(fd "fd/bind_fd.h;fd/bind_fd_verification.h;fd/bind_fd.cpp;fd/bind_fd_verification.cpp")

add_bindings_with_libraries(gfd "gfd/bind_gfd.h;gfd/bind_gfd_verification.h;gfd/bind_gfd.cpp;gfd/bind_gfd_verification.cpp")

add_bindings_with_libraries(ind "ind/bind_ind.h;ind/bind_ind_verification.h;ind/bind_ind.cpp;ind/bind_ind_verification.cpp")

add_bindings_with_libraries(md "md/bind_md.h;md/bind_md_verification.h;md/object_similarity_measure.h;md/bind_md.cpp;md/bind_md_verification.cpp")

add_bindings_with_libraries(mfd "mfd/bind_mfd_verification.h;mfd/bind_mfd_verification.cpp")

add_bindings_with_libraries(nar "nar/bind_nar.cpp;nar/bind_nar.h")

add_bindings_with_libraries(nd "nd/bind_nd.h;nd/bind_nd_verification.h;nd/bind_nd.cpp;nd/bind_nd_verification.cpp")

add_bindings_with_libraries(od "od/bind_od.h;od/bind_od_verification.h;od/bind_od.cpp;od/bind_od_verification.cpp")

add_bindings_with_libraries(pfd "pfd/bind_pfd_verification.h;pfd/bind_pfd_verification.cpp")

add_bindings_with_libraries(util
        "py_util/bind_primitive.h;py_util/create_dataframe_reader.cpp;py_util/create_dataframe_reader.h;py_util/dataframe_reader.cpp;py_util/dataframe_reader.h;py_util/get_py_type.cpp;py_util/logging.cpp;py_util/opt_to_py.cpp;py_util/py_to_any.cpp;py_util/table_serialization.cpp;py_util/table_serialization.h;py_util/logging.h;py_util/get_py_type.h;py_util/opt_to_py.h;py_util/py_to_any.h")

add_bindings_with_libraries(sfd "sfd/bind_sfd.h;sfd/bind_sfd.cpp")
add_bindings_with_libraries(statistics "statistics/bind_statistics.h;statistics/bind_statistics.cpp")
add_bindings_with_libraries(ucc "ucc/bind_ucc.h;ucc/bind_ucc_verification.h;ucc/bind_ucc.cpp;ucc/bind_ucc_verification.cpp")

# Define the output name for Python bindings module
# NOTE: Matches the Python import name (e.g. 'import desbordante')

target_link_libraries(${BINDINGS_NAME} PRIVATE pybind11::module)
pybind11_extension(${BINDINGS_NAME})
if(NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
    # Strip unnecessary sections of the binary on Linux/macOS
    pybind11_strip(${BINDINGS_NAME})
endif()
set_target_properties(${BINDINGS_NAME} PROPERTIES CXX_VISIBILITY_PRESET "hidden"
        CUDA_VISIBILITY_PRESET "hidden")

# Auto-discover all source files for bindings
#file(GLOB_RECURSE sources "*.h*" "*.cpp*")

# Create Python-native module using pybind11
# Generates SHARED library with Python-compatible ABI
#pybind11_add_module(${BINDINGS_NAME} ${sources})

# Configure output directory to central build folder
# Ensures generated .so/.pyd files are placed alongside other binaries
set_target_properties(
    ${BINDINGS_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY
                                ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} # ${CMAKE_BINARY_DIR}/target
)

# Link against core library containing algorithm implementations
#target_link_libraries(
#    ${BINDINGS_NAME} PRIVATE ${CMAKE_PROJECT_NAME} # Desbordante core static library
#)

# Enable local header inclusion
#include_directories(".")

# ---- Installation Setup ----

if(PYTHON STREQUAL "INSTALL")
    # Install Python bindings module to system
    # Places the compiled library in the root installation directory
    install(TARGETS ${BINDINGS_NAME} LIBRARY DESTINATION .)
endif()
