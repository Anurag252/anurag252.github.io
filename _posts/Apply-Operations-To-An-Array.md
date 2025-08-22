---
title: "Apply Operations To An Array"
date: "2025-03-01T05:15:43+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 1 ms (49.72%) | Memory: 17.8 MB (94.08%) - LeetSync"
---

```python
class Solution:
    def applyOperations(self, nums: List[int]) -> List[int]:
        arr = []

        for i, k in enumerate(nums):
            if i == len(nums) -1 :
                continue
            if nums[i] == nums[i+1]:
                nums[i] = nums[i] * 2
                nums[i+1] = 0
        
        for k in nums:
            if k != 0:
                arr.append(k)

        for i in range(len(nums) - len(arr)):
            arr.append(0)
        return arr


        
```