---
title: "Largest Combination With Bitwise And Greater Than Zero"
date: "2024-11-07T22:20:50+05:30"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 412 ms (91.25%) | Memory: 26.7 MB (96.06%) - LeetSync"
---

```python
class Solution:
    def largestCombination(self, candidates: List[int]) -> int:
        res = [0] * 24
        t = 1
        for i in range(1,25):
            for k in candidates:
                if k & t != 0:
                    res[i-1] += 1
            t = t << 1
        return max(res)
        


        
```