set(GTEST_ROOT ${GMOCK_ROOT}/gtest)

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