---
title: "Check If A Word Occurs As A Prefix Of Any Word In A Sentence"
date: "2024-12-02T08:53:25+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 4 ms (100.00%) | Memory: 17.2 MB (5.67%) - LeetSync"
---

```python
class Node:
    def __init__(self):
        self.end = False
        self.mp = {}
        self.curr = ""
        self.count = []


class Trie:
    def __init__(self):
        self.root = Node()
        self.temp = self.root
        

    def insert(self, s, temp, count):
        
        if temp == None:
            temp = self.root
        print(s, temp.mp)
        if len(s) == 0:
            return
        set_end = False
        if s[0] in temp.mp:
            temp.count.append((count, s[0]))
            temp = temp.mp[s[0]]
            self.insert(s[1:], temp, count)

        else:
            temp.mp[s[0]] = Node()
            temp.curr = s[0]
            temp.count.append((count, s[0]))
            temp = temp.mp[s[0]]
            print(temp)
            self.insert(s[1:], temp, count)

    def isprefix(self, s, temp):
       
        if temp == None:
            temp = self.root
            #return min(temp.count) if s[0] in temp.mp  and len(temp.count) > 0 else -1 #and temp[s[0]].end

        #print(s, temp.mp, temp.count)
        #isending = False
        if len(s) == 1 and s[0] in temp.mp:
                #print(temp.count)
                for k in temp.count:
                    if k[1] == s:
                        return k[0]
                return -1
        
        if s[0] in temp.mp:
            return self.isprefix(s[1:], temp.mp[s[0]]) 
        else:
            return -1



class Solution:
    def isPrefixOfWord(self, sentence: str, searchWord: str) -> int:
        t = Trie()
        for idx,k in enumerate(sentence.split(' ')):
            t.insert(k, None, idx+1)
            #print(t)
        return t.isprefix(searchWord, None)


        
```