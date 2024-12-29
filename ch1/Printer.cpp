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

#include "Printer.h"

#include <cstdio>

void Printer::AddJob(const Job& job) noexcept
{
    jobs.push(job);
}

void Printer::Print() noexcept
{
    if(jobs.empty())
        printf("\nNo job in print queue!\n");
    else
    {
        Job job = jobs.front();

        printf("Now processing %s's job(%d) :\n",
            job.user_name.c_str(), static_cast<int>(job.id));

        for(std::uint16_t i = 0; i < job.pages; ++i)
            printf("Printing...(%d / %d)\n",
                static_cast<int>(i), static_cast<int>(job.pages));

        printf("DONE!\n");
        jobs.pop();
    }
}