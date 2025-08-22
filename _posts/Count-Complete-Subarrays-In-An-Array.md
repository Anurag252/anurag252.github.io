---
title: "Count Complete Subarrays In An Array"
date: "2025-04-24T23:01:37+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 499 ms (23.76%) | Memory: 18 MB (75.73%) - LeetSync"
---

```python
class Solution:
    def countCompleteSubarrays(self, nums: List[int]) -> int:
        s = set(nums)
        unique = len(s)
        res = 0
        for i , k in enumerate(nums):
            a = set()
            for j , l in enumerate(nums[i:]):
                a.add(l)
                if len(a) == unique:
                    res += (len(nums) - j - i)
                    break
        return res




        
```