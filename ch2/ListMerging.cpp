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

#include "ListMerging.h"

void ListMerging::AddList(std::vector<int> list)
{
    lists.emplace_back(list);
}

std::vector<int> ListMerging::Merge() noexcept
{
    for(int i = 0; i < lists.size(); ++i)
        if(!lists[i].empty())
            heap.push({lists[i][0], i, 0});

    std::vector<int> result;

    while(!heap.empty())
    {
        Node node = heap.top();
        heap.pop();

        result.emplace_back(node.data);

        if(node.index + 1 < lists[node.id].size())
            heap.push({lists[node.id][node.index + 1],
                node.id, node.index + 1});
    }
    return result;
}