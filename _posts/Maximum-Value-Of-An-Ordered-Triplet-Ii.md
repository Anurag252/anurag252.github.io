---
title: "Maximum Value Of An Ordered Triplet Ii"
date: "2025-04-03T08:00:41+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 186 ms (51.88%) | Memory: 29.4 MB (87.03%) - LeetSync"
---

```python
class Solution:
    def maximumTripletValue(self, nums: List[int]) -> int:
        mx , diff , prod = 0, 0, 0
        
        for i, k in enumerate(nums):
            prod = max(prod, diff * k)
            diff = max(diff, mx - k)
            mx = max(mx, k)
            
        return prod

        
```