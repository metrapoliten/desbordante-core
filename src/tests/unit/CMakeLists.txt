# Load CMake's built-in GoogleTest module
include(GoogleTest)
#TODO:  add_executable(${TEST_NAME} main.cpp ${FILES}) or add_library(test_main main.cpp)
Desbordante_AddLibrary(main
    PREFIX testlib
    SRCS main.cpp
    LIBS spdlog::spdlog_header_only gtest
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
    gtest_discover_tests(${name}
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    )
endfunction()

set(name ind)
Desbordante_AddLibrary(${name}
    PREFIX testlib
    SRCS test_ind_util.cpp
    LIBS ${Desb}::ind gtest
)
add_headers(${name} PRIVATE test_ind_util.h)
target_include_directories(${Desb}.testlib.ind PRIVATE "../common")

Desbordante_AddTest(ind.faida
    SRCS test_faida.cpp
    LIBS ${Desb}.testlib.common ${Desb}::ind ${Desb}::ind::faida ${Desb}.testlib.ind spdlog::spdlog_header_only better-enums
)

#todo: rework
add_library(${Desb}.testlib.common.obj OBJECT)
target_sources(${Desb}.testlib.common.obj PRIVATE
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.h"
        "${CMAKE_SOURCE_DIR}/src/tests/common/all_csv_configs.cpp"
        "${CMAKE_SOURCE_DIR}/src/tests/common/csv_config_util.h"
)
target_include_directories(${Desb}.testlib.common.obj PRIVATE ${PROJECT_SOURCE_DIR}/src)

Desbordante_AddTest(ind.algos
    SRCS $<TARGET_OBJECTS:${Desb}.testlib.common.obj> test_ind_algorithms.cpp
    LIBS ${Desb}.algos ${Desb}::ind ${Desb}.testlib.ind ${Desb}.testlib.hash ${Desb}::ind::spider ${Desb}::ind::mind
         ${Desb}::ind::faida spdlog::spdlog_header_only better-enums
)

Desbordante_AddTest(fd.algos
    SRCS $<TARGET_OBJECTS:${Desb}.testlib.common.obj> test_fd_algorithm.cpp
    LIBS ${Desb}::fd::depminer ${Desb}::fd::dfd ${Desb}::fd::fastfds ${Desb}::fd::fdep
         ${Desb}::fd::fun ${Desb}::fd::hy ${Desb}::fd::pyro ${Desb}::fd::tane::pfd ${Desb}::fd::tane ${Desb}::fd
         spdlog::spdlog_header_only better-enums gmock
)

Desbordante_AddTest(fd.mine
    SRCS $<TARGET_OBJECTS:${Desb}.testlib.common.obj> test_fd_mine.cpp
    LIBS ${Desb}::fd::pyro ${Desb}::fd::mine ${Desb}.testlib.common spdlog::spdlog_header_only better-enums gmock
)

Desbordante_AddTest(fd.approx
    SRCS $<TARGET_OBJECTS:${Desb}.testlib.common.obj> test_fd_util.h test_fd_approximate.cpp
    LIBS ${Desb}::fd ${Desb}::fd::euler spdlog::spdlog_header_only better-enums gmock
)

Desbordante_AddTest(ucc.algos
    SRCS $<TARGET_OBJECTS:${Desb}.testlib.common.obj> test_ucc_algorithms.cpp
    LIBS ${Desb}::ucc ${Desb}::ucc::hy ${Desb}.testlib.hash ${Desb}::ucc::pyro ${Desb}::ucc::hpivalid spdlog::spdlog_header_only better-enums gmock
)
#todo: rework

# --- AC ---
Desbordante_AddTest(ac
    SRCS test_ac_algorithm.cpp
    LIBS ${Desb}::ac ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)

# --- AR ---
Desbordante_AddTest(ar
    SRCS test_apriori.cpp
    LIBS ${Desb}::ar ${Desb}.testlib.common spdlog::spdlog_header_only better-enums gmock
)

# --- CFD ---
Desbordante_AddTest(cfd.algos
    SRCS test_cfd_algos.cpp
    LIBS ${Desb}::cfd ${Desb}.testlib.common ${Desb}.cfd.model spdlog::spdlog_header_only better-enums
)

Desbordante_AddTest(cfd.relation_data
    SRCS test_cfd_relation_data.cpp
    LIBS ${Desb}.testlib.common ${Desb}.parser.csv ${Desb}.cfd.model
)
Desbordante_AddTest(cfd.verifier
    SRCS test_cfd_verifier.cpp
    LIBS ${Desb}::cfd::verifier ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)

# --- CSV ---
Desbordante_AddTest(csv.parser
    SRCS test_csv_parser.cpp
    LIBS ${Desb}.parser.csv ${Desb}.testlib.common gmock
)

# --- DataStats ---
Desbordante_AddTest(datastats
    SRCS test_data_stats.cpp
    LIBS ${Desb}::datastats ${Desb}.testlib.common spdlog::spdlog_header_only better-enums gmock
)

# --- DC ---
#test_dc_structures_correct_results.h
Desbordante_AddTest(dc.structs
    SRCS test_dc_structures.cpp
    LIBS ${Desb}.dc.fastadc.structs ${Desb}.testlib.common ${Desb}.parser.csv ${Desb}.model.types ${Desb}.model.table spdlog::spdlog_header_only frozen better-enums gmock
)

Desbordante_AddTest(dc.verifier
    SRCS test_dc_verifier.cpp
    LIBS ${Desb}::dc::verifier ${Desb}.testlib.common spdlog::spdlog_header_only frozen better-enums gmock
)

# --- DD ---
Desbordante_AddTest(dd.verifier
    SRCS test_dd_verifier.cpp
    LIBS ${Desb}::dd::verifier ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)
# --- DD.Split ---
Desbordante_AddTest(dd.split
    SRCS test_split.cpp
    LIBS ${Desb}::dd::split ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)

# --- DES ---
Desbordante_AddTest(nar.des
    SRCS test_des.cpp
    LIBS ${Desb}::nar::des ${Desb}::nar ${Desb}.testlib.common ${Desb}.algos spdlog::spdlog_header_only better-enums
)

# --- FD ---
Desbordante_AddTest(fd.verifier.dynamic
    SRCS test_dynamic_fd_verifier.cpp
    LIBS ${Desb}::fd::verifier ${Desb}::fd::verifier::dynamic ${Desb}.testlib.common ${Desb}.algos spdlog::spdlog_header_only better-enums
)
Desbordante_AddTest(fd.verifier
    SRCS test_fd_verifier.cpp
    LIBS ${Desb}::fd::verifier ${Desb}.algos ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)
# --- FD.PFDTane ---
Desbordante_AddTest(fd.tane.pfd
    SRCS test_pfdtane.cpp
    LIBS ${Desb}::fd::tane::pfd ${Desb}.testlib.common ${Desb}.model.table spdlog::spdlog_header_only better-enums
)
# --- FD.PFDVerifier ---
Desbordante_AddTest(fd.pfd_verifier
    SRCS test_pfd_verifier.cpp
    LIBS ${Desb}::fd::pfd_verifier ${Desb}.testlib.common ${Desb}.algos spdlog::spdlog_header_only better-enums
)
# --- FD.SFD ---
Desbordante_AddTest(fd.sfd.cords
    SRCS test_sfd.cpp
    LIBS ${Desb}::fd::sfd::cords ${Desb}.testlib.common ${Desb}.model.table spdlog::spdlog_header_only better-enums
)
# --- FD.Tane ---
Desbordante_AddTest(fd.tane
    SRCS test_tane_afd_measures.cpp
    LIBS ${Desb}::fd::tane ${Desb}.testlib.common ${Desb}.model.table spdlog::spdlog_header_only better-enums
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
    LIBS ${Desb}::gfd::miner ${Desb}.testlib.gfd.paths spdlog::spdlog_header_only better-enums
)
Desbordante_AddTest(gfd.validator
    SRCS test_gfd_validator.cpp
    LIBS ${Desb}::gfd::validator ${Desb}.testlib.gfd.paths spdlog::spdlog_header_only better-enums
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
    LIBS ${Desb}::ind::verifier ${Desb}.testlib.common ${Desb}.algos spdlog::spdlog_header_only better-enums
)

# --- Model.Bitset ---
Desbordante_AddTest(model.bitset SRCS test_bitset.cpp LIBS spdlog::spdlog_header_only)
# --- Model.Types.NumericTypeCast ---
Desbordante_AddTest(model.types.numeric_type_cast SRCS test_numerictype_cast.cpp LIBS better-enums)
# --- Model.Types.DoubleCompare ---
Desbordante_AddTest(model.types.double_compare SRCS test_double_compare.cpp LIBS better-enums)
# --- Model.Types.Types ---
Desbordante_AddTest(model.types SRCS test_types.cpp LIBS ${Desb}.model.types LIBS better-enums)
# --- Model.Table ---
Desbordante_AddTest(model.table SRCS test_typed_column_data.cpp LIBS ${Desb}.model.table ${Desb}.testlib.common ${Desb}.parser.csv better-enums)

# --- ND ---
Desbordante_AddTest(nd.verifier
    SRCS test_nd_verifier.cpp
    LIBS ${Desb}::nd::verifier ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)

# --- MD ---
Desbordante_AddTest(md.hy SRCS test_hymd.cpp LIBS ${Desb}.md.hy ${Desb}.testlib.common spdlog::spdlog_header_only better-enums)
Desbordante_AddTest(md.metrics SRCS test_hymd_metrics.cpp LIBS ${Desb}.md.hy.preprocessing spdlog::spdlog_header_only better-enums)
Desbordante_AddTest(md.verifier
    SRCS test_md_verification.cpp
    LIBS ${Desb}::md::verifier ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)

# --- Metric ---
Desbordante_AddTest(metric.verifier
    SRCS test_metric_verifier.cpp
    LIBS ${Desb}::metric::verifier ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)

# --- OD.FastOD ---
Desbordante_AddTest(od.fastod SRCS test_fastod.cpp LIBS ${Desb}::od::fast ${Desb}.testlib.common spdlog::spdlog_header_only better-enums)
# --- OD.Order ---
Desbordante_AddTest(od.order SRCS test_order.cpp LIBS ${Desb}::od::order ${Desb}.testlib.common spdlog::spdlog_header_only better-enums)
# --- OD.SetBasedAODVerifier ---
Desbordante_AddTest(od.set_based_aod_verifier
    SRCS test_set_based_verifier.cpp
    LIBS ${Desb}::od::set_based_aod_verifier ${Desb}::od::fast ${Desb}.testlib.common spdlog::spdlog_header_only better-enums
)

# --- UCC ---
Desbordante_AddTest(ucc.verifier
    SRCS test_ucc_verifier.cpp
    LIBS ${Desb}::ucc::verifier ${Desb}::ucc::hy ${Desb}.testlib.common ${Desb}.model.table spdlog::spdlog_header_only better-enums
)

# --- Util ---
#todo: only need fd::pyrocommon.model
Desbordante_AddTest(util
    SRCS test_util.cpp
    LIBS ${Desb}.testlib.common ${Desb}.fd.pyro.common ${Desb}.parser.csv
)
