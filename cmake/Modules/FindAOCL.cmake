# - Check for the presence of AOCL
# The module defines the following variables
# AOCL_FOUND        - true if AOCL was found on the system
# AOCL_INCLUDE_DIRS - Location of the AOCL includes
# AOCL_LIBRARIES    - Required Libraries for all requested bindings

set(AOCL_ROOT "$ENV{ALTERAOCLSDKROOT}")
find_path(AOCL_INCLUDE_DIRS
          CL/opencl.h
          ${AOCL_ROOT}/host/include
          NO_DEFAULT_PATH)

if (AOCL_INCLUDE_DIRS)
else (AOCL_INCLUDE_DIRS)
    unset(AOCL_FOUND)
    message(FATAL_ERROR "Cannot find AOCL headers!")
endif (AOCL_INCLUDE_DIRS)

# AOCL_LIBRARIES should include the following on Linux:
# ALTERAOCLSDKROOT/host/linux64/lib/
# libelf.so
find_library(AOCL_ELF_LIBRARY
             elf
             ${AOCL_ROOT}/host/linux64/lib
             NO_DEFAULT_PATH)
if (AOCL_ELF_LIBRARY)
    list(APPEND AOCL_LIBRARIES ${AOCL_ELF_LIBRARY})
else (AOCL_ELF_LIBRARY)
    unset(AOCL_FOUND)
    message(FATAL_ERROR "Cannot find AOCL's elf library")
endif (AOCL_ELF_LIBRARY)
# libalteracl.so
find_library(AOCL_ALTERACL_LIBRARY
             alteracl
             ${AOCL_ROOT}/host/linux64/lib
             NO_DEFAULT_PATH)
if (AOCL_ALTERACL_LIBRARY)
    list(APPEND AOCL_LIBRARIES ${AOCL_ALTERACL_LIBRARY})
else (AOCL_ALTERACL_LIBRARY)
    unset(AOCL_FOUND)
    message(FATAL_ERROR "Cannot find AOCL's alteracl library")
endif (AOCL_ALTERACL_LIBRARY)
# libalterahalmmd.so
find_library(AOCL_ALTERAHALMMD_LIBRARY
             alterahalmmd
             ${AOCL_ROOT}/host/linux64/lib
             NO_DEFAULT_PATH)
if (AOCL_ALTERAHALMMD_LIBRARY)
    list(APPEND AOCL_LIBRARIES ${AOCL_ALTERAHALMMD_LIBRARY})
else (AOCL_ALTERAHALMMD_LIBRARY)
    unset(AOCL_FOUND)
    message(FATAL_ERROR "Cannot find AOCL's alterahalmmd library")
endif (AOCL_ALTERAHALMMD_LIBRARY)

set(AOCL_FOUND)
