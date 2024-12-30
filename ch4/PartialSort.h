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

#include <algorithm>
#include <vector>

template <typename T>
inline auto Divide(
    typename std::vector<T>::iterator first,
    typename std::vector<T>::iterator last)
{
    auto pivot = *first;

    auto i = std::next(first);
    auto j = std::prev(last);

    while(true)
    {
        while(i <= j && *i <= pivot)
            ++i;
            
        while(j >= i && *j > pivot)
            --j;

        if(i > j)
            break;
            
        std::iter_swap(i, j);
        ++i;
        --j;
    }

    std::iter_swap(first, j);
    return j;
}

template <typename T>
inline void Conquer(
    typename std::vector<T>::iterator first,
    typename std::vector<T>::iterator last,
    int k)
{
    auto len = std::distance(first, last);

    if(len <= 1 || k <= 0 || k > len)
        return;

    auto pivot = Divide<T>(first, last);
    auto idx = std::distance(first, pivot);

    if(idx == k - 1)
        std::sort(first, std::next(pivot));
    else if(idx > k - 1)
        Conquer<T>(first, pivot, k);
    else
    {
        std::sort(first, std::next(pivot));
        Conquer<T>(std::next(pivot), last, k - (idx + 1));
    }
}