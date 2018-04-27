#.rst:
# FindPqxx
# --------
#
# Find libpqxx library - official PostgreSQL C++ client
#
# This will define the following variables::
#
#     Pqxx_FOUND         - True if the system has libpqxx library
#     Pqxx_INCLUDE_DIRS  - List of include directories that contain headers of the library
#     Pqxx_LIBRARIES     - List of libraries which was found
#

find_path(Pqxx_INCLUDES
     NAMES     pqxx/connection pqxx/transaction
     DOC       "pqxx include directory"
)

find_library(Pqxx_LIBS
     NAMES     pqxx
     DOC       "pqxx library"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Pqxx
     FOUND_VAR      Pqxx_FOUND
     REQUIRED_VARS  Pqxx_LIBS Pqxx_INCLUDES
)

if(Pqxx_FOUND)
     set(Pqxx_INCLUDE_DIRS ${Pqxx_INCLUDES})
     set(Pqxx_LIBRARIES ${Pqxx_LIBS})
endif()

mark_as_advanced(Pqxx_INCLUDES Pqxx_LIBS)