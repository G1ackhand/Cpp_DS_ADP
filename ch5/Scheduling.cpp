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

#include "Scheduling.h"

#include <cstdio>
#include <algorithm>

void Scheduling::InsertJob(const Job& job) noexcept
{
    max_time = std::max(max_time, job.last);
    jobs.emplace_back(job);
}

void Scheduling::PrintJobs() noexcept
{
    printf("\n[Now Jobs]\n");

    for(const auto& job : jobs)
    {
        printf("[%d] %d->%d\t|", job.id, job.start, job.last);

        for(int i = 0; i < job.start; ++i)
            printf(" ");

        for(int i = job.start; i < job.last; ++i)
            printf("*");

        for(int i = job.last; i < max_time; ++i)
            printf(" ");

        printf("|\n");
    }
    printf("\n");
}

void Scheduling::Schedule() noexcept
{
    jobs.sort([](const Job& lhs, const Job& rhs)
        {
            return lhs.last < rhs.last;
        });

    for(auto i = jobs.begin(); i != std::prev(jobs.end()); i++)
        for(auto j = std::next(i); j != jobs.end();)
            j = i->last > j->start ? jobs.erase(j) : std::next(j);
}