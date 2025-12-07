#TODO:  add_executable(${TEST_NAME} main.cpp ${FILES}) or add_library(test_main main.cpp)?
add_library(test_main main.cpp)

function(Desbordante_AddTest name)
    set(multiVals SRCS LIBS)
    cmake_parse_arguments(args "" "" "${multiVals}" ${ARGN})
    list(APPEND args_LIBS test_main gtest)
    Desbordante_AddTarget(${name}
            PREFIX "test"
            TYPE "EXE"
            _SRCS ${args_SRCS}
            _LIBS ${args_LIBS}
    )
    target_include_directories(${name} PRIVATE "../common")
    gtest_discover_tests(${name}
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    )
endfunction()

add_library(test_helper.ind.util)
add_headers(test_helper.ind.util PRIVATE test_ind_util.h)
target_sources(test_helper.ind.util PRIVATE test_ind_util.cpp)

target_link_libraries(test_helper.ind.util PRIVATE Desbordante::ind)
target_include_directories(test_helper.ind.util PRIVATE "../common")

Desbordante_AddTest(ind.faida
    SRCS test_faida.cpp
    LIBS Desbordante.test.common Desbordante::ind Desbordante::ind::faida test_helper.ind.util
)
#todo: rework
add_library(Desbordante.test.common.obj OBJECT)
target_include_directories(Desbordante.test.common.obj PRIVATE "../common")
target_sources(Desbordante.test.common.obj PRIVATE
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.h"
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.cpp"
        "${CMAKE_SOURCE_DIR}/src/tests/common/csv_config_util.h"
)
Desbordante_AddTest(ind.algos
    SRCS $<TARGET_OBJECTS:Desbordante.test.common.obj> test_ind_algorithms.cpp
    LIBS algos Desbordante::ind test_helper.ind.util tests.util.hash Desbordante::ind::spider Desbordante::ind::mind Desbordante::ind::faida
)
Desbordante_AddTest(fd.algos
    SRCS $<TARGET_OBJECTS:Desbordante.test.common.obj> test_fd_algorithm.cpp
    LIBS Desbordante::fd::depminer Desbordante::fd::dfd Desbordante::fd::fastfds Desbordante::fd::fdep
         Desbordante::fd::fun Desbordante::fd::hy Desbordante::fd::pyro Desbordante::fd::tane::pfd Desbordante::fd::tane Desbordante::fd
)
Desbordante_AddTest(fd.mine
    SRCS $<TARGET_OBJECTS:Desbordante.test.common.obj> test_fd_mine.cpp
    LIBS Desbordante::fd::pyro Desbordante::fd::mine Desbordante.test.common
)
Desbordante_AddTest(fd.approx
    SRCS $<TARGET_OBJECTS:Desbordante.test.common.obj> test_fd_util.h test_fd_approximate.cpp
    LIBS Desbordante::fd Desbordante::fd::euler
)
Desbordante_AddTest(ucc.algos
    SRCS $<TARGET_OBJECTS:Desbordante.test.common.obj> test_ucc_algorithms.cpp
    LIBS Desbordante::ucc Desbordante::ucc::hy tests.util.hash Desbordante::ucc::pyro Desbordante::ucc::hpivalid
)
#todo: rework

# --- AC ---
Desbordante_AddTest(ac
    SRCS test_ac_algorithm.cpp
    LIBS Desbordante::ac Desbordante.test.common
)

# --- AR ---
Desbordante_AddTest(ar
    SRCS test_apriori.cpp
    LIBS Desbordante::ar Desbordante.test.common
)

# --- CFD ---
Desbordante_AddTest(cfd.algos
    SRCS test_cfd_algos.cpp
    LIBS Desbordante::cfd Desbordante.test.common cfd.model
)
Desbordante_AddTest(cfd.relation_data
    SRCS test_cfd_relation_data.cpp
    LIBS Desbordante.test.common parser::csv cfd.model
)
Desbordante_AddTest(cfd.verifier
    SRCS test_cfd_verifier.cpp
    LIBS Desbordante::cfd::verifier Desbordante.test.common
)

# --- CSV ---
Desbordante_AddTest(csv.parser
    SRCS test_csv_parser.cpp
    LIBS parser::csv Desbordante.test.common
)

# --- DataStats ---
Desbordante_AddTest(datastats
    SRCS test_data_stats.cpp
    LIBS Desbordante::datastats Desbordante.test.common
)

# --- DC ---
#test_dc_structures_correct_results.h
Desbordante_AddTest(dc.structs
    SRCS test_dc_structures.cpp
    LIBS dc.fastadc.structs Desbordante.test.common parser::csv model.types model.table
)
Desbordante_AddTest(dc.verifier
    SRCS test_dc_verifier.cpp
    LIBS Desbordante::dc::verifier Desbordante.test.common
)

# --- DD ---
Desbordante_AddTest(dd.verifier
    SRCS test_dd_verifier.cpp
    LIBS Desbordante::dd::verifier Desbordante.test.common
)
# --- DD.Split ---
Desbordante_AddTest(dd.split
    SRCS test_split.cpp
    LIBS Desbordante::dd::split Desbordante.test.common
)

# --- DES ---
Desbordante_AddTest(nar.des
    SRCS test_des.cpp
    LIBS Desbordante::nar::des Desbordante::nar Desbordante.test.common algos
)

# --- FD ---
Desbordante_AddTest(fd.verifier.dynamic
    SRCS test_dynamic_fd_verifier.cpp
    LIBS Desbordante::fd::verifier Desbordante::fd::verifier::dynamic Desbordante.test.common algos
)
Desbordante_AddTest(fd.verifier
    SRCS test_fd_verifier.cpp
    LIBS Desbordante::fd::verifier algos Desbordante.test.common
)
# --- FD.PFDTane ---
Desbordante_AddTest(fd.tane.pfd
    SRCS test_pfdtane.cpp
    LIBS Desbordante::fd::tane::pfd Desbordante.test.common model.table
)
# --- FD.PFDVerifier ---
Desbordante_AddTest(fd.pfd_verifier
    SRCS test_pfd_verifier.cpp
    LIBS Desbordante::fd::pfd_verifier Desbordante.test.common algos
)
# --- FD.SFD ---
Desbordante_AddTest(fd.sfd.cords
    SRCS test_sfd.cpp
    LIBS Desbordante::fd::sfd::cords Desbordante.test.common model.table
)
# --- FD.Tane ---
Desbordante_AddTest(fd.tane
    SRCS test_tane_afd_measures.cpp
    LIBS Desbordante::fd::tane Desbordante.test.common model.table
)

# --- GFD ---
add_library(tests.gfd.paths)
add_headers(tests.gfd.paths PRIVATE all_gfd_paths.h)
target_sources(tests.gfd.paths PRIVATE all_gfd_paths.cpp)
target_include_directories(tests.gfd.paths PRIVATE "../common")

Desbordante_AddTest(gfd.miner
    SRCS test_gfd_miner.cpp
    LIBS Desbordante::gfd::miner tests.gfd.paths
)
Desbordante_AddTest(gfd.validator
    SRCS test_gfd_validator.cpp
    LIBS Desbordante::gfd::validator tests.gfd.paths
)

# --- Helper.Hash ---
add_library(tests.util.hash)
add_headers(tests.util.hash PRIVATE test_hash_util.h)
target_sources(tests.util.hash PRIVATE test_hash_util.cpp)

# --- IND ---
Desbordante_AddTest(ind.verifier
    SRCS test_ind_verifier.cpp
    LIBS Desbordante::ind::verifier Desbordante.test.common algos
)

# --- Model.Bitset ---
Desbordante_AddTest(model.bitset SRCS test_bitset.cpp)
# --- Model.Types.NumericTypeCast ---
Desbordante_AddTest(model.types.numeric_type_cast SRCS test_numerictype_cast.cpp)
# --- Model.Types.DoubleCompare ---
Desbordante_AddTest(model.types.double_compare SRCS test_double_compare.cpp)
# --- Model.Types.Types ---
Desbordante_AddTest(model.types.types SRCS test_types.cpp LIBS model.types)
# --- Model.Table ---
Desbordante_AddTest(model.table SRCS test_typed_column_data.cpp LIBS model.table Desbordante.test.common parser.csv)

# --- ND ---
Desbordante_AddTest(nd.verifier
    SRCS test_nd_verifier.cpp
    LIBS Desbordante::nd::verifier Desbordante.test.common
)

# --- MD ---
Desbordante_AddTest(md.hy SRCS test_hymd.cpp LIBS md::hy Desbordante.test.common)
Desbordante_AddTest(md.metrics SRCS test_hymd_metrics.cpp LIBS md.hy.preprocessing)
Desbordante_AddTest(md.verifier
    SRCS test_md_verification.cpp
    LIBS Desbordante::md::verifier Desbordante.test.common
)

# --- Metric ---
Desbordante_AddTest(metric.verifier
    SRCS test_metric_verifier.cpp
    LIBS Desbordante::metric::verifier Desbordante.test.common
)

# --- OD.FastOD ---
Desbordante_AddTest(od.fastod SRCS test_fastod.cpp LIBS Desbordante::od::fastod Desbordante.test.common)
# --- OD.Order ---
Desbordante_AddTest(od.order SRCS test_order.cpp LIBS Desbordante::od::order Desbordante.test.common)
# --- OD.SetBasedAODVerifier ---
Desbordante_AddTest(od.set_based_aod_verifier
    SRCS test_set_based_verifier.cpp
    LIBS Desbordante::od::set_based_aod_verifier Desbordante::od::fastod Desbordante.test.common
)

# --- UCC ---
Desbordante_AddTest(ucc.verifier
    SRCS test_ucc_verifier.cpp
    LIBS ucc::verifier Desbordante::ucc::hy Desbordante.test.common model.table
)

# --- Util ---
#todo: only need fd::pyrocommon.model
Desbordante_AddTest(util
    SRCS test_util.cpp
    LIBS Desbordante.test.common fd::pyrocommon parser::csv
)
