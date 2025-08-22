---
title: "Maximum Difference Between Even And Odd Frequency I"
date: "2025-06-10T06:54:45+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.8 MB (76.29%) - LeetSync"
---

```python
class Solution:
    def maxDifference(self, s: str) -> int:
        mp = {}

        for k in s:
            if k not in mp:
                mp[k] = 0
            mp[k] += 1
        even = 100000
        odd = 0
        for k, v in mp.items():
            if v % 2 == 0:
                even = min(even, v)
            else:
                odd = max(odd, v)
        return odd - even

        
```