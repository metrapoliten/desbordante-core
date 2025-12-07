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
include(../cmake/helpers.cmake)

function(Desbordante_AddBinds NAME)
    set(multiVals BIND_SRCS BIND_LIBS)
    cmake_parse_arguments(args "" "" "${multiVals}" ${ARGN})
    set(NAME Desbordante.bind.${NAME})
    list(APPEND args_BIND_LIBS pybind11::module)
    Desbordante_AddTarget(${NAME}
        TYPE LIB
        SRCS ${args_BIND_SRCS}
        LIBS ${args_BIND_LIBS}
    )
    target_link_libraries(${BINDINGS_NAME} PRIVATE ${NAME})
    #todo: delete when includes
    target_include_directories(${NAME} PRIVATE ".")
endfunction()

Desbordante_AddBinds(ac
        BIND_SRCS ac/bind_ac.h ac/bind_ac.cpp
        BIND_LIBS Desbordante::ac
)

Desbordante_AddBinds(ar
    BIND_SRCS ar/bind_ar.h ar/bind_ar.cpp
    BIND_LIBS Desbordante::ar
)
# undefined symbol: typeinfo for algos::cfd::CFDDiscovery
Desbordante_AddBinds(cfd
    BIND_SRCS cfd/bind_cfd.h cfd/bind_cfd_verification.h cfd/bind_cfd.cpp cfd/bind_cfd_verification.cpp)

Desbordante_AddBinds(data BIND_SRCS data/bind_data_types.h data/bind_data_types.cpp)

Desbordante_AddBinds(dc
    BIND_SRCS dc/bind_dc_verification.h dc/bind_fastadc.h dc/bind_dc_verification.cpp dc/bind_fastadc.cpp)

Desbordante_AddBinds(dd
    BIND_SRCS dd/bind_dd_verification.h dd/bind_split.h dd/bind_dd_verification.cpp dd/bind_split.cpp)

Desbordante_AddBinds(dynamic
    BIND_SRCS dynamic/bind_dynamic_fd_verification.h dynamic/bind_dynamic_fd_verification.cpp
)

Desbordante_AddBinds(fd
    BIND_SRCS fd/bind_fd.h fd/bind_fd_verification.h fd/bind_fd.cpp fd/bind_fd_verification.cpp)

Desbordante_AddBinds(gfd
    BIND_SRCS gfd/bind_gfd.h gfd/bind_gfd_verification.h gfd/bind_gfd.cpp gfd/bind_gfd_verification.cpp)

Desbordante_AddBinds(ind
    BIND_SRCS ind/bind_ind.h ind/bind_ind_verification.h ind/bind_ind.cpp ind/bind_ind_verification.cpp)

Desbordante_AddBinds(md
    BIND_SRCS md/bind_md.h md/bind_md_verification.h md/object_similarity_measure.h md/bind_md.cpp md/bind_md_verification.cpp)

Desbordante_AddBinds(mfd
    BIND_SRCS mfd/bind_mfd_verification.h mfd/bind_mfd_verification.cpp)

Desbordante_AddBinds(nar
    BIND_SRCS nar/bind_nar.cpp nar/bind_nar.h)

Desbordante_AddBinds(nd
    BIND_SRCS nd/bind_nd.h nd/bind_nd_verification.h nd/bind_nd.cpp nd/bind_nd_verification.cpp)

Desbordante_AddBinds(od
    BIND_SRCS od/bind_od.h od/bind_od_verification.h od/bind_od.cpp od/bind_od_verification.cpp)

Desbordante_AddBinds(pfd
    BIND_SRCS pfd/bind_pfd_verification.h pfd/bind_pfd_verification.cpp)

Desbordante_AddBinds(util
    BIND_SRCS
        py_util/create_dataframe_reader.h
        py_util/dataframe_reader.h
        py_util/get_py_type.h
        py_util/logging.h
        py_util/opt_to_py.h
        py_util/py_to_any.h
        py_util/table_serialization.h
        py_util/bind_primitive.h

        py_util/create_dataframe_reader.cpp
        py_util/dataframe_reader.cpp
        py_util/get_py_type.cpp
        py_util/logging.cpp
        py_util/opt_to_py.cpp
        py_util/py_to_any.cpp
        py_util/table_serialization.cpp
)

Desbordante_AddBinds(sfd
    BIND_SRCS sfd/bind_sfd.h sfd/bind_sfd.cpp)
Desbordante_AddBinds(statistics
    BIND_SRCS statistics/bind_statistics.h statistics/bind_statistics.cpp)
Desbordante_AddBinds(ucc
    BIND_SRCS ucc/bind_ucc.h ucc/bind_ucc_verification.h ucc/bind_ucc.cpp ucc/bind_ucc_verification.cpp)

# Define the output name for Python bindings module
# NOTE: Matches the Python import name (e.g. 'import desbordante')
# maybe pybind11::pybind11 enough
target_link_libraries(${BINDINGS_NAME} PRIVATE pybind11::module algos)
pybind11_extension(${BINDINGS_NAME})
if(NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
    # Strip unnecessary sections of the binary on Linux/macOS
    pybind11_strip(${BINDINGS_NAME})
endif()
set_target_properties(${BINDINGS_NAME} PROPERTIES CXX_VISIBILITY_PRESET "hidden")

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
