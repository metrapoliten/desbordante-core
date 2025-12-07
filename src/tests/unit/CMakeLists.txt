#TODO:  add_executable(${TEST_NAME} main.cpp ${FILES}) or add_library(test_main main.cpp)?
add_library(test_main main.cpp)
function(add_test_with_libraries NAME FILES LIBS)
    set(TEST_NAME test.${NAME})
    add_executable(${TEST_NAME} ${FILES})
    target_link_libraries(${TEST_NAME} PRIVATE test_main gtest ${LIBS})
    #todo: delete when includes
    target_include_directories(${TEST_NAME} PRIVATE "../common")
    gtest_discover_tests(${TEST_NAME}
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    )
endfunction()

function(Desbordante_AddTest NAME)
    set(multiVals SRCS LIBS)
    cmake_parse_arguments(args "" "" "${multiVals}" ${ARGN})
    set(NAME Desbordante.test.${NAME})
    list(APPEND args_LIBS test_main gtest)
    Desbordante_AddTarget(${NAME}
            TYPE EXE
            _SRCS ${args_SRCS}
            _LIBS ${args_LIBS}
    )
    target_include_directories(${NAME} PRIVATE "../common")
    gtest_discover_tests(${NAME}
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
    LIBS test.common Desbordante::ind ind::faida test_helper.ind.util
)
#todo: rework
add_library(test.common.obj OBJECT)
target_include_directories(test.common.obj PRIVATE "../common")
target_sources(test.common.obj PRIVATE
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.h"
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.cpp"
        "${CMAKE_SOURCE_DIR}/src/tests/common/csv_config_util.h"
)
add_test_with_libraries(ind.algos
    "$<TARGET_OBJECTS:test.common.obj>;test_ind_algorithms.cpp"
    "algos;Desbordante::ind;test_helper.ind.util;tests.util.hash;ind::spider;ind::mind;ind::faida"
)
Desbordante_AddTest(fd.algos
    SRCS $<TARGET_OBJECTS:test.common.obj> test_fd_algorithm.cpp
    LIBS Desbordante::fd::depminer Desbordante::fd::dfd Desbordante::fd::fastfds Desbordante::fd::fdep
         Desbordante::fd::fun Desbordante::fd::hy Desbordante::fd::pyro Desbordante::fd::tane::pfd Desbordante::fd::tane Desbordante::fd
)
add_test_with_libraries(fd.mine
        "$<TARGET_OBJECTS:test.common.obj>;test_fd_mine.cpp"
        "Desbordante::fd::pyro;Desbordante::fd::mine;test::common"
)
add_test_with_libraries(fd.approx
        "$<TARGET_OBJECTS:test.common.obj>;test_fd_util.h;test_fd_approximate.cpp"
        "Desbordante::fd;Desbordante::fd::euler"
)
add_test_with_libraries(ucc.algos
        "$<TARGET_OBJECTS:test.common.obj>;test_ucc_algorithms.cpp"
        "ucc::ucc;ucc::hy;tests.util.hash;ucc::pyro;ucc::hpivalid"
)
#todo: rework

# --- AC ---
add_test_with_libraries(ac test_ac_algorithm.cpp "Desbordante::ac;test::common")

# --- AR ---
add_test_with_libraries(ar test_apriori.cpp "Desbordante::ar;test::common")

# --- CFD ---
Desbordante_AddTest(cfd.algos
    SRCS test_cfd_algos.cpp
    LIBS Desbordante::cfd test::common cfd.model
)
add_test_with_libraries(cfd.relation_data test_cfd_relation_data.cpp "test::common;parser::csv;cfd.model")
Desbordante_AddTest(cfd.verifier
    SRCS test_cfd_verifier.cpp
    LIBS Desbordante::cfd::verifier test::common
)

# --- CSV ---
add_test_with_libraries(csv.parser test_csv_parser.cpp "parser::csv;test::common")

# --- DataStats ---
add_test_with_libraries(datastats test_data_stats.cpp "datastats;test::common")

# --- DC ---
#test_dc_structures_correct_results.h
add_test_with_libraries(dc.structs test_dc_structures.cpp "dc.fastadc.structs;test::common;parser::csv;model.types;model.table")
Desbordante_AddTest(dc.verifier
    SRCS test_dc_verifier.cpp
    LIBS Desbordante::dc::verifier test::common
)

# --- DD ---
Desbordante_AddTest(dd.verifier
    SRCS test_dd_verifier.cpp
    LIBS Desbordante::dd::verifier test::common
)
# --- DD.Split ---
Desbordante_AddTest(dd.split
    SRCS test_split.cpp
    LIBS Desbordante::dd::split test::common
)

# --- DES ---
Desbordante_AddTest(nar.des
    SRCS test_des.cpp
    LIBS Desbordante::nar::des Desbordante::nar test::common algos
)

# --- FD ---
Desbordante_AddTest(fd.verifier.dynamic
    SRCS test_dynamic_fd_verifier.cpp
    LIBS Desbordante::fd::verifier Desbordante::fd::verifier::dynamic test::common algos
)
Desbordante_AddTest(fd.verifier
    SRCS test_fd_verifier.cpp
    LIBS Desbordante::fd::verifier algos test::common
)
# --- FD.PFDTane ---
add_test_with_libraries(fd.tane.pfd test_pfdtane.cpp "Desbordante::fd::tane::pfd;test::common;model.table")
# --- FD.PFDVerifier ---
add_test_with_libraries(fd.pfdverifier test_pfd_verifier.cpp "fd::pfdverifier;test::common;algos")
# --- FD.SFD ---
add_test_with_libraries(fd.sfd.cords test_sfd.cpp "fd::sfd::cords;test::common;model.table")
# --- FD.Tane ---
add_test_with_libraries(fd.tane test_tane_afd_measures.cpp "Desbordante::fd::tane;test::common;model.table")

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
    LIBS Desbordante::ind::verifier test::common algos
)

# --- Model.Bitset ---
add_test_with_libraries(model.bitset test_bitset.cpp "")
# --- Model.Types.NumericTypeCast ---
add_test_with_libraries(model.types.numeric_type_cast test_numerictype_cast.cpp "")
# --- Model.Types.DoubleCompare ---
add_test_with_libraries(model.types.double_compare test_double_compare.cpp "")
# --- Model.Types.Types ---
add_test_with_libraries(model.types.types test_types.cpp model.types)
# --- Model.Table ---
add_test_with_libraries(model.table test_typed_column_data.cpp "model.table;test.common;parser.csv")

# --- ND ---
Desbordante_AddTest(nd.verifier
    SRCS test_nd_verifier.cpp
    LIBS Desbordante::nd::verifier test::common
)

# --- MD ---
add_test_with_libraries(md.hy test_hymd.cpp "md::hy;test::common")
add_test_with_libraries(md.metrics test_hymd_metrics.cpp md.hy.preprocessing)
Desbordante_AddTest(md.verifier
    SRCS test_md_verification.cpp
    LIBS Desbordante::md::verifier test::common
)

# --- Metric ---
Desbordante_AddTest(metric.verifier
    SRCS test_metric_verifier.cpp
    LIBS Desbordante::metric::verifier test::common
)

# --- OD.FastOD ---
add_test_with_libraries(od.fastod test_fastod.cpp "od::fastod;test::common")
# --- OD.Order ---
add_test_with_libraries(od.order test_order.cpp "od::order;test::common")
# --- OD.SetBasedAODVerifier ---
add_test_with_libraries(od.set_based_aod_verifier test_set_based_verifier.cpp "od::set_based_aod_verifier;od::fastod;test::common")

# --- UCC ---
add_test_with_libraries(ucc.verifier test_ucc_verifier.cpp "ucc::verifier;ucc::hy;test::common;model.table")

# --- Util ---
#todo: only need fd::pyrocommon.model
add_test_with_libraries(util test_util.cpp "test::common;fd::pyrocommon;parser::csv")

