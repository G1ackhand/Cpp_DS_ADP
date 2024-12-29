// Created on Sun Dec 29 2024
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

#include <cstdint>
#include <string>
#include <queue>

struct Job
{
    std::string user_name;
    std::uint16_t pages;
    std::uint8_t id;
};

class Printer
{
public:
    Printer() = default;
    ~Printer() = default;

    void AddJob(const Job& job) noexcept;
    void Print() noexcept;

private:
    std::queue<Job> jobs;
};