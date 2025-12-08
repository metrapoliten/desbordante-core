set(name dc.verifier)
Desbordante_AddLibrary(${name}
    CREATE_ALIAS
    SRCS dc_verifier.cpp
    LIBS ${Desb_PREFIX}.model.table ${Desb_PREFIX}.model.types Desbordante.dc.model Desbordante.dc.parser
)

add_headers(${name} PRIVATE dc_verifier.h)
