---
title: "Minimum Number Of Days To Make M Bouquets"
date: "2024-06-19T12:53:43+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1030 ms (48.25%) | Memory: 23.2 MB (89.51%) - LeetSync"
---

```python
class Solution(object):
    def minDays(self, A, m, k):
        if m * k > len(A): return -1
        left, right = 1, max(A)
        while left < right:
            mid = (left + right) / 2
            flow = bouq = 0
            for a in A:
                flow = 0 if a > mid else flow + 1
                if flow >= k:
                    flow = 0
                    bouq += 1
                    if bouq == m: break
            if bouq == m:
                right = mid
            else:
                left = mid + 1
        return left
        
```