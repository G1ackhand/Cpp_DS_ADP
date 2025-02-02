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

#include <list>

struct Job
{
    int id;
    int start;
    int last;
};

class Scheduling
{
public:
    Scheduling() = default;
    ~Scheduling() = default;

    void InsertJob(const Job& job) noexcept;
    void PrintJobs() noexcept;
    void Schedule() noexcept;

private:
    std::list<Job> jobs;
    int max_time = 0;
};