#TODO:  add_executable(${TEST_NAME} main.cpp ${FILES}) or add_library(test_main main.cpp)?
add_library(test_main main.cpp)
function(add_test_with_libraries NAME FILES LIBS
#        TEST_WORKING_DIRECTORY
)
    set(TEST_NAME test.${NAME})
    add_executable(${TEST_NAME} ${FILES})
    target_link_libraries(${TEST_NAME} PRIVATE test_main gtest ${LIBS})
    #todo: delete when includes
    target_include_directories(${TEST_NAME} PRIVATE "../common")
    gtest_discover_tests(${TEST_NAME}
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
            #[=[
            to fix segfault by ind.util (idk what the reason)
            docs: https://cmake.org/cmake/help/latest/module/GoogleTest.html#:~:text=DISCOVERY%5FMODE,-Added
            the solution was found here: https://discourse.cmake.org/t/cmake-build-and-test-with-qt-and-google-test/4729/2
            #]=]
#            DISCOVERY_MODE PRE_TEST
    )
endfunction()

# --- AC ---
add_test_with_libraries(ac test_ac_algorithm.cpp "ac;test::common")

# --- AR ---
add_test_with_libraries(ar test_apriori.cpp "ar;test::common")
#[=[ These tests aren't ready yet, disable them
#TODO: Model
# --- Model.Bitset ---
#add_test_with_libraries(model.bitset test_bitset.cpp model.bitset)
]=]
# --- CFD ---
add_test_with_libraries(cfd.algos test_cfd_algos.cpp "cfd::cfd;test::common")
add_test_with_libraries(cfd.relation_data test_cfd_relation_data.cpp "cfd::model;test::common;parser::csv;model")
add_test_with_libraries(cfd.verifier test_cfd_verifier.cpp "cfd::verifier;test::common")

# --- CSV ---
add_test_with_libraries(csv.parser test_csv_parser.cpp "parser::csv;test::common")

# --- DataStats ---
add_test_with_libraries(datastats test_data_stats.cpp "datastats;test::common")


# --- DC ---
#test_dc_structures_correct_results.h
add_test_with_libraries(dc.structs test_dc_structures.cpp "dc::fastadc::structs;model;test::common;parser::csv")
add_test_with_libraries(dc.verifier test_dc_verifier.cpp  "dc::verifier;test::common")

# --- DD ---
add_test_with_libraries(dd.verifier test_dd_verifier.cpp "dd::verifier;test::common")

# --- DES ---
add_test_with_libraries(nar.des test_des.cpp "nar::des;nar::nar;test::common;algos")

# --- FD ---
add_test_with_libraries(fd.dynverifier test_dynamic_fd_verifier.cpp "fd::verifier;fd::dynverifier;test::common;algos")

# --- IND ---
add_library(tests.ind.util)
target_sources(tests.ind.util PRIVATE test_ind_util.cpp)
target_link_libraries(tests.ind.util PRIVATE "test::common;algos;ind::ind")
target_include_directories(tests.ind.util PRIVATE "../common")
#[===[ todo: Segfault
add_headers(tests.ind.util PUBLIC test_ind_util.h)

#add_test_with_libraries(ind.util test_ind_util.cpp "")
#set_target_properties(test.ind.util PROPERTIES ENABLE_EXPORTS ON)

add_test_with_libraries(ind.faida test_faida.cpp "ind::faida;tests.ind.util;test::common")
add_test_with_libraries(ind.algos test_ind_algorithms.cpp "ind::faida;ind::mind;ind::spider;ind::ind;tests.ind.util;tests.util.hash")
#]===]
add_test_with_libraries(ind.verifier test_ind_verifier.cpp "ind::verifier;test::common;algos")

# --- OD.FastOD ---
add_test_with_libraries(od.fastod test_fastod.cpp "od::fastod;test::common")

# --- FD ---
#[===[ todo: Segfault
add_test_with_libraries(fd.algos test_fd_algorithm.cpp
    "fd::depminer;fd::dfd;fd::fastfds;fd::fdep;fd::fun;fd::hy;fd::pyro;fd::tane::pfd;fd::tane::tane;fd::fd;test::common")
#]===]

#[===[ todo: Segfault
add_library(tests.fd.util test_fd_util.h)
target_link_libraries(tests.fd.util PRIVATE test::common)
add_test_with_libraries(fd.approx test_fd_approximate.cpp "fd::eulerfd;fd::fd;tests.fd.util")
add_test_with_libraries(fd.mine test_fd_mine.cpp "fd::pyro;fd::mine;test::common")
#]===]

add_test_with_libraries(fd.verifier test_fd_verifier.cpp "fd::verifier;algos;test::common")

# --- GFD ---
add_library(tests.gfd.paths)
add_headers(tests.gfd.paths PUBLIC all_gfd_paths.h)
target_sources(tests.gfd.paths PRIVATE all_gfd_paths.cpp)
target_include_directories(tests.gfd.paths PRIVATE "../common")

add_test_with_libraries(gfd.miner test_gfd_miner.cpp "gfd::miner;tests.gfd.paths")
add_test_with_libraries(gfd.validator test_gfd_validator.cpp "gfd::validator;tests.gfd.paths")

# --- Helper.Hash ---
add_library(tests.util.hash)
add_headers(tests.util.hash PUBLIC test_hash_util.h)
target_sources(tests.util.hash PRIVATE test_hash_util.cpp)

# --- MD ---
add_test_with_libraries(md.hy test_hymd.cpp "md::hy;test::common")
add_test_with_libraries(md.metrics test_hymd_metrics.cpp md.hy.preprocessing)
add_test_with_libraries(md.verifier test_md_verification.cpp "md::verifier;test::common")

# --- Metric ---
add_test_with_libraries(metric test_metric_verifier.cpp "metric;test::common")

# --- ND ---
add_test_with_libraries(nd.verifier test_nd_verifier.cpp "nd::verifier;test::common")
#[=[ These tests aren't ready yet, disable them
#TODO: Model
# --- Model.NumericTypeCast (types.h) ---
#add_test_with_libraries(model.types1 test_numerictype_cast.cpp model.???)
# --- Model.Table ---
#add_test_with_libraries(model.table.typed_column_data test_typed_column_data.cpp model.???)
# --- Model.DoubleCompare (types.h) ---
#add_test_with_libraries(model.types test_double_compare.cpp model.???)
#add_test_with_libraries(model.types test_types.cpp model.???)
]=]

# --- OD.Order ---
add_test_with_libraries(od.order test_order.cpp "od::order;test::common")

# --- FD.PFDVerifier ---
add_test_with_libraries(fd.pfdverifier test_pfd_verifier.cpp "fd::pfdverifier;test::common;algos")

# --- FD.PFDTane ---
add_test_with_libraries(fd.tane.pfd test_pfdtane.cpp "fd::tane::pfd;test::common")

# --- OD.SetBasedAODVerifier ---
add_test_with_libraries(od.set_based_aod_verifier test_set_based_verifier.cpp "od::set_based_aod_verifier;od::fastod;test::common")
#[=[ These tests aren't ready yet, disable them
# --- FD.SFD ---
add_test_with_libraries(fd.sfd.cords test_sfd.cpp fd::sfd::cords)

# --- DD.Split ---
add_test_with_libraries(dd.split test_split.cpp dd::split)

# --- FD.Tane ---
add_test_with_libraries(fd.tane test_tane_afd_measures.cpp fd::tane::tane)

# --- UCC ---
add_test_with_libraries(ucc.algos test_ucc_algorithms.cpp "ucc::ucc ucc::hy ucc::pyro ucc::hpivalid")
add_test_with_libraries(ucc.verifier test_ucc_verifier.cpp ucc::verifier)

#TODO
# --- Util??? ---
add_test_with_libraries(util test_util.cpp "")
]=]
