---
title: "Guess Number Higher Or Lower Ii"
date: "2024-05-25T09:28:38+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 5183 ms (5.11%) | Memory: 19.4 MB (47.10%) - LeetSync"
---

```python
class Solution:
    def __init__(self):
        self.cache = {}
    def getMoneyAmount(self, n: int, start : int = 1, end : int = 200) -> int:
        least_amount = 1000000
        key = str(n) + "#" + str(start)
        if key in self.cache:
            return self.cache[key]
        if start > n:
            self.cache[key] = -1
            return -1 # unfavourable guesses
        if start == n:
            self.cache[key] = 0
            return 0 
        if end == 200 :
            end = n
        for k in range(start, n):
            a = self.getMoneyAmount(k-1, start, end)
            b = self.getMoneyAmount(n, k + 1, end)
            if a != -1 and b != -1:
                least_amount = min(least_amount, k + max(a,b))
            elif a != -1:
                least_amount = min(least_amount, k + a)
            elif b != -1:
                least_amount = min(least_amount, k + b)
        self.cache[key] = least_amount
        return least_amount

        
    #min(m + max(   1 to m-1 -> m1, m+1 , n -> m2)) for all m between 1 to n. 





        
```