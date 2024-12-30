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

#include "AddressChecker.h"

#include <cstdio>

void AddressChecker::AddAddress(const std::string& address) noexcept
{
    filter.Insert(address);
    printf("%s is inserted.\n", address.c_str());
}

bool AddressChecker::Check(const std::string& address) noexcept
{
    bool check = filter.LookUp(address);

    if(check)
        printf("%s is already exist!\n", address.c_str());
    else
        printf("%s is available.\n", address.c_str());

    return check;
}