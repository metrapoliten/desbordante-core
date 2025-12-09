# Load CMake's built-in GoogleTest module
include(GoogleTest)
#TODO:  add_executable(${TEST_NAME} main.cpp ${FILES}) or add_library(test_main main.cpp)
Desbordante_AddLibrary(main
    PREFIX testlib
    SRCS main.cpp
    LIBS spdlog::spdlog_header_only
)

function(Desbordante_AddTest name)
    set(multiVals SRCS LIBS)
    cmake_parse_arguments(args "" "" "${multiVals}" ${ARGN})
    list(APPEND args_LIBS ${Desb}.testlib.main gtest)
    Desbordante_AddTarget(${name}
        PREFIX test
        TYPE EXE
        SRCS ${args_SRCS}
        LIBS ${args_LIBS}
    )
    target_include_directories(${name} PRIVATE "../common")
    gtest_discover_tests(${name}
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    )
endfunction()

set(name ind)
Desbordante_AddLibrary(${name}
    PREFIX testlib
    SRCS test_ind_util.cpp
    LIBS ${Desb}::ind
)
add_headers(${name} PRIVATE test_ind_util.h)
target_include_directories(${Desb}.testlib.ind PRIVATE "../common")

Desbordante_AddTest(ind.faida
    SRCS test_faida.cpp
    LIBS ${Desb}.test.common ${Desb}::ind ${Desb}::ind::faida ${Desb}.testlib.ind spdlog::spdlog_header_only
)
#todo: rework
add_library(${Desb}.test.common.obj OBJECT)
target_sources(${Desb}.test.common.obj PRIVATE
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.h"
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.cpp"
        "${CMAKE_SOURCE_DIR}/src/tests/common/csv_config_util.h"
)
target_include_directories(${Desb}.test.common.obj PRIVATE "../common")

Desbordante_AddTest(ind.algos
    SRCS $<TARGET_OBJECTS:${Desb}.test.common.obj> test_ind_algorithms.cpp
    LIBS ${Desb}.algos ${Desb}::ind ${Desb}.testlib.ind ${Desb}.testlib.hash ${Desb}::ind::spider ${Desb}::ind::mind
         ${Desb}::ind::faida spdlog::spdlog_header_only
)
Desbordante_AddTest(fd.algos
    SRCS $<TARGET_OBJECTS:${Desb}.test.common.obj> test_fd_algorithm.cpp
    LIBS ${Desb}::fd::depminer ${Desb}::fd::dfd ${Desb}::fd::fastfds ${Desb}::fd::fdep
         ${Desb}::fd::fun ${Desb}::fd::hy ${Desb}::fd::pyro ${Desb}::fd::tane::pfd ${Desb}::fd::tane ${Desb}::fd
         spdlog::spdlog_header_only
)
Desbordante_AddTest(fd.mine
    SRCS $<TARGET_OBJECTS:${Desb}.test.common.obj> test_fd_mine.cpp
    LIBS ${Desb}::fd::pyro ${Desb}::fd::mine ${Desb}.test.common spdlog::spdlog_header_only
)
Desbordante_AddTest(fd.approx
    SRCS $<TARGET_OBJECTS:${Desb}.test.common.obj> test_fd_util.h test_fd_approximate.cpp
    LIBS ${Desb}::fd ${Desb}::fd::euler spdlog::spdlog_header_only
)
Desbordante_AddTest(ucc.algos
    SRCS $<TARGET_OBJECTS:${Desb}.test.common.obj> test_ucc_algorithms.cpp
    LIBS ${Desb}::ucc ${Desb}::ucc::hy ${Desb}.testlib.hash ${Desb}::ucc::pyro ${Desb}::ucc::hpivalid spdlog::spdlog_header_only
)
#todo: rework

# --- AC ---
Desbordante_AddTest(ac
    SRCS test_ac_algorithm.cpp
    LIBS ${Desb}::ac ${Desb}.test.common spdlog::spdlog_header_only
)

# --- AR ---
Desbordante_AddTest(ar
    SRCS test_apriori.cpp
    LIBS ${Desb}::ar ${Desb}.test.common spdlog::spdlog_header_only
)

# --- CFD ---
Desbordante_AddTest(cfd.algos
    SRCS test_cfd_algos.cpp
    LIBS ${Desb}::cfd ${Desb}.test.common ${Desb}.cfd.model spdlog::spdlog_header_only
)
Desbordante_AddTest(cfd.relation_data
    SRCS test_cfd_relation_data.cpp
    LIBS ${Desb}.test.common ${Desb}.parser.csv ${Desb}.cfd.model
)
Desbordante_AddTest(cfd.verifier
    SRCS test_cfd_verifier.cpp
    LIBS ${Desb}::cfd::verifier ${Desb}.test.common spdlog::spdlog_header_only
)

# --- CSV ---
Desbordante_AddTest(csv.parser
    SRCS test_csv_parser.cpp
    LIBS ${Desb}.parser.csv ${Desb}.test.common
)

# --- DataStats ---
Desbordante_AddTest(datastats
    SRCS test_data_stats.cpp
    LIBS ${Desb}::datastats ${Desb}.test.common spdlog::spdlog_header_only
)

# --- DC ---
#test_dc_structures_correct_results.h
Desbordante_AddTest(dc.structs
    SRCS test_dc_structures.cpp
    LIBS ${Desb}.dc.fastadc.structs ${Desb}.test.common ${Desb}.parser.csv ${Desb}.model.types ${Desb}.model.table spdlog::spdlog_header_only
)
target_include_directories(${Desb}.test.dc.structs SYSTEM PRIVATE "${frozen_SOURCE_DIR}/include")
Desbordante_AddTest(dc.verifier
    SRCS test_dc_verifier.cpp
    LIBS ${Desb}::dc::verifier ${Desb}.test.common spdlog::spdlog_header_only
)
target_include_directories(${Desb}.test.dc.verifier SYSTEM PRIVATE "${frozen_SOURCE_DIR}/include")

# --- DD ---
Desbordante_AddTest(dd.verifier
    SRCS test_dd_verifier.cpp
    LIBS ${Desb}::dd::verifier ${Desb}.test.common spdlog::spdlog_header_only
)
# --- DD.Split ---
Desbordante_AddTest(dd.split
    SRCS test_split.cpp
    LIBS ${Desb}::dd::split ${Desb}.test.common spdlog::spdlog_header_only
)

# --- DES ---
Desbordante_AddTest(nar.des
    SRCS test_des.cpp
    LIBS ${Desb}::nar::des ${Desb}::nar ${Desb}.test.common ${Desb}.algos spdlog::spdlog_header_only
)

# --- FD ---
Desbordante_AddTest(fd.verifier.dynamic
    SRCS test_dynamic_fd_verifier.cpp
    LIBS ${Desb}::fd::verifier ${Desb}::fd::verifier::dynamic ${Desb}.test.common ${Desb}.algos spdlog::spdlog_header_only
)
Desbordante_AddTest(fd.verifier
    SRCS test_fd_verifier.cpp
    LIBS ${Desb}::fd::verifier ${Desb}.algos ${Desb}.test.common spdlog::spdlog_header_only
)
# --- FD.PFDTane ---
Desbordante_AddTest(fd.tane.pfd
    SRCS test_pfdtane.cpp
    LIBS ${Desb}::fd::tane::pfd ${Desb}.test.common ${Desb}.model.table spdlog::spdlog_header_only
)
# --- FD.PFDVerifier ---
Desbordante_AddTest(fd.pfd_verifier
    SRCS test_pfd_verifier.cpp
    LIBS ${Desb}::fd::pfd_verifier ${Desb}.test.common ${Desb}.algos spdlog::spdlog_header_only
)
# --- FD.SFD ---
Desbordante_AddTest(fd.sfd.cords
    SRCS test_sfd.cpp
    LIBS ${Desb}::fd::sfd::cords ${Desb}.test.common ${Desb}.model.table spdlog::spdlog_header_only
)
# --- FD.Tane ---
Desbordante_AddTest(fd.tane
    SRCS test_tane_afd_measures.cpp
    LIBS ${Desb}::fd::tane ${Desb}.test.common ${Desb}.model.table spdlog::spdlog_header_only
)

# --- GFD ---
set(name gfd.paths)
Desbordante_AddLibrary(${name}
    PREFIX testlib
    SRCS all_gfd_paths.cpp
)
add_headers(${name} PRIVATE all_gfd_paths.h)
target_include_directories(${name} PRIVATE "../common")

Desbordante_AddTest(gfd.miner
    SRCS test_gfd_miner.cpp
    LIBS ${Desb}::gfd::miner ${Desb}.testlib.gfd.paths spdlog::spdlog_header_only
)
Desbordante_AddTest(gfd.validator
    SRCS test_gfd_validator.cpp
    LIBS ${Desb}::gfd::validator ${Desb}.testlib.gfd.paths spdlog::spdlog_header_only
)

# --- Helper.Hash ---
set(name hash)
Desbordante_AddLibrary(${name}
    PREFIX testlib
    SRCS test_hash_util.cpp

)
add_headers(${name} PRIVATE test_hash_util.h)

# --- IND ---
Desbordante_AddTest(ind.verifier
    SRCS test_ind_verifier.cpp
    LIBS ${Desb}::ind::verifier ${Desb}.test.common ${Desb}.algos spdlog::spdlog_header_only
)

# --- Model.Bitset ---
Desbordante_AddTest(model.bitset SRCS test_bitset.cpp LIBS spdlog::spdlog_header_only)
# --- Model.Types.NumericTypeCast ---
Desbordante_AddTest(model.types.numeric_type_cast SRCS test_numerictype_cast.cpp)
# --- Model.Types.DoubleCompare ---
Desbordante_AddTest(model.types.double_compare SRCS test_double_compare.cpp)
# --- Model.Types.Types ---
Desbordante_AddTest(model.types SRCS test_types.cpp LIBS ${Desb}.model.types)
# --- Model.Table ---
Desbordante_AddTest(model.table SRCS test_typed_column_data.cpp LIBS ${Desb}.model.table ${Desb}.test.common ${Desb}.parser.csv)

# --- ND ---
Desbordante_AddTest(nd.verifier
    SRCS test_nd_verifier.cpp
    LIBS ${Desb}::nd::verifier ${Desb}.test.common spdlog::spdlog_header_only
)

# --- MD ---
Desbordante_AddTest(md.hy SRCS test_hymd.cpp LIBS ${Desb}.md.hy ${Desb}.test.common spdlog::spdlog_header_only)
Desbordante_AddTest(md.metrics SRCS test_hymd_metrics.cpp LIBS ${Desb}.md.hy.preprocessing spdlog::spdlog_header_only)
Desbordante_AddTest(md.verifier
    SRCS test_md_verification.cpp
    LIBS ${Desb}::md::verifier ${Desb}.test.common spdlog::spdlog_header_only
)

# --- Metric ---
Desbordante_AddTest(metric.verifier
    SRCS test_metric_verifier.cpp
    LIBS ${Desb}::metric::verifier ${Desb}.test.common spdlog::spdlog_header_only
)

# --- OD.FastOD ---
Desbordante_AddTest(od.fastod SRCS test_fastod.cpp LIBS ${Desb}::od::fast ${Desb}.test.common spdlog::spdlog_header_only)
# --- OD.Order ---
Desbordante_AddTest(od.order SRCS test_order.cpp LIBS ${Desb}::od::order ${Desb}.test.common spdlog::spdlog_header_only)
# --- OD.SetBasedAODVerifier ---
Desbordante_AddTest(od.set_based_aod_verifier
    SRCS test_set_based_verifier.cpp
    LIBS ${Desb}::od::set_based_aod_verifier ${Desb}::od::fast ${Desb}.test.common spdlog::spdlog_header_only
)

# --- UCC ---
Desbordante_AddTest(ucc.verifier
    SRCS test_ucc_verifier.cpp
    LIBS ${Desb}::ucc::verifier ${Desb}::ucc::hy ${Desb}.test.common ${Desb}.model.table spdlog::spdlog_header_only
)

# --- Util ---
#todo: only need fd::pyrocommon.model
Desbordante_AddTest(util
    SRCS test_util.cpp
    LIBS ${Desb}.test.common ${Desb}.fd.pyro.common ${Desb}.parser.csv
)
