---
title: "Maximum Number Of Coins You Can Get"
date: "2024-05-28T09:20:10+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 498 ms (20.39%) | Memory: 28.9 MB (36.89%) - LeetSync"
---

```python
class Solution:
    import heapq 
    def maxCoins(self, piles: List[int]) -> int:
        #1,3,
        n = int(len(piles)/3)
        piles.sort(reverse=True)
        total = 0
        k = 1
        while k < 3*n - n:
            total = total + piles[k]
            k = k + 2


        return total





        
```