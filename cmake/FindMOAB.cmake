# Try to find MOAB
#
# Once done this will define
#
#  MOAB_FOUND - system has MOAB
#  MOAB_INCLUDE_DIRS - the MOAB include directory
#  MOAB_LIBRARIES - Link these to use MOAB
#  MOAB_DEFINITIONS - Compiler switches required for using MOAB

find_path(MOAB_CMAKE_CONFIG NAMES MOABConfig.cmake
  HINTS ${MOAB_ROOT}
  PATHS ENV LD_LIBRARY_PATH DYLD_LIBRARY_PATH
  PATH_SUFFIXES lib Lib cmake cmake/MOAB lib/cmake/MOAB 
  NO_DEFAULT_PATH)

if( MOAB_CMAKE_CONFIG STREQUAL "MOAB_CMAKE_CONFIG-NOTFOUND")
  set(MOAB_FOUND FALSE)
  message(FATAL_ERROR "MOAB not found")
else()
  message(STATUS "Found MOAB in ${MOAB_CMAKE_CONFIG}")
  include(${MOAB_CMAKE_CONFIG}/MOABConfig.cmake)
  set(MOAB_FOUND FALSE)
endif()