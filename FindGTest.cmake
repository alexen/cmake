# FindGTest.cmake - Try to find gtest libraries
#
# Variables you must try to specify:
#   GTEST_ROOT - path to gtest source or install direcroty
#   GTEST_BUILD - path to gtest built libraries directory (GTEST_ROOT by default)
#
# Once done this will define
#   GTEST_INCLUDE_DIRS - gtest include directory
#   GTEST_LIBRARIES - both gtest libraries: libgtest.a and libgtest_main.a
#

find_path(GTEST_INCLUDE_DIR
    gtest/gtest.h
    HINTS ${GTEST_ROOT}/include
)

if(NOT GTEST_INCLUDE_DIR)
    message(FATAL_ERROR "No gtest include found. Try to specify GTEST_ROOT variable.")
endif()

if(NOT GTEST_BUILD)
    set(GTEST_BUILD ${GTEST_ROOT})
endif()

find_library(GTEST_LIBRARY
    gtest
    HINTS ${GTEST_BUILD} ${GTEST_BUILD}/lib
)

if(NOT GTEST_LIBRARY)
    message(FATAL_ERROR "No gtest library found. Try to specify GTEST_BUILD variable.")
endif()

find_library(GTEST_MAIN_LIBRARY
    gtest_main
    HINTS ${GTEST_BUILD} ${GTEST_BUILD}/lib
)

if(NOT GTEST_MAIN_LIBRARY)
    message(FATAL_ERROR "No gtest_main library found. Try to specify GTEST_BUILD variable.")
endif()

set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
set(GTEST_LIBRARIES ${GTEST_LIBRARY} ${GTEST_MAIN_LIBRARY})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(GMock
    DEFAULT_MSG
    GTEST_INCLUDE_DIRS
    GTEST_LIBRARIES
)

mark_as_advanced(GTEST_INCLUDE_DIR GTEST_LIBRARY GTEST_MAIN_LIBRARY)