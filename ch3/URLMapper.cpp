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

#include "URLMapper.h"

#include <stdexcept>

void URLMapper::AddURL(const std::string& original, const std::string& compressed)
{
    auto result = url_hash.try_emplace(compressed, original);

    if(!result.second)
        throw std::runtime_error("This compressed URL already exists!");
}

std::string URLMapper::Search(const std::string& url)
{
    auto it = url_hash.find(url);

    if(it == url_hash.end())
        throw std::invalid_argument("This URL does not exist!");
    
    return it->second;
}