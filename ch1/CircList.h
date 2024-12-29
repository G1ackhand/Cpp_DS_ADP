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

#include <stdexcept>

// 원형 리스트
template <typename T>
class CircList
{
public:
    CircList() : head(nullptr) {}

    ~CircList()
    {
        clear();
    }

private:
    struct Node
    {
        T data;
        Node* next;
        Node* prev;
    };

public:
    class Iterator
    {
    public:
        Iterator() = default;
        Iterator(Node* node, Node* head) : curr(node), head(head) {}

        ~Iterator() = default;

        Iterator& operator++() noexcept
        {
            if (curr && curr->next)
            {
                curr = curr->next;
                
                if(curr == head)
                    curr = nullptr;
            }
            return *this;
        }
        
        Iterator operator++(int) noexcept
        {
            Iterator temp = *this;
            ++(*this);
            return temp;
        }

        Iterator& operator--() noexcept
        {
            if(curr && curr->prev)
                curr = curr->prev;
                
            return *this;
        }
        
        Iterator operator--(int) noexcept
        {
            Iterator temp = *this;
            --(*this);
            return temp;
        }

        inline T& operator*() const noexcept
        {
            return curr->data;
        }
        
        inline T* operator->() const noexcept
        {
            return &(curr->data);
        }

        inline bool operator==(const Iterator& other) const noexcept
        {
            return curr == other.curr;
        }

        inline bool operator!=(const Iterator& other) const noexcept
        {
            return !(*this == other);
        }

        friend class CircList;

    private:
        Node* curr;
        Node* head;
    };

    inline Iterator begin() noexcept
    {
        if(!head)
            return Iterator(nullptr, nullptr);

        return Iterator(head, head);
    }

    inline Iterator end() noexcept
    {
        return Iterator(nullptr, head);
    }

    inline bool empty() const noexcept
    {
        return (head == nullptr);
    }

    inline void clear() noexcept
    {
        if(!head)
            return;

        Node* cur = head;

        do
        {
            Node* temp = cur;
            cur = cur->next;
            delete temp;
        }
        while(cur != head);
        head = nullptr;
    }

    inline void push_front(const T& data) noexcept
    {
        Node* new_node = new Node{data, nullptr, nullptr};

        if(!head)
        {
            head = new_node;
            new_node->next = new_node;
            new_node->prev = new_node;
        }
        else
        {
            Node* tail = head->prev;

            new_node->next = head;
            new_node->prev = tail;

            head->prev = new_node;
            tail->next = new_node;

            head = new_node;
        }
    }

    inline void push_back(const T& data) noexcept
    {
        Node* new_node = new Node{data, nullptr, nullptr};

        if(!head)
        {
            head = new_node;
            head->next = head;
            head->prev = head;
        }
        else
        {
            Node* tail = head->prev;

            new_node->next = head;
            new_node->prev = tail;

            head->prev = new_node;
            tail->next = new_node;
        }
    }

    inline void pop_front() noexcept
    {
        if(empty())
            return;
        
        if(head->next == head)
        {
            delete head;
            head = nullptr;
        }
        else
        {
            Node* tail = head->prev;
            Node* temp = head;

            head = head->next;

            head->prev = tail;
            tail->next = head;

            delete temp;
        }
    }

    inline void pop_back() noexcept
    {
        if(empty())
            return;

        if (head->next == head)
        {
            delete head;
            head = nullptr;
        }
        else
        {
            Node* tail = head->prev;
            Node* new_tail = tail->prev;

            new_tail->next = head;
            head->prev = new_tail;
            
            delete tail;
        }
    }

    Iterator erase(Iterator pos) noexcept
    {
        if (pos == end())
            return end();

        Node* node = pos.curr;
        Node* next_node = node->next;
        Node* prev_node = node->prev;

        if (node->next == node)
        {
            delete node;
            head = nullptr;
            return end(); 
        }

        prev_node->next = next_node;
        next_node->prev = prev_node;

        if(node == head)
            head = next_node;

        delete node;

        if(next_node == head)
            return end(); 
        else
            return Iterator(next_node, head);
    }

private:
    Node* head;
};