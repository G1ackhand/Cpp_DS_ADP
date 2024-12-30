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

#include "Graph.h"

#include <vector>
#include <algorithm>
#include <unordered_map>
#include <cstdio>

using GraphMap = std::unordered_map<int, std::vector<std::pair<int, int>>>;

inline void PrintGraph(GraphMap& graph) noexcept
{
    printf("[Input Graph]\n");

    for(int i = 1; i <= graph.size(); ++i)
    {
        printf("%d:\t", i);

        for(const auto& [dst, weight] : graph[i])
            printf("{%d, %d}, ", dst, weight);
        printf("\n");
    }
    printf("\n");
}

inline void PrintDegree(
    const std::vector<Edge<int>>& edges, GraphMap& graph) noexcept
{
    std::vector<Edge<int>> result = {edges[0]};

    for(const auto& edge : edges)
        if(result.back().src != edge.src)
            result.emplace_back(edge);

    for(const auto& edge : result)
        printf("%d(%zu)\n", edge.src, graph[edge.src].size());
    printf("\n");
}

inline std::vector<int> Coloring(
    const std::vector<Edge<int>>& edges, GraphMap& graph) noexcept
{
    PrintGraph(graph);

    std::vector<Edge<int>> sorted_edges = edges;

    std::sort(sorted_edges.begin(), sorted_edges.end(),
        [&](const Edge<int> lhs, const Edge<int> rhs)
        {
            return graph[lhs.src].size() > graph[rhs.src].size();
        });
    
    PrintDegree(sorted_edges, graph);

    std::vector<int> colors(8, 0);
    int now_color = 0;

    for(std::size_t i = 0; i < sorted_edges.size() - 1; ++i)
    {
        auto now_edge = sorted_edges[i];
        
        if(colors[now_edge.src - 1] == 0)
            colors[now_edge.src - 1] = ++now_color;

        for(std::size_t j = i + 1; j < sorted_edges.size(); ++j)
        {
            if(colors[sorted_edges[j].src - 1] == 0
                && now_edge.dst == sorted_edges[j].src)
                colors[sorted_edges[j].src - 1] = now_color;
        }
    }
    return colors;
}