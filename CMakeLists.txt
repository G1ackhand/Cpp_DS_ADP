cmake_minimum_required(VERSION 3.10)
project(bloomfilter LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(OPENSSL_BUILD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs/openssl-3.4.0/build")

set(OPENSSL_INCLUDE_DIR "${OPENSSL_BUILD_DIR}/include")

set(OPENSSL_LIBRARIES
    "${OPENSSL_BUILD_DIR}/lib/libssl.a"
    "${OPENSSL_BUILD_DIR}/lib/libcrypto.a")

if (NOT EXISTS "${OPENSSL_INCLUDE_DIR}")
    message(FATAL_ERROR "OpenSSL include directory not found: ${OPENSSL_INCLUDE_DIR}")
endif()

if (NOT EXISTS "${OPENSSL_BUILD_DIR}/lib/libssl.a" OR NOT EXISTS "${OPENSSL_BUILD_DIR}/lib/libcrypto.a")
    message(FATAL_ERROR "OpenSSL libraries not found in: ${OPENSSL_BUILD_DIR}/lib")
endif()

add_executable(bloomfilter
    main.cpp
    ch3/BloomFilter.cpp
    ch3/AddressChecker.cpp
)

target_include_directories(bloomfilter
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/ch3
    ${OPENSSL_INCLUDE_DIR}
)

target_link_libraries(bloomfilter
    PRIVATE
    ${OPENSSL_LIBRARIES}
)