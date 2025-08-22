---
title: "Check If Array Is Sorted And Rotated"
date: "2025-02-02T10:38:58+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 17.8 MB (29.61%) - LeetSync"
---

```python
class Solution:
    def check(self, nums: List[int]) -> bool:
        inflextion = False
        for idx, k in enumerate(nums):
            if idx == 0:
                continue
            if k < nums[idx-1] and  inflextion:
                return False
            if k >= nums[idx-1] and not inflextion:
                continue
            else :
                inflextion = True

        if inflextion and nums[-1] > nums[0]:
            return False
        return True



        
```