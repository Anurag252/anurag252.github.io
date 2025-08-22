---
title: "Find All K Distant Indices In An Array"
date: "2025-06-24T13:23:19+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 725 ms (5.23%) | Memory: 17.9 MB (68.60%) - LeetSync"
---

```python
class Solution:
    def findKDistantIndices(self, nums: List[int], key: int, k: int) -> List[int]:
        arr =[]

        for i, m in enumerate(nums):
            if m == key:
                arr.append(i)
        res = set()
        for m in arr:
            for n in range(-k, k+1):
                if m + n >= 0 and m + n < len(nums):
                    res.add(m+n)
        return list(res)


        
```