cmake_minimum_required(VERSION 3.25)

project(
    Desbordante.bindings
    LANGUAGES CXX
    DESCRIPTION "Python bindings to the interface of the Desbordante C++ core library"
)

CPMAddPackage("gh:pybind/pybind11@2.13.4")

# Define the output name for Python bindings module
# NOTE: Matches the Python import name (e.g. 'import desbordante')
set(BINDINGS_NAME desbordante)
add_library(${BINDINGS_NAME} MODULE bind_main_classes.cpp bind_main_classes.h bindings.cpp)

# ---- Python Bindings Configuration ----
include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake/helpers.cmake)

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
    target_link_libraries(${BINDINGS_NAME} PRIVATE ${name})
    target_include_directories(${name} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
endfunction()

Desbordante_AddBinds(ac
    SRCS ac/bind_ac.h ac/bind_ac.cpp
    LIBS Desbordante::ac
)

Desbordante_AddBinds(ar
    SRCS ar/bind_ar.h ar/bind_ar.cpp
    LIBS Desbordante::ar
)

Desbordante_AddBinds(cfd
    SRCS cfd/bind_cfd.h cfd/bind_cfd_verification.h cfd/bind_cfd.cpp cfd/bind_cfd_verification.cpp
    LIBS Desbordante::cfd Desbordante::cfd::verifier
)

Desbordante_AddBinds(data SRCS data/bind_data_types.h data/bind_data_types.cpp)

Desbordante_AddBinds(dc
    SRCS dc/bind_dc_verification.h dc/bind_fastadc.h dc/bind_dc_verification.cpp dc/bind_fastadc.cpp
    LIBS Desbordante::dc::verifier Desbordante::dc::fastadc
)
target_include_directories(${Desb}.bind.dc SYSTEM PRIVATE "${frozen_SOURCE_DIR}/include")

Desbordante_AddBinds(dd
    SRCS dd/bind_dd_verification.h dd/bind_split.h dd/bind_dd_verification.cpp dd/bind_split.cpp
    LIBS Desbordante::dd::verifier Desbordante::dd::split
)

Desbordante_AddBinds(fd.verifier.dynamic
    SRCS dynamic/bind_dynamic_fd_verification.h dynamic/bind_dynamic_fd_verification.cpp
    LIBS Desbordante::fd::verifier::dynamic
)

Desbordante_AddBinds(fd
    SRCS fd/bind_fd.h fd/bind_fd_verification.h fd/bind_fd.cpp fd/bind_fd_verification.cpp
    LIBS Desbordante::fd Desbordante::fd::verifier Desbordante::fd::hy Desbordante::fd::aid Desbordante::fd::euler
         Desbordante::fd::depminer Desbordante::fd::dfd Desbordante::fd::fastfds Desbordante::fd::fdep
         Desbordante::fd::mine Desbordante::fd::fun Desbordante::fd::pyro Desbordante::fd::tane
         Desbordante::fd::tane::pfd
)

Desbordante_AddBinds(gfd
    SRCS gfd/bind_gfd.h gfd/bind_gfd_verification.h gfd/bind_gfd.cpp gfd/bind_gfd_verification.cpp
    LIBS Desbordante::gfd::miner Desbordante::gfd::validator
)
Desbordante_AddBinds(ind
    SRCS ind/bind_ind.h ind/bind_ind_verification.h ind/bind_ind.cpp ind/bind_ind_verification.cpp
    LIBS Desbordante::ind Desbordante::ind::verifier Desbordante::ind::spider Desbordante::ind::faida
         Desbordante::ind::mind
)

Desbordante_AddBinds(md
    SRCS md/bind_md.h md/bind_md_verification.h md/object_similarity_measure.h md/bind_md.cpp md/bind_md_verification.cpp
    LIBS Desbordante::md::verifier
)

Desbordante_AddBinds(mfd
    SRCS mfd/bind_mfd_verification.h mfd/bind_mfd_verification.cpp
    LIBS Desbordante::metric::verifier
)

Desbordante_AddBinds(nar
    SRCS nar/bind_nar.cpp nar/bind_nar.h
    LIBS Desbordante::nar Desbordante::nar::des
)

Desbordante_AddBinds(nd
    SRCS nd/bind_nd.h nd/bind_nd_verification.h nd/bind_nd.cpp nd/bind_nd_verification.cpp
    LIBS Desbordante::nd::verifier Desbordante::nd
)

Desbordante_AddBinds(od
    SRCS od/bind_od.h od/bind_od_verification.h od/bind_od.cpp od/bind_od_verification.cpp
    LIBS Desbordante::od::fast Desbordante::od::order Desbordante::od::set_based_aod_verifier
)

Desbordante_AddBinds(pfd
    SRCS pfd/bind_pfd_verification.h pfd/bind_pfd_verification.cpp
    LIBS Desbordante::fd::pfd_verifier
)
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
target_link_libraries(Desbordante.bind.util PRIVATE pybind11::pybind11)
target_link_libraries(${BINDINGS_NAME} PRIVATE Desbordante.bind.util)

Desbordante_AddBinds(sfd
    SRCS sfd/bind_sfd.h sfd/bind_sfd.cpp
    LIBS Desbordante::fd::sfd::cords
)
Desbordante_AddBinds(statistics
    SRCS statistics/bind_statistics.h statistics/bind_statistics.cpp
    LIBS Desbordante::datastats
)
Desbordante_AddBinds(ucc
    SRCS ucc/bind_ucc.h ucc/bind_ucc_verification.h ucc/bind_ucc.cpp ucc/bind_ucc_verification.cpp
    LIBS Desbordante::ucc::hpivalid Desbordante::ucc Desbordante::ucc::hy Desbordante::ucc::pyro
)


target_link_libraries(${BINDINGS_NAME} PRIVATE pybind11::pybind11 Desbordante::algos)
pybind11_extension(${BINDINGS_NAME})
if(NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
    # Strip unnecessary sections of the binary on Linux/macOS
    pybind11_strip(${BINDINGS_NAME})
endif()
set_target_properties(${BINDINGS_NAME} PROPERTIES CXX_VISIBILITY_PRESET "hidden")

# Configure output directory to central build folder
# Ensures generated .so/.pyd files are placed alongside other binaries
set_target_properties(
    ${BINDINGS_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY
                                ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} # ${CMAKE_BINARY_DIR}/target
)


# ---- Installation Setup ----

if(PYTHON STREQUAL "INSTALL")
    # Install Python bindings module to system
    # Places the compiled library in the root installation directory
    install(TARGETS ${BINDINGS_NAME} LIBRARY DESTINATION .)
endif()
