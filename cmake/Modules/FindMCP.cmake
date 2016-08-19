# - Check for the presence of MCP
# The module defines the following variables
# MCP_FOUND        - true if was MCP_found on the system
# MCP_LIBRARIES    - Required Libraries for all requested bindings

set(MCP_BSP_ROOT "$ENV{AOCL_BOARD_PACKAGE_ROOT}")
# MCP_LIBRARIES should include the following on Linux:
# AOCL_BOARD_PACKAGE_ROOT/host/linux64/lib/
# libaltera_qpi_mmd.so
find_library(MCP_ALTERA_QPI_MMD_LIBRARY
             altera_qpi_mmd
             ${MCP_BSP_ROOT}/host/linux64/lib
             NO_DEFAULT_PATH)
if (MCP_ALTERA_QPI_MMD_LIBRARY)
    list(APPEND MCP_LIBRARIES ${MCP_ALTERA_QPI_MMD_LIBRARY})
else (MCP_ALTERA_QPI_MMD_LIBRARY)
    unset(MCP_FOUND)
    message(FATAL_ERROR "Cannot find MCP's altera_qpi_mmd library")
endif (MCP_ALTERA_QPI_MMD_LIBRARY)

set(MCP_FOUND)
