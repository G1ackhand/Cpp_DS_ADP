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

#include <string>
#include <vector>
#include <algorithm>

template <typename T>
class NTree
{
public:
    NTree() = default;
    NTree(const T& data) : leaves(), root(nullptr), data(data) {}

    ~NTree() = default;

    inline void SetData(const T& leaf) noexcept
    {
        data = leaf;
    }

    inline T GetData() const noexcept
    {
        return data;
    }

    inline std::vector<NTree*> GetLeaves() const noexcept
    {
        return leaves;
    }

    inline void Insert(const T& data) noexcept
    {
        NTree* leaf = new NTree(data);
        leaf->root = this;
        leaves.emplace_back(leaf);
    }

    inline void Update(const T& new_data) noexcept
    {
        data = new_data;
    }

    inline NTree* Search(const T& obj) noexcept
    {
        if(data == obj)
            return this;

        for(auto& leaf : leaves)
            return leaf.Search(obj);
        
        return nullptr;
    }

    inline void Erase(const T& obj) noexcept
    {
        if(!root)
            return;

        NTree* leaf = Search(obj);
        NTree* parent = leaf->root;

        while(!leaf->leaves.empty())
        {
            NTree* child = leaf->leaves.back();
            child->root = leaf->root;

            parent->leaves.emplace_back(child);
            leaf->leaves.pop_back();
        }
        delete leaf;
    }

private:
    std::vector<NTree*> leaves;
    NTree* root;
    T data;
};