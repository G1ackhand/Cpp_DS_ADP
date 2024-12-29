cmake_minimum_required(VERSION 3.10)
project(list-merging LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(list-merging
    main.cpp
    ch2/ListMerging.cpp
)

target_include_directories(list-merging
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/ch2
)