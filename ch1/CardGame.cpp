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

#include "CardGame.h"

#include <cstdio>

CardGame::CardGame()
{
    GamePlayer::PlayerNum num = 0;

    for(auto& player : players)
    {
        GamePlayer new_player(num++);
        player = new_player;
    }
}

CardGame::~CardGame() = default;

void CardGame::Match()
{
    printf("\nMATCHING!!\n------------------\n");

    GamePlayer& p0 = players[0];
    GamePlayer& p1 = players[1];
    GamePlayer& p2 = players[2];
    GamePlayer& p3 = players[3];

    GamePlayer::CardNum n0 = p0.Peek();
    GamePlayer::CardNum n1 = p1.Peek();
    GamePlayer::CardNum n2 = p2.Peek();
    GamePlayer::CardNum n3 = p3.Peek();

    printf("player 0 = %d\n", n0);
    printf("player 1 = %d\n", n1);
    printf("player 2 = %d\n", n2);
    printf("player 3 = %d\n", n3);

    if(n0 == n1)
    {
        p0.Erase();
        p1.Erase();

        if(n0 == n2 && n2 == n3)
        {
            p2.Erase();
            p3.Erase();
        }
    }
    else if(n1 == n2)
    {
        p1.Erase();
        p2.Erase();

        if(n1 == n3 && n3 == n0)
        {
            p0.Erase();
            p3.Erase();
        }
    }
    else if(n2 == n3)
    {
        p2.Erase();
        p3.Erase();

        if(n2 == n0 && n0 == n1)
        {
            p0.Erase();
            p1.Erase();
        }
    }
    else if(n3 == n0)
    {
        p3.Erase();
        p0.Erase();

        if(n3 == n1 && n1 == n2)
        {
            p1.Erase();
            p2.Erase();
        }
    }
}

bool CardGame::IsGameOver() noexcept
{
    for(auto& player : players)
        if(!player.NumCards())
        {
            printf("\nPlayer number (%d) is winner!\n",
                static_cast<int>(player.GetNum()));

            return true;
        }
    return false;
}