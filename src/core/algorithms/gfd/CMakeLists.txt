add_subdirectory(gfd_miner)
add_subdirectory(gfd_validator)

set(name gfd)
Desbordante_AddLibrary(${name} SRCS comparator.cpp gfd.cpp LIBS Boost::headers)

add_headers(${name} PRIVATE gfd.h comparator.h graph_descriptor.h)
