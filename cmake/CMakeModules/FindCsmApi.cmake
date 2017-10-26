# - Find csmApi library
# Find the native csmApi includes and library
# This module defines
#  CSMAPI_INCLUDE_DIR, where to find cam api headers, etc.
#  CSMAPI_LIBRARY, where to find the CSMAPI library.
#  CSMAPI_FOUND, If false, do not try to use csmApi.
# also defined, but not for general use are
#
# NOTE: If MSP Distro is available, CSM can be found there.

SET(CMAKE_FIND_FRAMEWORK "LAST")
FIND_PATH(CSMAPI_INCLUDE_DIR csm/csm.h
        PATHS
        $ENV{MSP_HOME}/include/common
        $ENV{CSM_HOME}/include
        /usr/include
        /usr/local/include
        ${OSSIM_DEPENDENCIES}/include
		  ${OSSIM_INSTALL_PREFIX}/include
)

find_library(CSMAPI_LIBRARY NAMES MSPcsmapi csmapi
   PATHS
      $ENV{MSP_HOME}/lib
      $ENV{CSM_HOME}/lib
      ${OSSIM_INSTALL_PREFIX}/lib${LIBSUFFIX}
      ${OSSIM_DEPENDENCIES}/lib
      ${OSSIM_INSTALL_PREFIX}
)

#---
# This function sets CSMAPI_FOUND if variables are valid.
#--- 
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args( CSMAPI DEFAULT_MSG 
                                   CSMAPI_LIBRARY 
                                   CSMAPI_INCLUDE_DIR )
if ( NOT CSMAPI_FOUND )
   message( WARNING "Could not find CSMAPI" )
else ()
   if( NOT CSMAPI_FIND_QUIETLY )
      message( STATUS "CSMAPI_INCLUDE_DIR=${CSMAPI_INCLUDE_DIR}" )
      message( STATUS "CSMAPI_LIBRARY=${CSMAPI_LIBRARY}" )
   endif( NOT CSMAPI_FIND_QUIETLY )
endif (NOT CSMAPI_FOUND)

mark_as_advanced(CSMAPI_INCLUDE_DIR CSMAPI_LIBRARY)
