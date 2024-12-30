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

#include <vector>

template <typename T>
struct Edge
{
    int src;
    int dst;
    T weight;

    inline bool operator<(const Edge& other) const
    {
        return this->weight < other.weight;
    }


    inline bool operator>(const Edge& other) const
    {
        return this->weight > other.weight;
    }
};

template <typename T>
class Graph
{
public:
    Graph(int n) : num_vtx(n) {}
    ~Graph() = default;

    inline int GetNumVertices() const noexcept
    {
        return num_vtx;
    }

    inline std::vector<Edge<T>>& GetEdges() noexcept
    {
        return edges;
    }

    inline std::vector<Edge<T>> GetEdges(int vtx) const noexcept
    {
        std::vector<Edge<T>> result;

        for(const auto& edge: edges)
            if(edge.src == vtx)
                result.emplace_back(edge);

        return result;
    }

    inline void AddEdge(Edge<T>&& edge)
    {
        if(edge.src <= 0 || edge.src > num_vtx
        || edge.dst <= 0 || edge.dst > num_vtx)
            return;

        edges.emplace_back(edge);
    }

private:
    std::vector<Edge<T>> edges;
    int num_vtx;
};