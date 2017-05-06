cmake_minimum_required(VERSION 3.7)

project(CatchMain)

add_library(CatchMain
	catchMain.cpp
)

target_include_directories(CatchMain PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../Catch/single_include>
	$<INSTALL_INTERFACE:include/catch>
)

install(TARGETS CatchMain EXPORT CatchMainConfig
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

include(CMakePackageConfigHelpers)
set(ConfigPackageLocation lib/cmake/CatchMain)
install(EXPORT CatchMainConfig
	FILE CatchMainConfig.cmake
	DESTINATION ${ConfigPackageLocation}
)

