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

#include "FileSystem.h"

FileSystem::FileSystem()
{
    directories.SetData({"\\", false});
}

void FileSystem::AddDir(const std::string& dir, bool is_file)
{
    directories.Insert({dir, is_file});
}

void FileSystem::UpdateDir(const std::string& dir)
{
    directories.Update({dir,
        directories.GetData().flag});
}

void FileSystem::PrintAll()
{
    printf("%s\n", directories.GetData().path.c_str());
    
    for(const auto& dir : directories.GetLeaves())
        printf("%s\n", dir->GetData().path.c_str());
}