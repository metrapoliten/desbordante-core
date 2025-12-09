cmake_minimum_required(VERSION 3.25)

project(
    Desbordante.bindings
    LANGUAGES CXX
    DESCRIPTION "Python bindings to the interface of the Desbordante C++ core library"
)

CPMAddPackage("gh:pybind/pybind11@2.13.4")

# ---- Python Bindings Configuration ----
include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake/helpers.cmake)

# Define the output name for Python bindings module
# NOTE: Matches the Python import name (e.g. 'import desbordante')
set(MODULE_NAME desbordante)

add_library(${MODULE_NAME} MODULE bind_main_classes.cpp bind_main_classes.h bindings.cpp)
target_link_libraries(${MODULE_NAME}
        PRIVATE pybind11::pybind11 Desbordante::algos Desbordante.bind.util better-enums spdlog::spdlog_header_only)

# Uncomment to debug linker issues
# target_link_options(${MODULE_NAME} PRIVATE "-Wl,--no-undefined")
# target_link_libraries(${MODULE_NAME} PRIVATE pybind11::embed)

pybind11_extension(${MODULE_NAME})

if(NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
    # Strip unnecessary sections of the binary on Linux/macOS
    pybind11_strip(${MODULE_NAME})
endif()

set_target_properties(${MODULE_NAME}
    PROPERTIES
        CXX_VISIBILITY_PRESET "hidden"
        # Configure output directory to central build folder
        # Ensures generated .so/.pyd files are placed alongside other binaries
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} # ${CMAKE_BINARY_DIR}/target
)

function(Desbordante_AddBinds name)
    set(multiVals SRCS LIBS)
    cmake_parse_arguments(args "" "" "${multiVals}" ${ARGN})
    list(APPEND args_LIBS pybind11::pybind11)
    Desbordante_AddTarget(${name}
            PREFIX bind
            TYPE LIB
            SRCS ${args_SRCS}
            LIBS ${args_LIBS}
    )
    target_link_libraries(${MODULE_NAME} PRIVATE ${name})
    target_sources(${name} PRIVATE FILE_SET privateHeaders TYPE HEADERS)
endfunction()

Desbordante_AddBinds(ac
    SRCS ac/bind_ac.h ac/bind_ac.cpp
    LIBS Desbordante::ac better-enums
)

Desbordante_AddBinds(ar
    SRCS ar/bind_ar.h ar/bind_ar.cpp
    LIBS Desbordante::ar better-enums
)

Desbordante_AddBinds(cfd
    SRCS cfd/bind_cfd.h cfd/bind_cfd_verification.h cfd/bind_cfd.cpp cfd/bind_cfd_verification.cpp
    LIBS Desbordante::cfd Desbordante::cfd::verifier better-enums
)

Desbordante_AddBinds(data SRCS data/bind_data_types.h data/bind_data_types.cpp)
target_include_directories(Desbordante.bind.data PRIVATE "${PROJECT_SOURCE_DIR}/../src")

Desbordante_AddBinds(dc
    SRCS dc/bind_dc_verification.h dc/bind_fastadc.h dc/bind_dc_verification.cpp dc/bind_fastadc.cpp
    LIBS Desbordante::dc::verifier Desbordante::dc::fastadc frozen better-enums Desbordante.bind.util spdlog::spdlog_header_only
)

Desbordante_AddBinds(dd
    SRCS dd/bind_dd_verification.h dd/bind_split.h dd/bind_dd_verification.cpp dd/bind_split.cpp
    LIBS Desbordante::dd::verifier Desbordante::dd::split better-enums
)

Desbordante_AddBinds(fd.verifier.dynamic
    SRCS dynamic/bind_dynamic_fd_verification.h dynamic/bind_dynamic_fd_verification.cpp
    LIBS Desbordante::fd::verifier::dynamic better-enums spdlog::spdlog_header_only
)

Desbordante_AddBinds(fd
    SRCS fd/bind_fd.h fd/bind_fd_verification.h fd/bind_fd.cpp fd/bind_fd_verification.cpp
    LIBS Desbordante::fd Desbordante::fd::verifier Desbordante::fd::hy Desbordante::fd::aid Desbordante::fd::euler
         Desbordante::fd::depminer Desbordante::fd::dfd Desbordante::fd::fastfds Desbordante::fd::fdep
         Desbordante::fd::mine Desbordante::fd::fun Desbordante::fd::pyro Desbordante::fd::tane
         Desbordante::fd::tane::pfd Desbordante.bind.util better-enums spdlog::spdlog_header_only
)

Desbordante_AddBinds(gfd
    SRCS gfd/bind_gfd.h gfd/bind_gfd_verification.h gfd/bind_gfd.cpp gfd/bind_gfd_verification.cpp
    LIBS Desbordante::gfd::miner Desbordante::gfd::validator better-enums
)

Desbordante_AddBinds(ind
    SRCS ind/bind_ind.h ind/bind_ind_verification.h ind/bind_ind.cpp ind/bind_ind_verification.cpp
    LIBS Desbordante::ind Desbordante::ind::verifier Desbordante::ind::spider Desbordante::ind::faida
         Desbordante::ind::mind
)

Desbordante_AddBinds(md
    SRCS md/bind_md.h md/bind_md_verification.h md/object_similarity_measure.h md/bind_md.cpp md/bind_md_verification.cpp
    LIBS Desbordante::md::verifier Desbordante.bind.util better-enums spdlog::spdlog_header_only
)

Desbordante_AddBinds(mfd
    SRCS mfd/bind_mfd_verification.h mfd/bind_mfd_verification.cpp
    LIBS Desbordante::metric::verifier better-enums
)

Desbordante_AddBinds(nar
    SRCS nar/bind_nar.cpp nar/bind_nar.h
    LIBS Desbordante::nar Desbordante::nar::des better-enums
)

Desbordante_AddBinds(nd
    SRCS nd/bind_nd.h nd/bind_nd_verification.h nd/bind_nd.cpp nd/bind_nd_verification.cpp
    LIBS Desbordante::nd::verifier Desbordante::nd better-enums
)

Desbordante_AddBinds(od
    SRCS od/bind_od.h od/bind_od_verification.h od/bind_od.cpp od/bind_od_verification.cpp
    LIBS Desbordante::od::fast Desbordante::od::order Desbordante::od::set_based_aod_verifier better-enums spdlog::spdlog_header_only
)

Desbordante_AddBinds(pfd
    SRCS pfd/bind_pfd_verification.h pfd/bind_pfd_verification.cpp
    LIBS Desbordante::fd::pfd_verifier better-enums
)
#todo: can't desb_addlib because headers
add_library(Desbordante.bind.util)
target_sources(Desbordante.bind.util
    PRIVATE
        FILE_SET HEADERS
        FILES
            py_util/bind_primitive.h
            py_util/table_serialization.h
            py_util/py_to_any.h
            py_util/opt_to_py.h
            py_util/logging.h
            py_util/get_py_type.h
            py_util/dataframe_reader.h
            py_util/create_dataframe_reader.h
)
target_sources(Desbordante.bind.util
    PRIVATE
        py_util/create_dataframe_reader.cpp
        py_util/dataframe_reader.cpp
        py_util/get_py_type.cpp
        py_util/logging.cpp
        py_util/opt_to_py.cpp
        py_util/py_to_any.cpp
        py_util/table_serialization.cpp
)
target_link_libraries(Desbordante.bind.util PRIVATE pybind11::pybind11 better-enums spdlog::spdlog_header_only)
target_include_directories(Desbordante.bind.util PRIVATE "${PROJECT_SOURCE_DIR}/../src")

Desbordante_AddBinds(sfd
    SRCS sfd/bind_sfd.h sfd/bind_sfd.cpp
    LIBS Desbordante::fd::sfd::cords Desbordante.bind.util better-enums
)

Desbordante_AddBinds(statistics
    SRCS statistics/bind_statistics.h statistics/bind_statistics.cpp
    LIBS Desbordante::datastats better-enums
)

Desbordante_AddBinds(ucc
    SRCS ucc/bind_ucc.h ucc/bind_ucc_verification.h ucc/bind_ucc.cpp ucc/bind_ucc_verification.cpp
    LIBS Desbordante::ucc::hpivalid Desbordante::ucc Desbordante::ucc::hy Desbordante::ucc::pyro Desbordante.bind.util better-enums
)

# ---- Installation Setup ----

if(PYTHON STREQUAL "INSTALL")
    # Install Python bindings module to system
    # Places the compiled library in the root installation directory
    install(TARGETS ${MODULE_NAME} LIBRARY DESTINATION .)
endif()
