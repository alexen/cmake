# FindGMock.cmake - Try to find gmock and gtest libraries
#
# Variables you must try to specify:
#   GMOCK_ROOT - path to gmock source or install direcroty
#   GMOCK_BUILD - path to gmock built libraries directory (GMOCK_ROOT by default)
#   GTEST_ROOT - path to gtest source or install direcroty (${GMOCK_ROOT}/gtest by default)
#   GTEST_BUILD - path to gtest built libraries directory (${GMOCK_BUILD}/gtest by default)
#
# Once done this will define
#   GMOCK_INCLUDE_DIRS - gmock include directory
#   GMOCK_LIBRARIES - both gmock libraries: libgmock.a and libgmock_main.a
#   GTEST_INCLUDE_DIRS - gtest include directory
#   GTEST_LIBRARIES - both gtest libraries: libgtest.a and libgtest_main.a
#

set(GTEST_ROOT "${GMOCK_ROOT}/gtest")

message(STATUS "GMOCK_ROOT=${GMOCK_ROOT}")
message(STATUS "GTEST_ROOT=${GTEST_ROOT}")


if(NOT GMOCK_BUILD)
    set(GMOCK_BUILD ${GMOCK_ROOT})
endif()

set(GTEST_BUILD ${GMOCK_BUILD}/gtest)

find_package(GTest)

find_path(GMOCK_INCLUDE_DIR
    gmock/gmock.h
    HINTS ${GMOCK_ROOT}/include
)

if(NOT GMOCK_INCLUDE_DIR)
    message(FATAL_ERROR "No gmock include found. Try to specify GMOCK_ROOT variable.")
endif()

find_library(GMOCK_LIBRARY
    gmock
    HINTS ${GMOCK_BUILD} ${GMOCK_BUILD}/lib
)

if(NOT GMOCK_LIBRARY)
    message(FATAL_ERROR "No gmock library found. Try to specify GMOCK_BUILD variable.")
endif()

find_library(GMOCK_MAIN_LIBRARY
    gmock_main
    HINTS ${GMOCK_BUILD} ${GMOCK_BUILD}/lib
)

if(NOT GMOCK_MAIN_LIBRARY)
    message(FATAL_ERROR "No gmock_main library found. Try to specify GMOCK_BUILD variable.")
endif()

set(GMOCK_INCLUDE_DIRS ${GMOCK_INCLUDE_DIR})
set(GMOCK_LIBRARIES ${GMOCK_LIBRARY} ${GMOCK_MAIN_LIBRARY})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(GMock
    DEFAULT_MSG
    GMOCK_INCLUDE_DIRS
    GMOCK_LIBRARIES
)

mark_as_advanced(GMOCK_INCLUDE_DIR GMOCK_LIBRARY GMOCK_MAIN_LIBRARY)