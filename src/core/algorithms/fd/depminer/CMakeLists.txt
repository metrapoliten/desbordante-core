set(name depminer)
Desbordante_AddLibrary(${name}
    PREFIX fd
    CREATE_ALIAS
    SRCS depminer.cpp
    LIBS ${Desb}.fd.pli spdlog::spdlog_header_only Boost::headers
)

add_headers(${Desb}.fd.depminer PRIVATE depminer.h cmax_set.h)
