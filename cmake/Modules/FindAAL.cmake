# - Check for the presence of AAL
# The module defines the following variables
# AAL_FOUND        - true if was AAL_found on the system
# AAL_LIBRARIES    - Required Libraries for all requested bindings
find_library(AAL_OSAL_LIBRARY
             OSAL
             /usr/local/lib
             NO_DEFAULT_PATH)
if (AAL_OSAL_LIBRARY)
    list(APPEND AAL_LIBRARIES ${AAL_OSAL_LIBRARY})
else (AAL_OSAL_LIBRARY)
    unset(AAL_FOUND)
    message(FATAL_ERROR "Cannot find AAL's OSAL library")
endif (AAL_OSAL_LIBRARY)
find_library(AAL_AAS_LIBRARY
             AAS
             /usr/local/lib
             NO_DEFAULT_PATH)
if (AAL_AAS_LIBRARY)
    list(APPEND AAL_LIBRARIES ${AAL_AAS_LIBRARY})
else (AAL_AAS_LIBRARY)
    unset(AAL_FOUND)
    message(FATAL_ERROR "Cannot find AAL's AAS library")
endif (AAL_AAS_LIBRARY)
find_library(AAL_AALRT_LIBRARY
             aalrt
             /usr/local/lib
             NO_DEFAULT_PATH)
if (AAL_AALRT_LIBRARY)
    list(APPEND AAL_LIBRARIES ${AAL_AALRT_LIBRARY})
else (AAL_AALRT_LIBRARY)
    unset(AAL_FOUND)
    message(FATAL_ERROR "Cannot find AAL's aalrt library")
endif (AAL_AALRT_LIBRARY)

set(AAL_FOUND)
