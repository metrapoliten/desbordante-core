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


add_library(test_helper.ind.util)
add_headers(test_helper.ind.util PRIVATE test_ind_util.h)
target_sources(test_helper.ind.util PRIVATE test_ind_util.cpp)

target_link_libraries(test_helper.ind.util PRIVATE ind::ind)
target_include_directories(test_helper.ind.util PRIVATE "../common")

add_test_with_libraries(ind.faida
        test_faida.cpp
        "test.common;ind::ind;ind::faida;test_helper.ind.util")
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
    "algos;ind::ind;test_helper.ind.util;tests.util.hash;ind::spider;ind::mind;ind::faida"
)
add_test_with_libraries(fd.algos
    "$<TARGET_OBJECTS:test.common.obj>;test_fd_algorithm.cpp"
    "fd::depminer;fd::dfd;fd::fastfds;fd::fdep;fd::fun;fd::hy;fd::pyro;fd::tane::pfd;fd::tane::tane;fd::fd"
)
add_test_with_libraries(fd.mine
        "$<TARGET_OBJECTS:test.common.obj>;test_fd_mine.cpp"
        "fd::pyro;fd::mine;test::common"
)
add_test_with_libraries(fd.approx
        "$<TARGET_OBJECTS:test.common.obj>;test_fd_util.h;test_fd_approximate.cpp"
        "fd::fd;fd::euler"
)
add_test_with_libraries(ucc.algos
        "$<TARGET_OBJECTS:test.common.obj>;test_ucc_algorithms.cpp"
        "ucc::ucc;ucc::hy;tests.util.hash;ucc::pyro;ucc::hpivalid"
)
#todo: rework

# --- AC ---
add_test_with_libraries(ac test_ac_algorithm.cpp "ac;test::common")

# --- AR ---
add_test_with_libraries(ar test_apriori.cpp "ar;test::common")

# --- CFD ---
add_test_with_libraries(cfd.algos test_cfd_algos.cpp "cfd::cfd;test::common;cfd.model")
add_test_with_libraries(cfd.relation_data test_cfd_relation_data.cpp "test::common;parser::csv;cfd.model")
add_test_with_libraries(cfd.verifier test_cfd_verifier.cpp "cfd::verifier;test::common")

# --- CSV ---
add_test_with_libraries(csv.parser test_csv_parser.cpp "parser::csv;test::common")

# --- DataStats ---
add_test_with_libraries(datastats test_data_stats.cpp "datastats;test::common")

# --- DC ---
#test_dc_structures_correct_results.h
add_test_with_libraries(dc.structs test_dc_structures.cpp "dc.fastadc.structs;test::common;parser::csv;model.types;model.table")
add_test_with_libraries(dc.verifier test_dc_verifier.cpp  "dc::verifier;test::common")

# --- DD ---
add_test_with_libraries(dd.verifier test_dd_verifier.cpp "dd::verifier;test::common")
# --- DD.Split ---
add_test_with_libraries(dd.split test_split.cpp "dd::split;test::common")

# --- DES ---
add_test_with_libraries(nar.des test_des.cpp "nar::des;nar::nar;test::common;algos")

# --- FD ---
add_test_with_libraries(fd.dynverifier test_dynamic_fd_verifier.cpp "fd::verifier;fd::dynverifier;test::common;algos")
add_test_with_libraries(fd.verifier test_fd_verifier.cpp "fd::verifier;algos;test::common")

# --- FD.PFDTane ---
add_test_with_libraries(fd.tane.pfd test_pfdtane.cpp "fd::tane::pfd;test::common;model.table")
# --- FD.PFDVerifier ---
add_test_with_libraries(fd.pfdverifier test_pfd_verifier.cpp "fd::pfdverifier;test::common;algos")
# --- FD.SFD ---
add_test_with_libraries(fd.sfd.cords test_sfd.cpp "fd::sfd::cords;test::common;model.table")
# --- FD.Tane ---
add_test_with_libraries(fd.tane test_tane_afd_measures.cpp "fd::tane::tane;test::common;model.table")

# --- GFD ---
add_library(tests.gfd.paths)
add_headers(tests.gfd.paths PRIVATE all_gfd_paths.h)
target_sources(tests.gfd.paths PRIVATE all_gfd_paths.cpp)
target_include_directories(tests.gfd.paths PRIVATE "../common")

add_test_with_libraries(gfd.miner test_gfd_miner.cpp "gfd::miner;tests.gfd.paths")
add_test_with_libraries(gfd.validator test_gfd_validator.cpp "gfd::validator;tests.gfd.paths")

# --- Helper.Hash ---
add_library(tests.util.hash)
add_headers(tests.util.hash PRIVATE test_hash_util.h)
target_sources(tests.util.hash PRIVATE test_hash_util.cpp)

# --- IND ---
add_test_with_libraries(ind.verifier test_ind_verifier.cpp "ind::verifier;test::common;algos")

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
add_test_with_libraries(nd.verifier test_nd_verifier.cpp "nd::verifier;test::common")

# --- MD ---
add_test_with_libraries(md.hy test_hymd.cpp "md::hy;test::common")
add_test_with_libraries(md.metrics test_hymd_metrics.cpp md.hy.preprocessing)
add_test_with_libraries(md.verifier test_md_verification.cpp "md::verifier;test::common")

# --- Metric ---
add_test_with_libraries(metric.verifier test_metric_verifier.cpp "metric.verifier;test::common")

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

