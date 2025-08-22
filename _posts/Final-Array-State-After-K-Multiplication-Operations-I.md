---
title: "Final Array State After K Multiplication Operations I"
date: "2024-12-16T08:02:44+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 11 ms (5.92%) | Memory: 17.4 MB (11.77%) - LeetSync"
---

```python
class Solution:
    def getFinalState(self, nums: List[int], k: int, multiplier: int) -> List[int]:
        h = []

        for idx, m in enumerate(nums):
            heapq.heappush(h, (m, idx))
        
        while(k > 0):
            (item, idx) = heapq.heappop(h)
            heapq.heappush(h, (item * multiplier , idx))
            k -= 1
        h.sort(key= lambda x : x[1])
        return list(map(lambda x : x[0], h))
        

        
```