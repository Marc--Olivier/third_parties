#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "benchmark::GoogleBenchmarkMain" for configuration "Release"
set_property(TARGET benchmark::GoogleBenchmarkMain APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(benchmark::GoogleBenchmarkMain PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libGoogleBenchmarkMain.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS benchmark::GoogleBenchmarkMain )
list(APPEND _IMPORT_CHECK_FILES_FOR_benchmark::GoogleBenchmarkMain "${_IMPORT_PREFIX}/lib/libGoogleBenchmarkMain.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
