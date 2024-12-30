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

#include "BloomFilter.h"

#include <cstdio>

bool BloomFilter::LookUp(const std::string& key) noexcept
{
    Hash(key);

    for(auto it = &digest[0]; it < &digest[MAX_BIT]; ++it)
        if(!data[*it % MAX_BIT])
            return false;

    return true;
}

void BloomFilter::Insert(const std::string& key) noexcept
{
    Hash(key);

    for(auto it = &digest[0]; it < &digest[MAX_BIT]; ++it)
        data[*it % MAX_BIT] = true;
}