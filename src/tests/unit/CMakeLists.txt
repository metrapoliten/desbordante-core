#TODO: main.cpp

function(add_test_with_libraries TESTNAME FILES LIBRARIES
#        TEST_WORKING_DIRECTORY
)
    add_executable(${TESTNAME} ${FILES})
    target_link_libraries(${TESTNAME} gtest gmock ${LIBRARIES})
    gtest_discover_tests(${TESTNAME}
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    )
endfunction()

# --- AC ---
add_test_with_libraries(tests.ac test_ac_algorithm.cpp ac)

# --- AR ---
add_test_with_libraries(tests.ar test_apriori.cpp ar)

# TODO
# --- Model.Bitset ---
#add_test_with_libraries(tests.model.bitset test_bitset.cpp model.bitset)

# --- CFD ---
add_test_with_libraries(tests.cfd.algos test_cfd_algos.cpp cfd::cfd)
add_test_with_libraries(tests.cfd.relation_data test_cfd_relation_data.cpp cfd::model)
add_test_with_libraries(tests.cfd.verifier test_cfd_verifier.cpp cfd::verifier)

# --- CSV ---
add_test_with_libraries(tests.csv.parser test_csv_parser.cpp parser::csv)

# --- DataStats ---
add_test_with_libraries(tests.datastats test_data_stats.cpp datastats)

# --- DC ---
add_test_with_libraries(tests.dc.structs test_dc_structures.cpp dc::fastadc::structs) #test_dc_structures_correct_results.h
add_test_with_libraries(tests.dc.verifier test_dc_verifier.cpp  dc::verifier)

# --- DD ---
add_test_with_libraries(tests.dd.verifier test_dd_verifier.cpp dd::verifier)

# --- DES ---
add_test_with_libraries(tests.nar.des test_des.cpp nar::des)

# --- Model.DoubleCompare (types.h) ---
#add_test_with_libraries(tests.model.types test_double_compare.cpp model.types)

# --- FD ---
add_test_with_libraries(tests.fd.dynverifier test_dynamic_fd_verifier.cpp fd::dynverifier)

# --- IND ---
add_library(tests.ind.util)
add_library(tests::ind::util ALIAS tests.ind.util)
add_headers(tests.ind.util PUBLIC test_ind_util.h)
target_sources(tests.ind.util PRIVATE test_ind_util.cpp)

add_test_with_libraries(tests.ind.faida test_faida.cpp "ind::faida tests::ind::util")
add_test_with_libraries(tests.ind.algos test_ind_algorithms.cpp "ind::faida ind::mind ind::spider ind::ind tests::ind::util")
add_test_with_libraries(tests.ind.verifier test_ind_verifier.cpp ind::verifier)

# --- OD.FastOD ---
add_test_with_libraries(tests.od.fastod test_fastod.cpp od::fastod)

# --- FD ---
# TODO: "test_fd_util.h"
add_test_with_libraries(tests.fd.algos test_fd_algorithm.cpp
        "fd::depminer fd::dfd fd::fastfds fd::fdep fd::fun fd::hyfd fd::pyro fd::tane::pfd fd::tane::tane fd::fd")
add_test_with_libraries(tests.fd.approx test_fd_approximate.cpp fd::eulerfd fd::fd)
add_test_with_libraries(tests.fd.mine test_fd_mine.cpp fd::pyrofd fd::fd)
add_test_with_libraries(tests.fd.verifier test_fd_verifier.cpp fd::verifier)

# --- GFD ---
add_library(tests.gfd.paths)
add_library(tests::gfd::paths ALIAS tests.gfd.paths)
add_headers(tests.gfd.paths PUBLIC all_gfd_paths.h)
target_sources(tests.gfd.paths PRIVATE all_gfd_paths.cpp)

add_test_with_libraries(tests.gfd.miner test_gfd_miner.cpp "gfd::miner tests::gfd::paths")
add_test_with_libraries(tests.gfd.validator test_gfd_validator.cpp "gfd::validator tests::gfd::paths")

# --- Helper.Hash ---
add_library(hash)
add_headers(hash PUBLIC test_hash_util.h)
target_sources(hash PRIVATE test_hash_util.cpp)

# --- MD ---
add_test_with_libraries(tests.md.hymd test_hymd.cpp md::hymd)
add_test_with_libraries(tests.md.metrics test_hymd_metrics.cpp md::hymd::preprocessing)

