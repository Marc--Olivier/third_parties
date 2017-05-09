cmake_minimum_required(VERSION 3.7)

project(GoogleBenchmarkMain)

#find_package(benchmark HINTS ../google-benchmark)
#if(NOT benchmark_FOUND)
#	message(FATAL_ERROR "Could not find google-benchmark: ${benchmark_FOUND}")
#endif()

add_library(GoogleBenchmarkMain
	googleBenchmarkMain.cpp
)
add_library(benchmark::main ALIAS GoogleBenchmarkMain)

target_link_libraries(GoogleBenchmarkMain
	PUBLIC benchmark
)

#get_target_property(benchmark_interface_include benchmark::benchmark )
target_include_directories(GoogleBenchmarkMain PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../google-benchmark/include>
)

install(TARGETS GoogleBenchmarkMain EXPORT GoogleBenchmarkMainTarget
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

include(CMakePackageConfigHelpers)
set(ConfigPackageLocation lib/cmake/GoogleBenchmarkMain)
install(FILES GoogleBenchmarkMainConfig.cmake
	DESTINATION ${ConfigPackageLocation})
install(EXPORT GoogleBenchmarkMainTarget
	FILE GoogleBenchmarkMainTarget.cmake
	NAMESPACE "benchmark::"
	DESTINATION ${ConfigPackageLocation}
)
