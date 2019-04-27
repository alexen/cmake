# Модуль поиска библиотеки Celero C++
#
# https://github.com/DigitalInBlue/Celero
#
#
find_path(Celero_INCLUDE_DIR
     Celero.h celero/Celero.h
     HINTS ${Celero_ROOT} ${Celero_ROOT}/include
     )
find_library(Celero_LIBRARY
     NAMES celero
     HINTS ${Celero_ROOT} ${Celero_ROOT}/lib
     )

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Celero
     DEFAULT_MSG
     Celero_LIBRARY
     Celero_INCLUDE_DIR
     )
mark_as_advanced(
     Celero_LIBRARY
     Celero_INCLUDE_DIR
     )