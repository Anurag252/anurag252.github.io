---
title: "Maximum Difference Between Adjacent Elements In A Circular Array"
date: "2025-06-12T22:03:13+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.6 MB (80.98%) - LeetSync"
---

```python
class Solution:
    def maxAdjacentDistance(self, nums: List[int]) -> int:
        diff = 0
        for i, k in enumerate(nums):
            diff = max(diff, abs(nums[i-1] - nums[i]))
        return diff


```