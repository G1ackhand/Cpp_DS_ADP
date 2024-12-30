// Created on Mon Dec 30 2024
// © 2024 BLACKHAND Studio. All rights reserved.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//      http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#pragma once

#include <openssl/md5.h>

#include <bitset>
#include <string>
#include <array>

inline static constexpr int MAX_BIT = 0x80;
inline static constexpr int HASH_SIZE = 0x10;

class BloomFilter
{
public:
    BloomFilter() = default;
    ~BloomFilter() = default;

    bool LookUp(const std::string& key) noexcept;
    void Insert(const std::string& key) noexcept;

private:
    std::bitset<MAX_BIT> data;
    unsigned char digest[HASH_SIZE];

    inline void Hash(const std::string& key) noexcept
    {
        MD5(reinterpret_cast<const unsigned char*>(
            key.c_str()), key.size(), digest);
    }
};