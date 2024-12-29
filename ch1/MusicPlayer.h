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

#pragma once

#include <string>

#include "CircList.h"

class MusicPlayer
{
public:
    using ScoreTitle = std::string;

    MusicPlayer();
    ~MusicPlayer();

    ScoreTitle& next();
    ScoreTitle& previous();

    void insert(const ScoreTitle& new_track);
    void remove();

    void printall();

private:
    CircList<ScoreTitle> tracks;
    CircList<ScoreTitle>::Iterator now_track;
};