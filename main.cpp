// Created on Sat Dec 28 2024
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

#include <cstdio>
#include <vector>
#include <unordered_map>

#include "ch5/WelshPowell.h"
#include "ch5/Graph.h"

int main()
{
    Graph<int> graph(8);
    GraphMap graph_map;

    graph_map[1] = {{2, 0}, {5, 0}};
    graph_map[2] = {{1, 0}, {5, 0}, {4, 0}};
    graph_map[3] = {{4, 0}, {7, 0}};
    graph_map[4] = {{2, 0}, {3, 0}, {5, 0}, {6, 0}, {8, 0}};
    graph_map[5] = {{1, 0}, {2, 0}, {4, 0}, {8, 0}};
    graph_map[6] = {{4, 0}, {7, 0}, {8, 0}};
    graph_map[7] = {{3, 0}, {6, 0}};
    graph_map[8] = {{4, 0}, {5, 0}, {6, 0}};

    for(int i = 1; i <= graph_map.size(); ++i)
        for(const auto& [dst, weight] : graph_map[i])
            graph.AddEdge({i, dst, weight});

    auto edges = graph.GetEdges();
    auto colors = Coloring(edges, graph_map);

    for(std::size_t i = 0; i < colors.size(); ++i)
        printf("%zu: %d\n", i + 1, colors[i]);

    return 0;
}