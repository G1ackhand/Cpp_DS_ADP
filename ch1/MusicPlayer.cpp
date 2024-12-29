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
#include <stdexcept>

#include "MusicPlayer.h"

MusicPlayer::MusicPlayer()
{
    now_track = tracks.end();
}

MusicPlayer::~MusicPlayer()
{
    
}

MusicPlayer::ScoreTitle& MusicPlayer::next()
{
    if(tracks.empty())
        throw std::out_of_range("No Music score in player!\n");

    if(now_track == tracks.end())
        now_track = tracks.begin();
    else
    {
        ++now_track; 

        if(now_track == tracks.end())
            now_track = tracks.begin();
    }
    return *now_track;
}

MusicPlayer::ScoreTitle& MusicPlayer::previous()
{
    if(tracks.empty())
        throw std::out_of_range("No Music score in player!\n");

    if(now_track == tracks.end())
    {
        now_track = tracks.begin();
        --now_track;
    }
    else
    {
        --now_track; 

        if(now_track == tracks.end())
            now_track = tracks.begin();
    }
    return *now_track;
}

void MusicPlayer::insert(const ScoreTitle& new_track)
{
    tracks.push_back(new_track);

    if(now_track == tracks.end())
        now_track = tracks.begin();
}

void MusicPlayer::remove()
{
    if(now_track == tracks.end())
        return;

    now_track = tracks.erase(now_track);
}

void MusicPlayer::printall()
{
    for(const auto& track : tracks)
        printf("%s\n", track.c_str());
}