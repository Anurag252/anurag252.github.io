---
title: "Can I Win"
date: "2024-05-26T15:48:42+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 7446 ms (5.20%) | Memory: 520.8 MB (5.21%) - LeetSync"
---

```python
class Solution:
    
    def __init__(self):
        from sortedcontainers import SortedSet
        self.dict1 = []
        self.cache = {}

    def canIWin(self, maxChoosableInteger: int, desiredTotal: int) -> bool:
        self.dict1 = ["0"]* (maxChoosableInteger+1)
        self.dict1[0] = "1"
        if (maxChoosableInteger * (maxChoosableInteger + 1)) // 2 < desiredTotal:
            return False
        if desiredTotal <= 0:
            return True
        return self.MoveByA(maxChoosableInteger, desiredTotal)

    def MoveByA(self, maxChoosableInteger: int, desiredTotal: int) -> bool:
        key = f"{desiredTotal}#{','.join(self.dict1)}"

        if key in self.cache:
            return self.cache[key]
        if desiredTotal <= 0:
            return False # B won

        if "0" not in self.dict1:
            print("should never occur")
            return False

        for k in range(1, maxChoosableInteger+1):
            if self.dict1[k] == "0":
                self.dict1[k] = "1"
                key1 = f"{desiredTotal}#{','.join(self.dict1)}"
                if not self.MoveByB(maxChoosableInteger, desiredTotal-k):
                    self.cache[key1] = False
                    self.dict1[k] = "0"
                    self.cache[key] = True
                    return True
                self.cache[key1] = True
                self.dict1[k] = "0"
                
        self.cache[key] = False
        return False

    def MoveByB(self, maxChoosableInteger: int, desiredTotal: int) -> bool:
        key = f"{desiredTotal}#{','.join(self.dict1)}"
        if key in self.cache:
            return self.cache[key]

        if desiredTotal <= 0:
            return False # A won

        if "0" not in self.dict1:
            print("should never occur")
            return False

        for k in range(1, maxChoosableInteger+1):
            if self.dict1[k] == "0":
                self.dict1[k] = "1"
                key1 = f"{desiredTotal}#{','.join(self.dict1)}"
                if not self.MoveByA(maxChoosableInteger, desiredTotal-k):
                    self.cache[key1] = False
                    self.dict1[k] = "0"
                    self.cache[key] = True
                    return True
                self.cache[key1] = True
                self.dict1[k] = "0"
                
        self.cache[key] = False
        return False
        
            
        
```