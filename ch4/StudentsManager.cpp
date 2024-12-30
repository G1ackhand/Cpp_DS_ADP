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

#include "StudentsManager.h"

#include <algorithm>
#include <cstdio>

void StudentsManager::AddStudent(const Student& student) noexcept
{
    students.emplace_back(student);
}

bool StudentsManager::IsVaccin(std::pair<int, int> name) noexcept
{
    std::sort(students.begin(), students.end());

    auto first = students.begin();
    auto last = students.end();

    while(true)
    {
        int len = std::distance(first, last);
        int mid_idx = len / 2;

        auto mid_elm = *(first + mid_idx);

        if(mid_elm.name.first == name.first)
            return !mid_elm.vaccinated;
        else if(mid_elm.name.first < name.first)
            std::advance(first, mid_idx);
        else if(mid_elm.name.first > name.first)
            std::advance(last, -mid_idx);

        if(len == 1)
            break;
    }
    return true;
}