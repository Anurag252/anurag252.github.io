---
title: "Number Of Ways To Split Array"
date: "2025-01-03T10:01:49+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 35 ms (99.78%) | Memory: 32.2 MB (67.48%) - LeetSync"
---

```python
class Solution:
    def waysToSplitArray(self, nums: List[int]) -> int:
        s = sum(nums)
        res = 0
        temp = 0
        for k in nums[:-1]:
            temp += k
            if temp >= (s - temp):
                res += 1
        return res
        
```