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

#include <cstdint>
#include <vector>

class GamePlayer
{
public:
    using CardNum = std::uint8_t;
    using PlayerNum = std::uint8_t;

    inline static constexpr CardNum MAX_CARDS_NUM = 13;

    GamePlayer();

    GamePlayer(PlayerNum num) : cards(), num(num)
    {
        for(std::uint8_t i = 0; i < MAX_CARDS_NUM; ++i)
            cards.emplace_back(i);
    }

    ~GamePlayer();

    void Shuffle();
    void Erase();

    CardNum Peek() noexcept;
    CardNum NumCards() noexcept;
    
    PlayerNum GetNum() noexcept;

private:
    std::vector<CardNum> cards;
    PlayerNum num;
};