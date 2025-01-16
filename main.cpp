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

float GetCirc()

int main()
{
    float a = 100 - 70.33;
    float b = 100 - 79.33;
    float c = 8;

    float d = 1 - 0.072 * (a - b);
    printf("%f\n", c * b * b / a / a * d);
    return 0;
}