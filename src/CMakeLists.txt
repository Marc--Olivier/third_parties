cmake_minimum_required(VERSION 3.7)

project(third_parties)
enable_testing(true)

add_subdirectory(Catch)
add_subdirectory(CatchMain)
add_subdirectory(google-benchmark)
add_subdirectory(google-benchmark-main)
add_subdirectory(range-v3)

