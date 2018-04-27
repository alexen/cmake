# Модуль поиска библиотеки cURL
#
# CURL_ROOT         - Можно указать корень директории, где будет произведен поиск
#
# CURL_FOUND        - Устанавливается, если библиотека найдена
# CURL_INCLUDE_DIRS - Список директорий с заголовочными файлами библиотеки
# CURL_LIBRARIES    - Список библиотек cURL
#

find_path(CURL_INCLUDES
     NAMES     curl.h
     DOC       "cURL include directory"
)

find_library(CURL_LIBS
     NAMES     curl
     DOC       "cURL library"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CURL
     FOUND_VAR      CURL_FOUND
     REQUIRED_VARS  CURL_LIBS CURL_INCLUDES
)

if(CURL_FOUND)
     set(CURL_INCLUDE_DIRS ${CURL_INCLUDES})
     set(CURL_LIBRARIES ${CURL_LIBS})
endif()

mark_as_advanced(CURL_INCLUDES CURL_LIBS)