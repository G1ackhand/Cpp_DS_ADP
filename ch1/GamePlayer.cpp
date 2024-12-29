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

#include "GamePlayer.h"

#include <random>
#include <ranges>
#include <algorithm>

GamePlayer::GamePlayer()
{
    for(std::uint8_t i = 0; i < MAX_CARDS_NUM; ++i)
        cards.emplace_back(i);

    num = 0;
}

GamePlayer::~GamePlayer() = default;

void GamePlayer::Shuffle()
{
    std::random_device rd;  
    std::mt19937 g(rd());
    std::ranges::shuffle(cards, g);
}

void GamePlayer::Erase()
{
    cards.pop_back();
}

GamePlayer::CardNum GamePlayer::Peek() noexcept
{
    Shuffle();
    return cards.back();
}

GamePlayer::CardNum GamePlayer::NumCards() noexcept
{
    return cards.size();
}

GamePlayer::PlayerNum GamePlayer::GetNum() noexcept
{
    return num;
}