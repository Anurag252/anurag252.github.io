---
title: "Minimum Window Substring"
date: "2024-06-02T23:56:09+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 144 ms (44.08%) | Memory: 17.4 MB (36.26%) - LeetSync"
---

```python
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not t or not s:
            return ""
        
        from collections import Counter
        
        t_count = Counter(t)
        current_count = Counter()
        
        start = 0
        min_len = float('inf')
        min_start = 0
        
        required = len(t_count)
        formed = 0
        
        l, r = 0, 0
        
        while r < len(s):
            character = s[r]
            current_count[character] += 1
            
            if character in t_count and current_count[character] == t_count[character]:
                formed += 1
            
            while l <= r and formed == required:
                character = s[l]
                
                if r - l + 1 < min_len:
                    min_len = r - l + 1
                    min_start = l
                
                current_count[character] -= 1
                if character in t_count and current_count[character] < t_count[character]:
                    formed -= 1
                
                l += 1
            
            r += 1
        
        if min_len == float('inf'):
            return ""
        else:
            return s[min_start:min_start + min_len]

                                       
    def contains(self, k : str, ls : [int]) -> bool:
        if k.isupper():
                return ls[ord(k)-65] != 5000
        else:
                return ls[ord(k.upper())-39] != 5000

    def reduce(self, k : str, ls : [int] ) -> [int]:
        if k.isupper():
                ls[ord(k)-65] = ls[ord(k)-65]  - 1
        else:
                ls[ord(k.upper())-39] = ls[ord(k.upper())-39]  - 1
        return ls

    def increase(self, k : str, ls : [int] ) -> [int]:
        if k.isupper():
                ls[ord(k)-65] = ls[ord(k)-65]  + 1
        else:
                ls[ord(k.upper())-39] = ls[ord(k.upper())-39]  + 1
        return ls


    def get(self, k : str, ls : [int]) -> int:
        if k.isupper():
                return ls[ord(k)-65]
        else:
                return ls[ord(k.upper())-39]
    
    def is_complete(self, s : str, ls : [int]) -> bool:
        for k in s:
            if k.isupper():
                
                if not ls[ord(k)-65] <= 0:
                    return False
            else:
                print(s, False)
                if not ls[ord(k.upper())-39] <= 0:
                        return False
        return True

        
```