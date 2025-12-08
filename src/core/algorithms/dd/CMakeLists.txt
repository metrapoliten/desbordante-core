add_subdirectory(split)
add_subdirectory(dd_verifier)

set(name dd)
Desbordante_AddLibrary(${name} LIB_TYPE INTERFACE)
add_headers(Desbordante.dd INTERFACE dd.h)
