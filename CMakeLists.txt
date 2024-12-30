cmake_minimum_required(VERSION 3.10)
project(partial LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(partial
    main.cpp
)

target_include_directories(partial
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/ch4
)